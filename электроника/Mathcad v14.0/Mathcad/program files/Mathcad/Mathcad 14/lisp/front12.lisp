(in-package  "front12")

(lisp.load   "lisp.lisp")

(defun get-from-registry (setting)
  (let ((get (lambda (key)
               (ignore-errors
                 (GetValue
                  (OpenSubKey key
                              (strcat "Software\\Mathsoft\\"
                                      *regkey-productname*
                                      "\\Default\\AppSettings"))
                  setting)))))
    (or (get Microsoft.Win32.Registry.CurrentUser)
        (get Microsoft.Win32.Registry.LocalMachine))))

(defun get-bool-from-registry (setting)
  (let ((r (get-from-registry setting)))
    (and r (> r 0))))

;; This needs to be set before the ftime macro is
;; expanded anywhere -- i.e., it can't be done in
;; iengine/initialize.
(setf *engine-timing* (get-bool-from-registry "EngineTiming"))

(setf *log* (get-bool-from-registry "FrontEndLogging"))
(if *log*
    (let ((logdir (or
                   (ignore-errors
                     (System.Environment.GetEnvironmentVariable "MS_LOGDIR"))
                   ".")))
      (setf lisp.*out* (mslisp.FileStream
                        (System.IO.Path.Combine logdir "front12.log")))))



(defmacro log (&rest args)
  (if *log*
      `(progn ,@(mapcar (lambda (a) `(progn (write (prin1-to-string ,a))
                                      (write " ")))
                        args)
        (writeln ""))
      nil))

(defmacro ftime (message &rest forms)
  (if *engine-timing*
      `(unwind-protect (progn (Engine.Timing2.Start ,message)
                              ,@forms)
        (Engine.Timing2.Stop ,message))
      ;; Note: no runtime overhead if there's only one form,
      ;; since the interpreter treats (progn x) as simply x.
      `(progn ,@forms)))

;; Set up the load path
(defun setup-load-path ()
  (let* ((binfo (System.IO.DirectoryInfo
                 (get_BaseDirectory (System.AppDomain.get_CurrentDomain))))
         (base    (get_FullName binfo))
         (bparent (get_FullName (get_Parent binfo)))
         (add-subdirs (lambda (dir)
                        (mapcar (lambda (d)
                                  (add-to-load-path
                                   (System.IO.Path.Combine dir d)))
                                '("bin" "mpl" "lisp")))))
    (add-to-load-path base)
    (add-subdirs base)
    (add-subdirs bparent)))

(setup-load-path)

(if *debug*
    (defun dllname (base) (strcat base "d.dll"))
    (defun dllname (base) (strcat base "r.dll")))

;; TODO: Get rid of circular dependency between this file
;; and solve.lisp
(export 'make-error-region 'make-result 'make-eng-result 'eng-node
        'lisp-action 'def-action 'def-action-from-expr
        'def1-action 'def1-action-sym 'def1-action-exp
        'def1-from-expr 'eval-action 'to-arraylist
        'lookup '*front-to-ce* 'make-primary
        'member-t 'log 'add-bindings 'make-sym-def 'make-normal-def
        'make-sym-lhs 'make-sym-rhs 'make-exp-lhs 'make-exp-rhs
        'has-errors 'print-result 'is-mc-var)


(lisp.load   "nodes.lisp")
(use-package "front12.nodes")

(lisp.load   "solve.lisp")
(use-package "front12.solve")


;; Initialization function called from front12.cpp.

(defun iengine/initialize ()
  (setf *engine-pool-size*
        (let ((r (get-from-registry "EnginePoolSize")))
          (or r 3)))

  ;; Under MC14 symbolics, these transformations are handled
  ;; in the translator.
  (defun prewrite (expr) expr)

  ;; Make sure assembly cache directory exists
  (setf *local-assebly-cache*
        (System.IO.Path.Combine *app-data* "LocalAssemblyCache"))
  (System.IO.Directory.CreateDirectory *local-assebly-cache*)

  (reset_path_cache *interpreter*)
  (setup-load-path)
  (mapcar load-dll '("mplrun.dll" "automationmgd.dll" "componentsmgd.dll"))
  ;; NLK - efisymbolics is needed for Efi.Symbolics.RequestInterrupt
  (mapcar (compose load-dll dllname)
          '("msclr" "msgen" "mcdepman" "mccore12" "mcfront12"
            "efisymbolics"))
  ;;(Efi.Symbolics.Initialize)
  (setf *threads*           (or (get-from-registry "ThreadsPerDoc")  1))
;  (setf *idle-calc-enabled* (or (get-from-registry "EnableIdleCalc") 0))
  (setf *queue* (Engine.EngQueue))
  ;;(if (and (> *threads* 0)
  ;;         (> *idle-calc-enabled* 0))
  ;;    (SetIdleTask *queue* on-idle))
  (SetBusyCallback
   *queue*
   (lambda (b)
     ;; 3 indicates busy, 4 not busy; see document.h
     (if *notify* (*notify* 0 (if b 3 4)))))
;;  (setf *abort-mutex*  (GetMutex *queue*))
  (setf *mutex*        (Engine.SafeMutex "FrontEnd"))
  (setf *engine-mutex* (Engine.SafeMutex "FrontEnd_Engine"))
  (setf *ignore-mutex* (Engine.SafeMutex "FrontEnd_Ignore"))
  (setf *cache-mutex*  (Engine.SafeMutex "FrontEnd_Cache"))
  (setf *assembly-mutex* (Engine.SafeMutex "Assembly" 1))
  (setf *front-cached-values*    (make_hash_table))
  (setf *front-cached-functions* (make_hash_table))
  ;; The engine and the front-end dependency analyzer
  (setf *depman* (depman.Depman))
  (setf *node-count* 0)
  (RegisterNotify *depman* fnotify-callback)
  (setf *engine* (Engine.MCCore12))
  (setf *dummy* (depman.ConstAction nil))
  (setf *top-top-node* (AddAfter *depman* 0              *dummy* 0))
  (setf *globals-node* (AddAfter *depman* *top-top-node* *dummy* 0))
  (setf *doc-top-node* (AddAfter *depman* *globals-node* *dummy* 0))

  ;; Hash tables mapping frontend nodes to ce nodes
  ;; and vice versa

  ;; maps a front-end node to a list of ce nodes above the globals
  (setf *front-to-top-top* (make-node-map *top-top-node*
                                          make-ce-node delete-ce-node))

  ;; maps a front-end node to a list of ce nodes "at
  ;; the top of the document"
  (setf *front-to-globals* (make-node-map *globals-node*
                                          make-ce-node delete-ce-node))

  ;; maps a front-end node to a list of ce nodes
  (setf *front-to-ce* (make-node-map *doc-top-node*
                                     make-ce-node delete-ce-node))

  ;; maps a ce node to a frontend node
  (setf *ce-to-front* (make_hash_table))

  ;; Anticipate what the make system will do by loading any
  ;; assemblies in the local assembly cache
  ;;(if (> *engine-pool-size* 0)
  ;;    (load-local-assembly-cache))

  ;; options table
  (setf *option-values*    (make_hash_table))

  ;; maps front-end nodes to dependency-analyzer nodes
  (setf *primary-node-map* (make_hash_table))

  (setf *loaded-files*     (make_hash_table))

  ;;; imports
  (setf *imports-for-builtins*
        `(("McdTranslator" ""      "false" "false")
          ("McdEfi"        "MC_mc" "true"  "false" ("mc_sec" "mc_pF" "mc_min"))
          ("McdEfi"        "MC_mc" "false" "true"  ("mc_sec" "mc_pF" "mc_min"))))

  ;; builtin table
  (setf *builtin-values* (make_hash_table))
  (setf *builtin-nodes*  (make_hash_table))

  (apply load-rec (mapcar car *imports-for-builtins*))
)


;; Threading support

(defmacro on-worker-thread (&rest body)
  `(AddTask *queue* (lambda () (progn ,@body))))

(defmacro on-new-thread (&rest body)
  `(Engine.ThreadingUtils.Spawn (lambda () (progn ,@body))))

;; For dealing with tags

;; eqt is now in Standardbuiltins.
;;(defun eqt (x y)
;;  (and (atom x) (atom y) (EqualsNoTags x y)))

(defun member-t (x l)
  (if l
      (if (eqt x (car l))
          l
        (member-t x (cdr l)))))


;; Threading support

(defmacro with-lock (mutex body)
  `(unwind-protect
       (progn
         (WaitOne ,mutex)
         ,@body)
     (ReleaseMutex ,mutex)))

(defmacro try-lock (mutex body)
  `(and (WaitOneWithTimeout ,mutex 500)
        (unwind-protect
            (progn ,@body)
          (ReleaseMutex ,mutex))))

(defmacro with-mutex-lock (&rest body)
  `(with-lock *mutex* ,body))

(defmacro with-ignore-lock (&rest body)
  `(with-lock *ignore-mutex* ,body))

(defmacro with-cache-lock (&rest body)
  `(with-lock *cache-mutex* ,body))

(defmacro with-assembly-cache-lock (&rest body)
  `(with-lock *assembly-mutex* ,body))

(defmacro with-engine-lock (&rest body)
  `(with-lock *engine-mutex* ,body))
(defmacro try-engine-lock (&rest body)
  `(try-lock *engine-mutex* ,body))

;; Functions for manipulating cached values

(defun set-front-value (fnode x)
  (let ((prev-val nil))
    (with-cache-lock
     (let ((cv (get_hash *front-cached-values* fnode)))
       (if cv
           (setf prev-val cv)))
     (if x
         (set_hash    *front-cached-values* fnode x)
         (remove_hash *front-cached-values* fnode)))
    
    (if x
        (fnotify fnode depman.Status.NODE_READY)
        ;; else
        (if prev-val
            (fnotify fnode depman.Status.NODE_INVALID))))
  x)

(defun get-front-value (fnode)
  (with-cache-lock (get_hash *front-cached-values* fnode)))

(defun front-eval (fnode)
  (let ((ce-node (get_hash *primary-node-map* fnode)))
    (set-front-value fnode
                     (if ce-node
                         (GetAllValues *depman* ce-node)
                         *default-value*))))

;; Notification callbacks

(defun fnotify (fnode status)
  (and *notify*
       (equal (get-ignore-count fnode) 0)
       (*notify* fnode status)))

(defun fnotify-callback (ce-node status)
  (let ((fnode (get_hash *ce-to-front* ce-node)))
    (if fnode 
        (if (equal status depman.Status.NODE_INVALID)
            (set-front-value fnode nil)
            ;; else
            (fnotify fnode status)))))

(setf *ignore* (make_hash_table))
(defun set-ignore-count (n c)
  (with-ignore-lock
   (if (equal c 0)
       (remove_hash *ignore* n)
     (set_hash *ignore* n c))))
(defun get-ignore-count (n)
  (with-ignore-lock
   (if (contains_hash *ignore* n)
       (get_hash *ignore* n)
     0)))

(defmacro with-ignore-notify (fnode &rest forms)
  `(unwind-protect (progn 
                     (set-ignore-count ,fnode (+ (get-ignore-count ,fnode) 1))
                     ,@forms)
    (set-ignore-count ,fnode (- (get-ignore-count ,fnode) 1))))

;; Idle-time processing

;(defun on-idle ()
;  (let ((fnodes (GetHandles *depman*)))
;    (mapenum
;     (lambda (fnode) (progn
;                       (or (get-front-value fnode)
;                           (front-eval fnode))))
;     fnodes)))


;; Functions used to implement the IEngine interface

(defun iengine/add-after (n expr-string ilazy)
  (let ((fnode (incf *node-count*)))
    (on-worker-thread
     (insert-front-node *front-to-top-top* n fnode t)
     (insert-front-node *front-to-globals* n fnode t)
     (insert-front-node *front-to-ce*      n fnode t)
     (update fnode expr-string (> ilazy 0)))
    fnode))

(defun iengine/add-before (n expr-string ilazy)
  (let ((fnode (incf *node-count*)))
    (on-worker-thread
     (insert-front-node *front-to-top-top* n fnode nil)
     (insert-front-node *front-to-globals* n fnode nil)
     (insert-front-node *front-to-ce*      n fnode nil))
    fnode))

(defun iengine/remove (n)
  (set-ignore-count n 1)
  (on-worker-thread
   (remove-front-node *front-to-top-top* n)
   (remove-front-node *front-to-globals* n)
   (remove-front-node *front-to-ce*      n)
   (clear-primary n)
   (set-ignore-count n 0)))


(defun iengine/update (n expr-string ilazy)
  (with-ignore-notify n (set-front-value n nil))
  (on-worker-thread
   (update n expr-string (> ilazy 0))))

(defun update (n expr-string lazy?)
  (with-ignore-notify n
    (delete-ce-nodes *front-to-ce*      n)
    (delete-ce-nodes *front-to-globals* n)
    (delete-ce-nodes *front-to-top-top* n)
    (clear-primary n))
  (let ((rl-string (TreeToRL.Convert expr-string)))
    (ftime "make-action"
           (make-action
            n
            (read-from-string rl-string)
            lazy?))
    (fnotify n depman.Status.NODE_SYNC)))

(defun iengine/get-value-async (n)
  (or (get-front-value n)
      (progn (on-worker-thread
              (or (get-front-value n)
                  (front-eval n)))
             *pending-value*)))

(defun iengine/get-value-at (n name)
  (let ((ce-node (or (last-ce-node *front-to-ce*      n)
                     (last-ce-node *front-to-globals* n)
                     (last-ce-node *front-to-top-top* n))))
    (get-value-at ce-node name)))

(defun get-value-at (ce-node name)
  (or (and ce-node
           (let* ((vname (strcat "value " name))
                  (tname (strcat "type " name))
                  (dict  (GetValueAt *depman* ce-node vname)))
             (and dict
                  (let* ((value   (get-hash dict vname))
                         (type    (get-hash dict tname))
                         (newdict (make_hash_table))
                         (result  (McdTranslator.values.result value type)))
                    (progn (set-hash newdict "%result" result)
                           newdict)))))
      (make-result `(("%result"
                      ,nil)))))

(defun iengine/get-last-available (name)
  (let ((h (with-mutex-lock (GetLastHandle *depman*))))
    (get-value-at h name)))

(defun iengine/is-bound-at (n name)
  (try-engine-lock
   (let ((ce-node (or (last-ce-node *front-to-ce*      n)
                      (last-ce-node *front-to-globals* n)
                      (last-ce-node *front-to-top-top* n))))
     (and ce-node
          (let ((vname (strcat "value " name)))
            (IsBoundAt *depman* ce-node vname))))))

(defun iengine/unload ()
  (setf *notify* nil)
  (with-engine-lock
      (DisableDeps *depman*))
  (EmptyQueue *queue*)
  (Efi.Symbolics.RequestInterrupt (get_ManagedThreadId *queue*))
  (on-worker-thread
   (ignore-errors     
     (setf *queue* nil)
     (Unload *depman*)
     (setf *depman* nil)
     (Unload *engine*)
     (setf *engine* nil)
     (Engine.SafeMonitor.Free)
     (mapcar Free (list *mutex* *engine-mutex* *ignore-mutex* *cache-mutex*))
     (System.AppDomain.Unload (System.AppDomain.get_CurrentDomain))))
  ;;(ReflectionCounter.ReportCounts)
  )

(defun iengine/get-option (s)
  (cond ((equal s "the_unit_system")
         *unit-system*)
        ((equal s "live_regions")
         (System.Double.Parse "1.0"))
        (t (get_hash *option-values* s))))

(defun iengine/set-option (s v)
  (on-worker-thread
   (if (equal s "disable_messages")
       (if v
           (DisableDeps *depman*)
           (EnableDeps  *depman*))
       ;; else
       (SetOption *engine* s v)))
  (set_hash *option-values* s v))

(defun iengine/request-echo (h n)
  (on-worker-thread
   (and *notify* (*notify* h n))))

(defun iengine/enable-threading (b)
  (if (> *threads* 0)
      (EnableThreading *queue* b)))

(defun iengine/stop-worker ()
  (if (> *threads* 0)
      (progn
        (Efi.Symbolics.RequestInterrupt (get_ManagedThreadId *queue*))
        (EmptyQueue *queue*)
        (StopWorker *queue*))))

(defun iengine/wait-empty ()
  (if (> *threads* 0)
      (WaitEmpty *queue*)))

(defun iengine/start-worker ()
  (if (> *threads* 0)
      (progn
        (StartWorker *queue*)
        (Efi.Symbolics.UnRequestInterrupt (get_ManagedThreadId *queue*)))))

(defun iengine/resume-worker ()
  (if (> *threads* 0)
      (ResumeWorker *queue*)))

(defun iengine/suspend-worker ()
  (if (> *threads* 0)
      (SuspendWorker *queue*)))

;; Sometimes the engine returns a null value for %result
(defun fix-eng-result (r)
  (progn (if (and r
                  (not (get-hash r "%errors"))
                  (not (get-hash r "%result")))
             (set-hash r "%result" "true"))
         r))


;; Functions for processing RL into ARL.

; (defmacro chain (expr)
;   `(Engine.LispEval *interpreter* nil nil ',expr))

(defun make-action (fnode expr lazy?)
  (handler-case
      (let ((expr (prewrite expr)))  ; do early simple rewrites
        (destructuring-bind (has-block-terminator? has-sym?)
            (front12.scan-bt-sym expr)
          (pp-process fnode expr has-block-terminator? has-sym? lazy?)))
    (error (e) (make-primary-action
                fnode t
                (lambda (env) (error-dict-from-condition e))))))

(setf *ppd-table* (make_hash_table))
(defmacro pp-entry (key &rest body)
  `(set-hash *ppd-table* ',key (lambda (fnode head tag expr)
                                 (progn ,@body))))

(defmacro pp-entries (&rest entries)
  `(progn ,@(ppe-helper entries)))

(defun ppe-helper (entries)
  (if entries
      (cons `(set-hash *ppd-table* ',(car entries)
                       (lambda (fnode head tag expr
                                      has-block-terminator?
                                      has-sym?
                                      lazy?)
                         ,(cadr entries)))
            (ppe-helper (cdr (cdr entries))))))

(defun pp-dispatch (fnode head tag expr
                          has-block-terminator?
                          has-sym?
                          lazy?)
  (let ((handler (get-hash *ppd-table* head)))
    (if handler (handler fnode head tag expr
                         has-block-terminator?
                         has-sym?
                         lazy?))))


;; Dispatch table for the front end.  It's specified as
;; a list of the form
;;
;; <symbol> <handler code> <symbol> <handler code> ...
;;
;; Each <symbol> is a top-level RL construct.  The corresponding
;; handler code can assume that the symbols fnode, head, tag, expr,
;; has-block-terminator?, has-sym? and lazy? are bound when it
;; executes.
;;
;; All this is implemented by the functions and macros above.

(pp-entries
 compile-worksheet-and-load-assembly  (make-compile-and-load (cdr expr))
 compile-mpl-file-and-load-assembly   (make-compile-mpl-file fnode (cdr expr))
 compile-mpl-string-and-load-assembly (make-compile-mpl-string 
                                       fnode (cdr expr))

 set-imports            (make-imports fnode (cdr expr))
 import                 (make-imports fnode (cdr expr))
 load-assembly          (apply make-load-mpl-assembly
                               fnode (cdr expr))
 define-top             (make-top-def fnode tag
                                      (nth 1 expr)
                                      (nth 2 expr))
 define-top-top         (make-top-top-def fnode tag
                                          (nth 1 expr)
                                          (nth 2 expr))
 global                 (make-global-def fnode lazy? tag
                                         (nth 1 expr)
                                         (lambda (env) (nth 2 expr)))

 define-symbolic       (make-sym-def fnode lazy? tag nil expr)

 global-symbolic       (make-sym-def fnode lazy? tag t   expr)

 define-numeric        (make-num-def fnode lazy? tag nil expr)

 global-numeric        (make-num-def fnode lazy? tag t   expr)

 define                 (cond (has-block-terminator?
                               (progn (log fnode "block terminator:" expr)
                                      (close-block fnode lazy? expr nil)))
                              ((component-def-p expr)
                               (make-component-def
                                fnode tag (nth 1 expr) (nth 2 expr)))
                              ;; special case for Mathcad's x:=x semantics
                              ((eqt (nth 1 expr) (nth 2 expr))
                               (let ((lhs (make-sym-lhs (nth 1 expr))))
                                 (undefine-node fnode lazy? lhs)))
                              (t (make-normal-def
                                  fnode lazy? head (nth 1 expr) 
                                  (lambda (env) (nth 2 expr)))))

 eval-top-top           (make-primary 
                         fnode (eng-node-top-top
                                fnode lazy?
                                (eval-action `(eval ,(nth 1 expr)))))
 ;; for internal use
 eval-1                 (make-primary
                         fnode (eng-node fnode lazy? 
                                         (eval-action (nth 1 expr))))

 eval                   (cond
                          ;; Look for (numeric (numeric ...))
                          ;; That means we're dealing with ...->...=
                          ((and (not (atom (nth 1 expr)))
                                (eqt (car (nth 1 expr)) 'numeric)
                                (let ((e (nth 1 expr)))
                                  (and (not (atom (nth 1 e)))
                                       (eqt (car (nth 1 e)) 'numeric)))
                                has-sym?)
                           (make-rhs-eval fnode tag expr))

                          (has-block-terminator?
                           (progn (log fnode "block terminator:" expr)
                                  (close-block fnode lazy? expr nil)))

                          (t (make-primary 
                              fnode (eng-node fnode lazy? 
                                              (eval-action expr)))))
)

(defun pp-process (fnode expr has-block-terminator? has-sym? lazy?)
  (let* ((head (if (atom expr) nil (no-tag (car expr))))
         (tag  (if head (find-tag (car expr)) nil))
         (ppd  (if head (pp-dispatch fnode head tag expr
                                     has-block-terminator?
                                     has-sym?
                                     lazy?))))
    (cond (ppd                 nil)
          ((given-p expr)      (make-given fnode))
          ((constraint-p expr) (progn (log fnode "constraint:" expr)
                                      (make-constraint fnode lazy? expr)))
          (t                   nil))))


(defun lookup (env name)
  (let ((d (Lookup env name)))
    (and d (get_hash d name))))

(defun lisp-action (defs lam)
  (Engine.LispEval defs 
                   (lambda (env)
                     (handler-case
                         (lam env)
                       (error (e) (error-dict-from-condition e))))
                   nil))

(defun eval-action (expr)
  (Engine.LispEval
   (to-arraylist nil)
   (lambda (env)
     (let ((%%imports (lookup env "%%imports")))
       (NewAction 
        *engine* (prin1-to-string `(import ,%%imports ,expr)))))
   nil))

;; Replace an action with another which does the same thing, but then
;; hooks the next action, or applies f to the result.
(defun hook-action (action f)
  (lisp-action 
   (GetDefs action)
   (lambda (env)
     (let* ((r    (Invoke action env))
            (next (GetNext r)))
       (if next
           (ReplaceNext   r (hook-action next f))
           ;; else
           (ReplaceResult r (f (GetResult r))))))))
  
(defmacro log-action-errors (lhs action)
  (if *log*
      `(hook-action ,action (lambda (result)
                              (if (has-errors result)
                                  (progn
                                    (log "action chain produced errors, lhs = "
                                         ,lhs)
                                    (print-result result)))
                              result))
      ;; note: no runtime overhead if we're not logging
      action))

(defun def-action (def lhs rhs-f)
  (Engine.LispEval
   (expand-translator-defs (get-defined-vars lhs))
   (lambda (env)
     (handler-case
      (log-action-errors
       lhs (eval-action `(,def ,lhs ,(rhs-f env))))
       ;; Invoking rhs-f could signal an error, which should
       ;; be a dictionary with a "%errors" key.
       (error (e) (error-dict-from-condition e))))
   nil))


(defun def1-action (def lhs rhs)
  (def-action def lhs (lambda (env) rhs)))

(defun def1-action-sym (def lhs rhs)
  (def-action def (make-sym-lhs lhs) (lambda (env) (make-sym-rhs lhs rhs))))

(defun def1-action-exp (def lhs rhs)
  (def-action def (make-exp-lhs lhs) (lambda (env) (make-exp-rhs lhs rhs))))

(defun def1-from-expr (def-f expr)
  (destructuring-bind (def lhs rhs) expr
    (def-f def lhs rhs)))


(defun make-primary-action (fnode lazy? lam)
  (let ((action (lisp-action nil lam)))
    (make-primary fnode (eng-node fnode lazy? action))))
                

(defun eng-node (fnode lazy? action)
  (new-ce-node *front-to-ce* fnode lazy? action))

(defun eng-node-global (fnode lazy? action)
  (new-ce-node *front-to-globals* fnode lazy? action))

(defun eng-node-top-top (fnode lazy? action)
  (new-ce-node *front-to-top-top* fnode lazy? action))

(defun undefine-node (fnode lazy? var)
  (new-ce-node *front-to-ce* fnode lazy? 
               (NewAction 
                *engine* 
                (prin1-to-string `(define ,var undefine)))))


(defun has-errors (eng-result)
  (and (get-hash eng-result "%errors")
       eng-result))

(defun to-arraylist (lst)
  (let ((res (System.Collections.ArrayList)))
    (mapcar (lambda (x) (Add res x)) lst)
    res))

(defun safe-find-file (s)
  (if (and (is-type s "System.String")
           (or (EndsWith s ".mpl")
               (EndsWith s ".dll")))
      (find-file s)
    s))

(setf *unit-system* nil)

(defun set-unit-system (sys)
   (progn (log "set-unit-system: " sys)
          (setf *unit-system* sys)))

(defun get-unit-system (expr)
  (set-unit-system nil)
  (some
   (lambda (imp)
     (if (Equals (car (cdr imp)) "MC_unit")
         (let ((unit-system (eval *interpreter*
                                  (strcat (car imp) ".values.system"))))
           (update-runtime-options-unit-system unit-system)
           (set-unit-system                    unit-system))))
   expr))

(defun make-imports (fnode modules)
  (progn
    ;; side effects
    (apply load-rec (mapcar car modules))
    (get-unit-system modules)
    (new-ce-node
     *front-to-top-top* fnode nil
     (lisp-action
      (to-arraylist '("%%imports"))
      (lambda (env)
        (make-result `(("%%imports" ,modules))))))))

(defun make-result (kv-pairs)
  (add-bindings kv-pairs (make_hash_table1 (length kv-pairs))))

(defun make-eng-result (result errors)
  (or errors (make-result `(("%result" ,result)))))

(defun make-empty-result ()
  (make-eng-result "-PLACEHOLDER" nil))

(defun add-bindings (bindings table)
  (mapcar (lambda (kv)
            (set-hash table (car kv) (cadr kv)))
          bindings)
  table)

(setf *default-value* (make-result '(("%result" "-PLACEHOLDER"))))
(setf *pending-value* (make-result '(("%result" "-PENDING"))))


;; Finding definitions and dependencies
;; (Note that these are frontend definitions and
;; dependencies, not those that the engine sees.)

(defun find-defs (expr has-block-terminator?)
  (cond ((given-p expr)
         '("%%eng-result" "%%given" "%%constraints"))
        ((atom expr)
         '("%%eng-result"))
        ((member-t (car expr) '(set-imports import))
         '("%%imports" "%%eng-result"))
        ((constraint-p expr)
         '("%%eng-result" "%%constraints"))
        (has-block-terminator?
         '("%%eng-result" "%%constraints" "%%given"))
        (t '("%%eng-result"))))



;; Functions for handling engine nodes

(defun make-ce-node (front-node lazy? prev-ce action)
  (let ((new-ce (AddAfter *depman* prev-ce action (if lazy? 1 0))))
    ;;(dbg-add-node front-node new-ce expr)
    (set-hash *ce-to-front* new-ce front-node)
    new-ce))


(defun delete-ce-node (n)
  ;;(dbg-delete-node n)
  (Remove *ce-to-front* n)
  (Remove *depman* n))

;; Primary nodes
(defun make-primary (fnode ce-node)
  (set_hash *primary-node-map* fnode ce-node))
(defun clear-primary (fnode)
  (remove_hash *primary-node-map* fnode))

;; Useful for debugging

(if *debug*
    (progn (setf *dbg-node-map* (System.Collections.Hashtable))
           (defun dbg-add-node (fnode cnode expr)
             (log "adding cnode " cnode ", fnode, expr = " fnode expr)
             (set-hash *dbg-node-map* cnode (list fnode expr)))
           (defun dbg-delete-node (cnode)
             (let ((p (get-hash *dbg-node-map* cnode)))
               (log "deleting cnode " cnode ", fnode, expr = "
                    (car p) (car (cdr p))))
             (remove_hash *dbg-node-map* cnode)))
  ;; else
  (progn (defun dbg-add-node (fnode cnode expr) nil)
         (defun dbg-delete-node (cnode) nil)))


;; Import/Export stuff

; TODO: write the decode-hex function below
(defun decode-hex (x) x)

(defun make-builder (asm-path asm-module asm-version asm-public-key-token)
  (let* ((aname    (System.Reflection.AssemblyName))
         (version  (System.Version asm-version))
         (asm-public-key-token (decode-hex asm-public-key-token))
         ;;(dummy1        (SetPublicKeyToken aname asm-public-key-token))
         (dummy2   (set_Name          aname asm-module))
         (dummy3   (set_Version       aname version))
         (domain   (System.AppDomain.get_CurrentDomain))
         (access   System.Reflection.Emit.AssemblyBuilderAccess.RunAndSave)
         (abuilder (DefineDynamicAssembly domain
                          aname access
                          (System.IO.Path.GetDirectoryName asm-path))))
    (DefineDynamicModule abuilder asm-module
      (System.IO.Path.GetFileName asm-path))))

(defun make-compile-and-load (args)
  (or (Equals (length args) 8)
      (make-error-region "compile-and-load: invalid syntax"))
  (lambda (env)
    (let* ((asm-path      (nth 0 args))
           (asm-module    (nth 1 args))
           (asm-version   (nth 2 args))
           (asm-public-key-token (nth 3 args))
           (metadata      (nth 4 args))
           (imports       (nth 5 args))
           (exports       (nth 6 args))
           (regions       (nth 7 args))
           (mbuilder      (make-builder asm-path asm-module asm-version
                                        asm-public-key-token))
           (dummy4        (PushBuilder *engine* mbuilder))
           (expr          `(module
                            ,asm-module
                            ,asm-path
                            ,imports
                            ,exports
                            (progn ,@(cdr regions))))
           (handle        (AddAfter *engine* 0 (prin1-to-string expr) 0))
           (retval        (GetValue *engine* handle))
           (dummy5        (Remove   *engine* handle))
           (dummy6        (PopBuilder *engine*)))
      (make-result `(("%%eng-result" ,(lambda () retval)))))))

(defun make-compile-mpl-file (fnode args)
  (or (Equals (length args) 6)
      (make-error-region "compile-mpl-file: invalid syntax"))
  (make-primary-action 
   fnode nil
   (lambda (env)
     (let* ((asm-path      (nth 0 args))
            (asm-module    (nth 1 args))
            (asm-version   (nth 2 args))
            (asm-public-key-token (nth 3 args))
            (metadata      (nth 4 args))
            (mpl-file      (nth 5 args))
            (mbuilder      (make-builder asm-path asm-module asm-version
                                         asm-public-key-token))
            (errors        (CompileMplFile *engine* mbuilder mpl-file
                                           asm-path)))
       (make-eng-result "true" errors)))))

(defun make-compile-mpl-string (fnode args)
  (or (Equals (length args) 6)
      (make-error-region "compile-mpl-string: invalid syntax"))
  (make-primary-action
   fnode nil
   (lambda (env)
     (let* ((asm-path      (nth 0 args))
            (asm-module    (nth 1 args))
            (asm-version   (nth 2 args))
            (asm-public-key-token (nth 3 args))
            (metadata      (nth 4 args))
            (mpl-string    (nth 5 args))
            (mbuilder      (if (is-type asm-path "System.String")
                               (make-builder asm-path asm-module asm-version
                                             asm-public-key-token)))
            (errors        (if mbuilder
                               (CompileMplString *engine* mbuilder mpl-string
                                                 asm-path)
                               (CompileMplString *engine* mpl-string))))
       (make-eng-result "true" errors)))))

(defun make-load-mpl-assembly (fnode &rest assembly-dlls)
  (make-primary-action
   fnode nil
   (lambda (env)
     (let ((errors (some (lambda (dll) (LoadMplAssembly *engine* dll))
                         assembly-dlls)))
       (make-eng-result "true" errors)))))

;; Definitions

;; This function handles numeric definitions
;; and the x:=1+1= construct.
(defun make-num-def (fnode lazy? tag global? expr)
  (let* ((reg  (nth 1 expr))
         (tree (nth 2 expr))
         (lhs  (nth 3 expr))
         (rhs  (nth 4 expr))
         (range-def? (gather-subscripts lhs)))
    (let ((rhs-f ((if range-def?
                      handle-numeric-rhs-with-ranges
                      handle-numeric-rhs-no-ranges)
                  fnode tag reg tree global? lhs rhs))
          (new-lhs (if range-def?
                       (to-vector (get-defined-vars lhs))
                       lhs)))
      (if global?
          (make-global-def fnode lazy? tag     new-lhs rhs-f)
          (make-normal-def fnode lazy? 'define new-lhs rhs-f)))))

;;      (destructuring-bind (lhs rhs errors)
;;         ((if range-def handle-numeric-rhs-with-ranges handle-numeric-rhs-no-ranges) fnode env tag reg tree global? lhs rhs)
;;         (or errors
;;            (reprocess fnode lazy? env `(,(if global? 'global 'define)
;;                                         ,lhs
;;                                         ,rhs)))))))

;; This function handles symbolic definitions
;; and the x:=1+1-> construct.
(defun make-sym-def (fnode lazy? tag global? expr)
  (let ((opt? (eqt (nth 1 expr) 'front12.true))
        (reg  (nth 2 expr))
        (tree (nth 3 expr))
        (lhs  (nth 4 expr))
        (rhs  (nth 5 expr)))
    (let ((rhs-f (handle-symbolic-rhs
                  fnode tag reg tree opt? global? lhs rhs)))
      (if global?
          (make-global-def fnode lazy? tag     lhs rhs-f)
          (make-normal-def fnode lazy? 'define lhs rhs-f)))))

;; Global (in the Mathcad sense) definitions

(defun make-global-def (fnode lazy? tag lhs rhs-f)
  (make-global-eng-nodes fnode tag (make-lhs-rhs-triples lhs rhs-f)))

(defun make-global-eng-nodes (fnode tag lhs-rhs-triples)
  (make-primary
   fnode
   (car
    (mapcar (lambda (triple)
              (let ((lhs   (nth 0 triple))
                    (rhs-f (nth 1 triple))
                    (lzy   (nth 2 triple)))
                (make-global-eng-nodes-1 fnode tag lhs rhs-f lzy)))
            lhs-rhs-triples))))

(defun make-global-eng-nodes-1 (fnode tag lhs rhs-f lzy)
  (let ((pairs (make-temp-pairs lhs nil))
        (dnode  
         (eng-node-global fnode lzy (def-action 'define lhs rhs-f))))
    (eng-node-global  fnode t   (make-definition tag pairs t))
    (eng-node         fnode t   (make-definition tag pairs nil))
    dnode))

(defun make-temp-pairs (lhs pairs)
  (cond ((atom lhs)
         (cons (list lhs (make-temp)) pairs))
        ((eqt (car lhs) 'tag)
         (if (atom (cadr lhs))
             (cons (list lhs (make-temp)) pairs)
           (make-temp-pairs (cadr lhs) pairs)))
        ((eqt (car lhs) 'op_matrix)
         (destructuring-bind (rows cols (-list &rest elem)) (cdr lhs)
           (mktp-help elem pairs)))
        ((eqt (car lhs) 'subscript)
         (destructuring-bind (m &rest subs) (cdr lhs)
           (make-temp-pairs m pairs)))
        ((eqt (car lhs) 'op_matcol)
         (destructuring-bind (m col) (cdr lhs)
           (make-temp-pairs m pairs)))
        (t (signal 'bad_identifier (find-tag lhs)))))

(defun mktp-help (lhs-list pairs)
  (if lhs-list
      (let ((rest (mktp-help (cdr lhs-list) pairs)))
        (make-temp-pairs (car lhs-list) rest))
    pairs))

(defun make-definition (tag pairs reverse?)
  (let* ((symbolicp (lambda (symbol)
                      (StartsWith (ToString symbol) "sym_")))
         (explicitp (lambda (symbol)
                      (StartsWith (ToString symbol) "sym_exp_")))
         (qualify (lambda (n)
                    (let ((q `(qualified MC_doc ,n)))
                      (cond ((explicitp n) `(symbolic () (explicit ,q)))
                            ((symbolicp n) `(symbolic ()           ,q))
                            (t                                      q)))))
         (get-lhs (if reverse? cadr car))
         (get-rhs (compose qualify (if reverse? car cadr))))
    (def-action
        (set-tag 'define tag) 
        (to-vector (mapcar get-lhs pairs))
      (lambda (env) (to-vector (mapcar get-rhs pairs))))))

;;; "Top of the document" definitions (cbuiltin uses these)

(defun make-top-def (fnode tag lhs rhs)
  (eng-node-global fnode nil (def-action 'define lhs (lambda (env) rhs)))
  (eng-node-global fnode t   (def-action 'define (make-sym-lhs lhs)
                               (lambda (env) (make-sym-rhs lhs rhs)))))

;;; "Top top definitions" -- before even the (Mathcad) globals.
;;; Mike's currency-unit work needs these.

(defun make-top-top-def (fnode tag lhs rhs)
  (eng-node-top-top fnode nil (def-action 'define lhs (lambda (env) rhs))))

;;; numeric definitions

;; Helper function.  Has type (ignoring a few details)
;;
;;  (Env->Expr)->(Env->Result)
;;
;; It does its work by sending expressions through
;; a translate-compile-evaluate pass.
;;
(defun rhs-eval (fnode global? tag rhs-f)
  (rhs-eval-tmp 
   (lambda (tmp)
     (let* ((def    (set-tag 'define tag))
            (node-f (if global? eng-node-global eng-node)))

       (node-f fnode t (def-action def tmp rhs-f))))))

(defun rhs-eval-now (fnode global? tag rhs)
  (rhs-eval-tmp 
   (lambda (tmp)
     (let* ((def (if global? 'global 'define))
            (def (set-tag def tag)))

       (make-action fnode `(,def ,tmp ,rhs) t)))))

(defun rhs-eval-tmp (def-f)
  (let* ((tmp    (make-temp))
         (tmp-s  (ToString tmp)))

    ;; register a definition with the dependency analyzer
    (def-f tmp)

    (lambda (env)
      (let ((res (Lookup env (strcat "value " tmp-s))))
        (if (has-errors res)
            (signal res)
            ;; else
            (get-result-from-dict res tmp-s))))))

;; when there are ranges on the left hand side, we evaluate lhs := rhs
;; then we create a new multi-definition (vars of lhs) := (rl for each var), 
;; where the RL is the request language of the corresponding value from the 
;; result dictionary
(defun handle-numeric-rhs-with-ranges (fnode tag reg tree global? lhs rhs)
  (let* ((plain-rhs   (cadr rhs))
         (vars        (get-defined-vars lhs)))
    
    ;; register a definition with the dependency analyzer
    (if (has-symbolic-p plain-rhs)
        (let ((node-f (if global? eng-node-global eng-node))
              (rhs-f  (handle-symbolic-rhs 
                       fnode tag reg 
                       (tree-from-tag (find-tag-on 'symbolic plain-rhs))
                       nil global? lhs plain-rhs))
              (def    (set-tag 'define tag)))
          (node-f fnode t (def-action def lhs rhs-f)))
        ;; else
        (let* ((def (if global? 'global 'define))
               (def (set-tag def tag)))
          (make-action fnode `(,def ,lhs ,plain-rhs) t)))

    (lambda (env)
      (let ((res (Lookup env (strcat "value " (princ-to-string 
                                               (no-tag (car vars)))))))
        (if (has-errors res)
            (signal res)
            ;; else
            (let ((rls (mapcar 
                        (lambda (var) 
                          (let* ((sname (prin1-to-string (no-tag var)))
                                 (new-rhs-val 
                                  (get-result-from-dict res sname)))
                            (make-cast (get-rl new-rhs-val) 
                                       (get-units-rl new-rhs-val))))
                        vars)))
              (send-numeric-message reg tree nil) ; send "..."
              (to-vector rls)))))))


;; when there are no ranges on the left hand side, we evaluate the
;; right hand side by itself, then take the value of the "%result"
;; from the dictionary and use that as the new right hand side of the
;; definition
(defun handle-numeric-rhs-no-ranges (fnode tag reg tree global? lhs rhs)
  (let* ((tagged-eval   (car rhs))
         (plain-rhs     (cadr rhs))
         (units         (cdr (cdr rhs)))
         (tag           (find-tag tagged-eval))
         (make-callback (lambda (rhs)
                          ;; Note: fixing the result is critical.  If
                          ;; we don't, and it's a matrix, dividing by
                          ;; the units may mutate it.  This was the
                          ;; cause of bug 070327-175016.
                          `(let ((dummy (export_ ,rhs)))
                            (seq (numericcb 
                                  ,reg ,tree 
                                  (,tagged-eval dummy ,@units)) dummy)))))

    (compose
     (lambda (rhs-result)
       (make-cast (get-rl       rhs-result)
                  (get-units-rl rhs-result)))
     (if (has-symbolic-p plain-rhs)
         (rhs-eval 
          fnode global? tag
          (compose 
           make-callback
           (handle-symbolic-rhs 
            fnode tag reg (tree-from-tag (find-tag-on 'symbolic plain-rhs))
            nil global? lhs plain-rhs)))
         ;; else
         (rhs-eval-now fnode global? tag (make-callback plain-rhs))))))

;;; optimized and symbolic definitions
(defun handle-symbolic-rhs (fnode tag reg tree opt? global? lhs rhs)
  (destructuring-bind (params rhs-noparams) (get-params rhs)
    (let* ((subscripts (gather-subscripts lhs))
           (unbound    (append params subscripts))

           (rhs1     (if (has-symbolic-p rhs-noparams)
                         rhs-noparams
                         (make-sym-rhs lhs rhs-noparams)))
           (rhs1     (if unbound
                         (let* ((sargs    (mapcar sym-quote unbound))
                                (bindings (make-let-bindings unbound sargs)))
                           `(symbolic () (let ,bindings ,rhs1)))
                         rhs1))

           (eval
            (compose
             (lambda (rhs-result)
               (let* ((result-rl   (get-rl rhs-result))
                      (new-rhs     (merge-tags rhs result-rl))
                      (optimized?  (and opt? 
                                        (is-optimized rhs-noparams new-rhs))))
                 (if opt?
                     (send-optimize-message
                      reg (if optimized? 
                              (get_ValueXML rhs-result)
                              ""))
                     (send-symbolic-message reg tree rhs-result))
                 (let ((rhs-rl (if (and opt? (not optimized?))
                                   rhs
                                   (add-params params new-rhs))))
                   rhs-rl)))
             (rhs-eval-now fnode global? tag rhs1))))

      (lambda (env)
        (handler-case (eval env)
          (error (e)
            ;; If we're optimizing and the optimization failed,
            ;; just return the original RHS.
            (if opt?
                (progn (send-optimize-message reg "")
                       rhs)
                (signal e))))))))


(defun has (x expr)
  (if (atom expr)
      (eqt expr x)
      (some (lambda (expr) (has x expr)) expr)))

(defun make-let-bindings (vars vals)
  (if vars
      `((,(car vars) ,(car vals)) 
        ,@(make-let-bindings (cdr vars) (cdr vals)))))

(defun send-optimize-message (reg xml)
      (Mathcad.Components.Exports.SendMessage
   (strip-unboxed reg) 1 (clr-vec xml)))

(defun send-symbolic-message (reg tree val)
  (Mathcad.Components.Exports.SendMessage
   (strip-unboxed reg) 2 (clr-vec (strip-unboxed tree) val)))

(defun send-numeric-message (reg tree val)
  (Mathcad.Components.Exports.SendMessage
   (strip-unboxed reg) 8 (clr-vec (strip-unboxed tree) val)))

(defun add-params (params expr)
  (if params
      `(lambda ,params ,expr)
      expr))

(defun get-params (expr)
  (cond ((atom expr)
         (list nil expr))
        ((eqt (car expr) 'lambda)
         (list (nth 1 expr) (nth 2 expr)))
        (t (list nil expr))))

(defun gather-subscripts (expr)
  (gather-subscripts-1 expr '() nil (System.Collections.Hashtable 5)))
  
(defun gather-subscripts-1 (expr accum in-subscript? seen)
  (cond 
    ((atom expr) 
     (if in-subscript?
         (let ((expr (no-tag expr)))
           (if (and (is-mc-var expr)
                    (not (contains_hash seen expr)))
               (progn (set_Item seen expr t)
                      (cons expr accum))
               accum))
         accum))
    ((eqt (car expr) 'subscript)
     (let ((accum (gather-subscripts-1 (cdr (cdr expr)) accum t seen)))
       (gather-subscripts-1 (car (cdr expr)) accum nil seen)))
    (t
     (let ((accum (gather-subscripts-1 (cdr expr) accum in-subscript? seen)))
       (gather-subscripts-1 (car expr) accum in-subscript? seen)))))

(defun is-mc-var (x)
  (and x (StartsWith (ToString x) "mc_")))


(defun strip-unboxed (expr)
  (cond ((atom expr) expr)
        ((eqt (car expr) 'unboxed) (cadr expr))
        (t expr)))

(defun weight (expr)
  (cond ((atom expr) (let ((s (ToString expr)))
                       (cond ((StartsWith s "op_deriv")     1000)
                             ((StartsWith s "op_integ")     1000)
                             ((StartsWith s "mc_integral_") 1000)
                             ((StartsWith s "op_add") 2)
                             ((StartsWith s "op_sub") 2)
                             ;; Give mc_exp a weight of 2 so that
                             ;; (op_power mc_e x) has the same
                             ;; weight as (mc_exp x).
                             ((eq expr 'mc_exp)       2)
                             (t 1))))
        ((eqt (car expr) 'number) 1)
        (t (apply + (mapcar weight expr)))))

(defun is-optimized (x y)
  (cond ((atom x)                   nil)
        ((has-ranges-p x)           nil)
        ((has-errors-p y)           nil)
        ((has-block-terminator-p x) nil)
        (t (> (weight x) (weight y)))))

(defun op-range-p (x)
  (member-t x '(op_range2 op_range2_i op_range3)))

(defun has-ranges-p (x)
  (cond ((atom x) (and x (op-range-p x)))
        (t (some has-ranges-p x))))

(defun has-errors-p (x)
  (cond ((atom x) (and x (StartsWith (ToString x) "error")))
        (t (some has-errors-p x))))

(defun has-solve-p (x)
  (cond ((atom x) (and x (StartsWith (ToString x) "op_solve")))
        (t (some has-solve-p x))))


;; Helper for make-tags-table below
(defun ll-scan (table x)
  (cond ((atom x) (if (find-tag x)
                      (let ((x-untagged (no-tag x)))
                        (or (get-hash table x-untagged)
                            (set-hash table x-untagged x)))))
        (t        (progn (ll-scan table (car x))
                         (ll-scan table (cdr x))))))

;; Helper for merge-tags below
(defun make-tags-table (x)
  (let ((res (make_hash_table)))
    (ll-scan res x)
    res))

;; Helper for merge-tags below
(defun ll-merge (table x)
  (cond ((atom x) (let ((tagged (get-hash table x)))
                    (or tagged x)))
        (t        (mapcar (lambda (x) (ll-merge table x)) x))))

;; Replaced untagged symbols in dst with their tagged counterparts
;; from src.
(defun merge-tags (src dst)
  (let ((table (make-tags-table src)))
    (ll-merge table dst)))



;;; Ordinary definitions

(defun make-normal-def (fnode lazy? def lhs rhs-f)
  (let ((triples (make-lhs-rhs-triples lhs rhs-f))
        (fn      (lambda (triple)
                   (let* ((lhs    (nth 0 triple))
                          (rhs-f  (nth 1 triple))
                          (lzy    (nth 2 triple)))
                     (eng-node fnode (or lazy? lzy)
                               (def-action def lhs rhs-f))))))
    (make-primary
     fnode (car (mapcar fn triples)))))

(defun make-lhs-rhs-triples (lhs rhs-f)
  `((,lhs ,rhs-f ,nil)
    (,(make-sym-lhs lhs) ,(lambda (env) (make-sym-rhs lhs (rhs-f env))) ,t)
    (,(make-exp-lhs lhs) ,(lambda (env) (make-exp-rhs lhs (rhs-f env))) ,t)))

(defun make-sym-lhs (expr)
  (make-lhs expr "sym_" nil))

(defun make-lhs (expr prefix in-subscript?)
  (let ((mklhs  (lambda (x)    (make-lhs x prefix in-subscript?)))
        (mklhs2 (lambda (x s?) (make-lhs x prefix s?))))
    (cond
     ((atom expr) (if in-subscript?
                      expr
                    (intern (strcat prefix (prin1-to-string expr)))))
     ((eqt (car expr) 'op_matrix)
      (destructuring-bind (rows cols (-list &rest elem)) (cdr expr)
        `(op_matrix ,rows ,cols (list ,@(mapcar mklhs elem)))))
     ((eqt (car expr) 'subscript)
      (destructuring-bind (m &rest subs) (cdr expr)
        `(subscript ,(mklhs2 m nil) ,@(mapcar (lambda (x)
                                                (mklhs2 x t))
                                              subs))))
     ((eqt (car expr) 'op_matcol)
      (destructuring-bind (m col) (cdr expr)
        `(op_matcol ,(mklhs2 m nil) ,(mklhs2 col t))))
     ((eqt (car expr) 'tag)
      `(tag ,(mklhs (nth 1 expr)) ,(nth 2 expr)))
     (t expr)))) ; not sure if we should even get here

(defun make-sym-rhs (lhs rhs)
  (let ((lhs  (no-tag lhs))
        (rhs  (no-tag rhs)))
    (cond ((atom rhs) `(symbolic () ,rhs))
          ((op-range-p (car rhs))
           `(make_sym_range (list ,@(mapcar
                                     (lambda (x) `(symbolic () ,x))
                                     (cdr rhs)))))
          (t `(symbolic () ((numeric psymeval) ,rhs))))))


(defun make-exp-lhs (expr)
  (make-lhs expr "sym_exp_" nil))

(defun make-exp-rhs (lhs rhs)
  `(lambda (mask_)
    (explicit ,rhs)))


(defun get-defined-vars (expr)
  (cond ((atom expr) (list expr))
        ((eqt (car expr) 'op_matrix)
         (destructuring-bind (rows cols (-list &rest elem)) (cdr expr)
           (apply append (mapcar get-defined-vars elem))))
        ((eqt (car expr) 'subscript)
         (destructuring-bind (m &rest subs) (cdr expr)
           (get-defined-vars m)))
        ((eqt (car expr) 'op_matcol)
         (destructuring-bind (m col) (cdr expr)
           (get-defined-vars m)))
        (t nil)))

(defun get-result-from-dict (dict name)
  (let* ((vname (strcat "value " name))
         (tname (strcat "type " name))
         (value (get-hash dict vname))
         (type  (get-hash dict tname)))
    (McdTranslator.values.result value type)))

(defun to-vector (elements)
  `(op_matrix (unboxed ,(length elements)) (unboxed 1) (list ,@elements)))

;; TODO: make sure the value is not a huge matrix before asking for the RL
(defun get-rl (val) 
  (let* ((rl (and val (get_ValueRL val))))
    (and rl (read-from-string rl))))

(defun get-units-rl (val) 
  (let* ((rl (and val (get_UnitsRL val))))
    (and rl (read-from-string rl))))

(defun get-value-from-dict (dict name)
  (get-hash dict (strcat "value " name)))

(defun get-type-from-dict (dict name)
  (get-hash dict (strcat "type " name)))

;; Numeric right-hand side eval, e.g. 5->5=5
(defun make-rhs-eval (fnode tag expr)
  (let* ((nn    (nth 1 expr)) ; We have (eval (numeric (numeric ...)) ...)
         (e     (nth 1 nn)))
    (make-primary
     fnode
     (eng-node 
      fnode nil
      (lisp-action 
       nil 
       (compose
        (lambda (rhs-result)
          (let* ((rexp (get-rl rhs-result))
                 (rexp `(eval ,rexp ,@(cdr (cdr expr)))))
            (eval-action rexp)))
        (rhs-eval-now fnode nil tag e)))))))

(defun has-symbolic-p (expr)
  (has 'symbolic expr))

(defun sym-quote (x)
  `(numeric (make_sym (unboxed (string ,(princ-to-string (no-tag x)))))))


;; Components with units

;; could be (define lhs (lambda (...) (numeric (mc_eval_component_ ...))))
;; or (define lhs (numeric (mc_eval_component_ ...)))
;; Leopold 2006-07-21
;; I think any definition which contains an mc_eval_component_ on
;; the RHS qualifies.
(defun component-def-p (expr)
  (and (not (atom expr))
       (eqt (car expr) 'define)
       (not (eqt (nth 1 expr) 'tmp_component_def))
       (find-component (nth 2 expr))))

(defun find-subexpr (marker expr)
  (cond ((atom expr)             nil)
        ((eqt (car expr) marker) expr)
        (t                       (some (lambda (x) (find-subexpr marker x))
                                       expr))))

(defun find-component (expr)
  (find-subexpr 'mc_eval_component_ expr))

(defun find-lambda (expr)
  (find-subexpr 'lambda expr))

(defun make-component-def (fnode tag lhs rhs)
  (let* ((temp-lhs  'tmp_component_def)
         (temp-def  `(,(set-tag 'define tag) ,temp-lhs 
                      ,(find-component rhs)))
         (multidef? (and (not (atom lhs))
                         (eqt (car lhs) 'op_matrix))))
    
    (make-action fnode temp-def t)

    (let 
        ((rhs-f
          (lambda (env)
            (let ((cres 
                   (Lookup env (strcat "value " (prin1-to-string temp-lhs)))))
              (if (has-errors cres)
                  (signal cres)
                  (let* 
                      ((cv   (get-hash
                              cres (strcat 
                                    "value " (prin1-to-string temp-lhs))))
                       (cdef (if multidef?
                                 (make-component-mdef tag lhs cv temp-lhs)
                                 (let ((lam (find-lambda rhs)))
                                   (if lam
                                       (make-component-fdef 
                                        tag lhs (nth 1 lam) cv temp-lhs)
                                       (make-component-sdef 
                                        tag lhs cv temp-lhs)))))
                       (lhs (nth 1 cdef))
                       (rhs (nth 2 cdef))
                       (def (car cdef)))
                    rhs)))))
         (def (if multidef? 
                  (set-tag 'define_tuple tag)
                  (set-tag 'define tag))))
      
      (make-primary
       fnode
       (eng-node fnode nil (def-action def lhs rhs-f)))
      (eng-node fnode t (def-action def (make-sym-lhs lhs) rhs-f)))))

;; component definition with single output
(defun make-component-sdef (tag lhs cv temp-lhs)
  (let* ((cv-0 (and cv (GetValue cv 0)))
         (cexp (get-units-rl cv-0)))
    `(,(set-tag 'define tag) ,lhs 
      ,(make-cast `(core (getAt ,temp-lhs (unboxed 0))) cexp))))

;; component definition with single output which is a function
(defun make-component-fdef (tag lhs params cv temp-lhs)
  (let* ((cv-0 (and cv (GetValue cv 0)))
         (cexp (get-units-rl cv-0)))
    `(,(set-tag 'define tag) ,lhs 
      (lambda ,params 
        ,(make-cast `(core (getAt ,temp-lhs (unboxed 0))) cexp)))))

;; component definition with multiple outputs
(defun make-component-mdef (tag lhs cv temp-lhs)
  (let ((count -1))
    `(,(set-tag 'define_tuple tag) ,lhs 
      (tuple
       ,@(mapcar (lambda (a) (progn (setf count (+ count 1))
                                    (make-nth cv temp-lhs count)))
                 (cdr (car (cdr (cdr (cdr lhs))))))))))

(defun make-nth (cv temp-lhs n)
  (let* ((temp-lhs-nth (make-temp))
         (cv-nth (and cv (GetValue cv n)))
         (cexp-nth (get-units-rl cv-nth)))
    (make-cast `(let ((,temp-lhs-nth (getAt ,temp-lhs (unboxed ,n))))
                 (core ,temp-lhs-nth))
               cexp-nth)))

(defun make-cast (expr type)
  (if type
      `(cast (numeric ,expr) ,type)
    expr))

;; Assembly cache

(defun load-local-assembly-cache ()
  (let* ((dinfo  (System.IO.DirectoryInfo
                  (System.IO.Path.Combine *app-data* "LocalAssemblyCache")))
         (files  (System.Collections.ArrayList (GetFiles dinfo)))
         (dummy  (Sort files (comparer (lambda (x y)
                                         (CompareTo
                                          (get_CreationTimeUtc x)
                                          (get_CreationTimeUtc y))))))
         (paths  (mapenum get_FullName files)))
    (mapcar (lambda (path)
              (if (EndsWith path ".dll")
                  (LoadMplAssembly *engine* path)))
            paths)))

;; IBuiltin methods

(defun ibuiltin/get-variable (name)
  (get_hash *builtin-values* name))

(defun ibuiltin/set-variable (name value)
  (progn
    (on-worker-thread
     (let ((cenode (get_hash *builtin-nodes* name))
           (lhs    (intern name))
           (rhs    (to-rl value)))
       (with-engine-lock
        ;; setting rand_seed has a side effect
        (if (equal name "rand_seed")
            (temp-eval `(import ,*imports-for-builtins*
                                (eval (numeric (mc_Seed ,rhs))))))
        (or cenode
            (progn (setf cenode (AddBefore *depman* *top-top-node*
                                           *dummy* 0))
                   (set_hash *builtin-nodes* name cenode)))
        (Update *depman* cenode
                (NewAction *engine*
                           (prin1-to-string
                            `(import ,*imports-for-builtins*
                              (define
                                  (tuple ,lhs ,(make-sym-lhs lhs))
                                  (tuple ,rhs ,(make-sym-rhs lhs rhs))))))
                0))))
    (set_hash *builtin-values* name value)
    value))

(defun has-rl (x)
  (ignore-errors (GetProperty (GetType x) "_RL")))

(defun to-rl (x)
  (cond ((is-type x "System.String") `(string ,x))
        ((has-rl  x)                  (read-from-string (get__RL x)))
        (t                           `(number ,x))))

(defun ibuiltin/unset-variable (name)
  (let ((cenode (get_hash *builtin-nodes* name)))
    (if cenode
        (progn
          (on-worker-thread
           (with-engine-lock (Remove *depman* cenode)))
          (remove_hash *builtin-nodes*  name)
          (remove_hash *builtin-values* name)))))

(defun temp-eval (expr)
  (let* ((cenode (AddBefore *depman* *top-top-node*
                            (NewAction *engine*
                                       (prin1-to-string expr))
                            0))
         (res    (GetAllValues *depman* cenode)))
    (Remove *depman* cenode)
    res))


;; Utilities

(defun bool-to-int (b) (if b 1 0))

; Check whether file f1 is newer than f2

(defun check-newer (f1 f2)
  (if (System.IO.File.Exists f1)
      (or (not (System.IO.File.Exists f2))
          (> (CompareTo
              (System.IO.File.GetLastWriteTimeUtc f1)
              (System.IO.File.GetLastWriteTimeUtc f2))
             0))))

; Make a temporary variable name
(setf make-temp
      (let ((count 0))
        (lambda ()
          (setf count (+ count 1))
          (intern (strcat "front_temp_" (ToString count))))))


;; Make an expression which, when the compute engine
;; evaluates it, will produce the given error.
(defun make-error-region (fnode message)
  (make-primary 
   fnode (eng-node fnode nil (eval-action `(mc_error (string ,message))))))

;; When Mathcad is driving the front end, Robert's
;; make system handles dependencies.  It's useful
;; to be able to deal with them in scripts as well.

(defun striplast (str n)
  (Substring str 0 (- (get_Length str) n)))

(defun get-assembly-file (stem mpl-path)
  (let* ((dir       *local-assebly-cache*)
         (info      (System.IO.FileInfo mpl-path))
         (timestamp (get_Ticks (get_CreationTimeUtc info))))
    (System.IO.Path.Combine dir (strcat stem
                                        (ToString timestamp)
                                        ".dll"))))

(defun load-1 (mpl-path dll force?)
  (let ((modname (MplUtils.GetMplFileModuleName mpl-path)))
    (with-assembly-cache-lock
        (if (or force? (check-newer mpl-path dll))
            (let ((mbuilder (make-builder dll modname "1.0" "")))
              (CompileMplFile *engine* mbuilder mpl-path dll))
            ;; else
            (LoadMplAssembly *engine* dll)))
    dll))

(defun load-rec-1 (stem seen)
  (if (contains_hash seen stem)
      (get_hash seen stem)
      ;; else
      (or (load-prebuilt stem seen)
          (load-cached   stem seen)
          nil ;; Note: not an error to fall through here; it happens
              ;; for McdUserEfi, for example.
          ))) 

(defun load-prebuilt (stem seen) 
  (let ((dll (find-file (strcat stem ".dll"))))
    (if dll
        (let*
            ((dstems   (get-mpl-or-dll-dependencies dll))
             (dep-dlls (mapcar (lambda (stem) (load-rec-1 stem seen)) dstems)))
          (set_hash seen stem dll)
          (LoadMplAssembly *engine* dll)
          dll))))

(defun load-cached (stem seen)
  (let ((mpl-path (find-file (strcat stem ".mpl"))))
    (if mpl-path
        (let*
            ((dll      (get-assembly-file stem mpl-path))
             (dstems   (get-mpl-or-dll-dependencies mpl-path))
             (dep-dlls (mapcar (lambda (stem) (load-rec-1 stem seen)) dstems))
             (force?   (some (lambda (d)
                               (check-newer d dll))
                             dep-dlls)))
          (set_hash seen stem dll)
          (load-1 mpl-path dll force?)))))

(defun load-rec (&rest names)
  (mapcar (lambda (n) (load-rec-1 (get-stem n) *loaded-files*))
          names)
  t)

(defun get-stem (path)
  (System.IO.Path.GetFileNameWithoutExtension path))

(defun get-mpl-or-dll-dependencies (path)
  (mapcar ToString (read-from-string
                    (strcat "(" (MplUtils.GetMplFileDependencies path) ")"))))

;; Experimentally exposing this make system

(defun iengine/load-mpl-file-rec (path)
  (load-rec path))

(defun get-mpl-fname (path)
  (let ((fname (System.IO.Path.GetFileName path)))
    (if (EndsWith fname ".mpl" System.StringComparison.OrdinalIgnoreCase)
        fname
        (strcat fname ".mpl"))))

(defun iengine/get-mpl-module-name (path)
  (MplUtils.GetMplFileModuleName (find-file (get-mpl-fname path))))

;; debugging utilities

(defun print-result (h)
  (progn (if h
             (let ((errors (get_hash h "%errors")))
               (if errors
                   (print-errors errors)
                 (print-hash h))))
         h))

(defun print-errors (errors)
  (progn (write "Errors: ")
         (mapenum (lambda (e) (writeln (prin1-to-string e))) errors)
         errors))


(defun print-hash (h)
  (progn (mapenum
          (lambda (key)
            (writeln (strcat (prin1-to-string key) " -> "
                             (prin1-to-string (get-hash h key)))))
          (GetEnumerator (get_Keys h)))
         h))

;;; (recons exp new-car new-cdr)
;;;
;;;  This is like (cons new-car new-cdr), but it allows sharing
;;;  such that if the exp is already an appropriate result,
;;;  it just shares the result with that rather than consing
;;;  something new.  It's good for descending trees making a
;;;  non-destructive change but where you might reasonably expect
;;;  that you make no change a lot of the time, and you want to
;;;  return something eq or with minimal consing where no change
;;;  is needed.

(defun recons (exp new-car new-cdr)
  (cond ((and (eq (car exp) new-car)
         (eq (cdr exp) new-cdr))
    exp)
   (t
    (cons new-car new-cdr))))

;;; (subst new old tree)
;;;
;;;  Returns a tree that has NEW substituted for OLD at every leaf node of EXP.

(defun subst-atom (new old tree)
  (if (atom tree)
      (if (eqt old tree) new tree)
    (recons tree
       (subst-atom new old (car tree))
       (subst-atom new old (cdr tree)))))

;;; (prewrite expr)
;;;
;;;  This is a general-purpose opportunity to do simple rewrites on the
;;;  expression tree before various kinds of semantic analysis begin.
;;;  Note that absent a code-walker in this phase of analysis, these
;;;  have to be things that can be done in a relatively context-free way.
;;;
;;;  (This happens to do only one kind of rewrite but it would be ok to
;;;   cascade other kinds of rewrites as well.)

;;; Note: Under MC14 symbolics, these transformations are handled
;;; in the translator.  See iengine/initialize above.

(defun prewrite (expr) ;This function is NOT reentrant
  (handler-case (prewrite-recursively expr)
    (error (e)
      ;; This is a kludge for 13.1 that should be revisited later.
      ;; Here we return expr, which has NOT been rewritten.
      ;; This is ONLY acceptable if we know that we will fall
      ;; through to code that will signal an error anyway for
      ;; other reasons.  --kent & leopold 6-Dec-2005
      expr)))

(defun prewrite-failure ()
  ;; Don't do this unless it's pretty fatal anyway.
  ;; See usage notes in the prewrite function's handler for this.
  (signal "prewrite_failure"))

;;; (prewrite-recursively expr)
;;;
;;;  Finds indefinite integrals (and hopefully also one day derivatives)
;;;  and rewrites them to detect name collisions.

(defun prewrite-recursively (expr)
  (cond ((atom expr) expr)
   ((and (atom (car expr))
         (eqt (car expr) 'op_indef_integral)
         (= (length expr) 2)
         (let ((lambda-exp (cadr expr)))
      (and (eq (car lambda-exp) 'lambda)
           (= (length lambda-exp) 3)
           (= (length (cadr lambda-exp)) 1))))
    (prewrite-indefinite-integral expr))
   ((and (atom (car expr))
        ;(eqt (car expr) 'op_deriv_1)
         (let ((op (car expr))
          (n  (length expr)))
      (or (and (= n 3)
          (member-t op '(op_deriv_1 op_deriv_2 op_deriv_3 op_deriv_4 op_deriv_5)))
          (and (= n 4)
          (eqt op 'op_deriv_n))))
         (let ((lambda-exp (cadr expr)))
      (and (eq (car lambda-exp) 'lambda)
           (= (length lambda-exp) 3)
           (= (length (cadr lambda-exp)) 1))))
    (prewrite-derivative expr))
   (t
    (recons expr
       (prewrite-recursively (car expr))
       (prewrite-recursively (cdr expr))))))

;;; (symbolp x)
;;;
;;;  Check whether an object is a symbol.
;;;
;;;  !!! This is NOT the right way to do this, but hopefully will suffice for now.
;;;      --Kent 7-Dec-2005

(defun symbolp (thing)
  (and (atom thing)
       (let ((name (princ-to-string thing)))
    (not (or (StartsWith name "-")
        (StartsWith name "0")
        (StartsWith name "1")
        (StartsWith name "2")
        (StartsWith name "3")
        (StartsWith name "4")
        (StartsWith name "5")
        (StartsWith name "6")
        (StartsWith name "7")
        (StartsWith name "8")
        (StartsWith name "9"))))))

;;; (prewrite-indefinite-integral expr)
;;;
;;;  Rewrites an indefinite integral
;;;
;;;  (op_indef_integral (foo x y z) x)
;;;  => (op_indef_integral (foo _x0 y z) _x0 'x)

(defun prewrite-indefinite-integral (form)
  (let ((operator   (car form))
   (lambda-exp (car (cdr form))))
    (let ((lam (car lambda-exp))
          (bvl (car (cdr lambda-exp)))
     (bod (car (cdr (cdr lambda-exp)))))
      (let ((variable (car bvl))
       (variable0 (gensym)))
   (let ((erring (not (symbolp variable))))  ; e.g., integrate(x,3)
     (list operator
      (list lam
            (if erring (list variable) (list variable0))
            (prewrite-recursively (if erring bod (subst-atom variable0 variable bod))))
      (if erring
          variable ;it's not a symbol, so it's numeric
          `(numeric ,(sym-quote variable)))))))))

;;; (prewrite-derivative expr)
;;;
;;;  Rewrites a derivative
;;;
;;;  (op_deriv_1 (lambda (v) (foo v)) v)
;;;  => (op_deriv_1 (lambda (v0001) (foo v0001)) v)

(defun prewrite-derivative (form)
  (let ((operator     (car form))
   (lambda-exp   (car (cdr form)))
   (various-args (cdr (cdr form)))) ;either (degree initval) or just (initval).
    (let ((lam (car lambda-exp))
          (bvl (car (cdr lambda-exp)))
     (bod (car (cdr (cdr lambda-exp)))))
      (let ((variable (car bvl))
       (variable0 (gensym)))
   (let ((erring (not (symbolp variable))))  ; e.g., diff(x,3)
     (cons operator
      (cons (list lam
             (if erring (list variable) (list variable0))
             (prewrite-recursively (if erring bod (subst-atom variable0 variable bod))))
            various-args)))))))
