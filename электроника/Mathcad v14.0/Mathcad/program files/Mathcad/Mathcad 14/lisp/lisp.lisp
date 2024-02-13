;; This is implicit
;; (in-package "lisp")

;; This file implements a grab-bag of features mostly inspired by
;; Common Lisp.  They were chosen with the express purpose of
;; getting Mathcad 12 working.

(export 't 'nil 'list 'defun 'maptree 'maptree-accum 'cadr 'append
        'recons 'cond 'not 'let 'let* 'load-assembly 'load-dll 'find-file
        'add-to-load-path 'compose 'remove-if 'dbg 'dbg-level 'with-dbg-level
        'and 'or 'destructuring-bind 'princ-to-string 'prin1-to-string
        'set-hash 'get-hash 'trace 'trace-hook 'dotimes
        'time 'timeit '&rest 'is-type 'write
        'writeln 'read-from-string 'intern 'equal 'member '> '< '= 'clr-vec
        'incf 'decf 'test-suite 'save-lisp)

;; Now built into the interpreter
;;(setf t 't)
;;(setf nil '())

(setf list (lambda (&rest args) args))

(defmacro defun (f args &rest body)
  (list 'setf f (list 'lambda args (cons 'progn body))))

;; Now in StandardBuiltins
;;(defun mapcar (f lst)
;;  (if lst (cons (f (car lst)) (mapcar f (cdr lst)))))

(defun cadr (x)
  (car (cdr x)))

(defun append (&rest args)
  (_append args))

(defun expand-cond (expr-pairs)
  (if expr-pairs
      (list 'if (car (car expr-pairs)) (cadr (car expr-pairs))
            (expand-cond (cdr expr-pairs)))
    'nil))

(defmacro cond (&rest expr-pairs)
  (expand-cond expr-pairs))

(defun not (x)
  (if x nil t))


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
  ;; Can't use the 'and' macro because it's not defined yet.  Can't
  ;; define it yet because it uses backquote, which needs maptree,
  ;; which needs this function.
  (cond ((if (eq (car exp) new-car)
             (eq (cdr exp) new-cdr))
         exp)
        (t
         (cons new-car new-cdr))))

(defun maptree (f x)
  (if (atom x)
      (f x)
    (recons x (f (car x))
            (maptree f (cdr x)))))

(defun maptree-accum (f x)
  (maptree_accum f x))


(defun bq-process (x)
  (cond ((atom x)
         (list ':bq-quote x))
        ((eq (car x) ':backquote)
         (bq-process (bq-completely-process (cadr x))))
        ((eq (car x) ':comma)
         (cadr x))
        ((eq (car x) ':comma-at)
         (error ",@ after `"))
        (t (cons ':bq-append (mapcar bracket x)))))

(defun bracket (x)
  (cond ((atom x)
         (list ':bq-list (bq-process x)))
        ((eq (car x) ':comma)
         (list ':bq-list (cadr x)))
        ((eq (car x) ':comma-at)
         (cadr x))
        (t (list ':bq-list (bq-process x)))))

(defun bq-remove-tokens (x)
  (cond ((eq x ':bq-list) 'list)
        ((eq x ':bq-append) 'append)
        ((eq x ':bq-quote) 'quote)
        ((atom x) x)
        (t (maptree bq-remove-tokens x))))

(defun bq-completely-process (x)
  (bq-remove-tokens (bq-process x)))

(defmacro :backquote (x)
  (bq-completely-process x))

(defmacro let (bindings &rest body)
  `((lambda ,(mapcar car bindings) (progn ,@body)) ,@(mapcar cadr bindings)))

(defun let-star (bindings body)
  (if bindings
      (let ((b (car bindings)))
        `((lambda (,(car b)) ,(let-star (cdr bindings) body)) ,(cadr b)))
    body))

(defmacro let* (bindings &rest body)
  (let-star bindings `(progn ,@body)))

(defun load-assembly (fullName)
  (System.Reflection.Assembly.Load fullName))

(defun find-file (filename)
  (find_file *interpreter* filename))

(defun load-dll (filename)
  (let* ((path (find-file filename)))
    (System.Reflection.Assembly.LoadFile path)))

(defun add-to-load-path (path)
  (add_to_load_path *interpreter* path))

;; TODO: generalize this
(defun compose (f g)
  (lambda (&rest args)
    (f (apply g args))))

;; The managed C++ function can't be called "remove-if",
;; so we (in effect) rename it here.
(setf remove-if remove_if)

;; Similarly, we rename "dbg_level" and make sure that it's
;; always passed an unsigned quantity.
(defun dbg-level (n)
  (_unsigned (dbg_level (_unsigned n))))

(defmacro with-dbg-level (n &rest body)
  `(let* ((-old (dbg-level ,n))
          (-res (progn ,@body)))
     (dbg-level -old)
     -res))

(defmacro and (&rest exprs)
  (if exprs
      (if (cdr exprs)
          `(if ,(car exprs) (and ,@(cdr exprs)))
        (car exprs))))

(defmacro or (&rest exprs)
  (if exprs
      (let ((g (gensym)))
        `(let ((,g ,(car exprs)))
           (if ,g ,g (or ,@(cdr exprs)))))))

(defun -print (x)
  (if x (Engine.PCons._ToString x) "()"))

(setf princ-to-string -print)
(setf prin1-to-string -print)

(defun insert-sep (sep lst)
  (and lst
       (cons (car lst) (insert-sep-1 sep (cdr lst)))))

(defun insert-sep-1 (sep lst)
  (and lst
       (cons sep (cons (car lst) (insert-sep-1 sep (cdr lst))))))
            
;; destructuring-bind
;; Doesn't have all the bells and whistles of the ANSI
;; standard, but still useful.

(defmacro destructuring-bind (lhs expr &rest body)  
  (let* ((rhs      (gensym))
         (bindings (dbindings lhs rhs)))
    `(let* ((,rhs ,expr) 
            ,@bindings)
       (progn ,@body))))

;; helper for destructuring-bind
(defun dbindings (lhs rhs)
  (cond ((atom lhs)
         (and lhs (list `(,lhs ,rhs))))
        ((eq (car lhs) '&rest)
         (list `(,(car (cdr lhs)) ,rhs)))
        (t (append (dbindings (car lhs) `(car ,rhs))
                   (dbindings (cdr lhs) `(cdr ,rhs))))))


;; System.Collections.Hashtable has the intensely
;; annoying behavior of throwing an exception if
;; you try to insert a null value into the table.
(defun set-hash (h key val)
  (if val 
      (set_hash h key val))
  val)

(defun get-hash (h key)
  (and (contains_hash h key)
       (get_hash h key)))

(setf *out* (mslisp.ConsoleStream))

(defun write   (s) (Write     *out* s))
(defun writeln (s) (WriteLine *out* s))

(defmacro dotimes (ispec &rest forms)
  (let ((var   (nth 0 ispec))
        (limit (nth 1 ispec))
        (f     (gensym))
        (n     (gensym)))
    `(progn
      (setf ,f (lambda (,var ,n)
                 (if (< ,var ,n)
                     (progn ,@forms
                            (,f (+ ,var 1) ,n)))))
      (,f 0 ,limit))))

;; Useful debugging macro
(defmacro trace (&rest syms)
  `(progn
    ,@(mapcar (lambda (sym) `(setf ,sym (trace-hook ',sym ,sym))) 
              syms)))

(setf *trace-level* 0)
(defun write-trace-level ()
  (dotimes (i *trace-level*)
    (write " "))
  (write "[")
  (write (prin1-to-string *trace-level*))
  (write "]"))

(defmacro with-incremented-trace-level (&rest forms)
  (let ((g (gensym)))
    `(let ((,g *trace-level*))
      (unwind-protect (progn (setf *trace-level* (+ ,g 1))
                             ,@forms)
        (setf *trace-level* ,g)))))

(defun trace-hook (fname f)
  (lambda (&rest args)
    (write-trace-level)
    (write " ")
    (writeln (prin1-to-string `(,fname ,@args)))
    (let ((res (with-incremented-trace-level (apply f args))))
      (write-trace-level)
      (write " ")
      (if *trace-filter*
          (*trace-filter* res)
          (writeln (prin1-to-string res)))
      res)))

(defmacro time (sym)
  `(let* ((old ,sym)
          (new (lambda (&rest args)
                 (let ((call-str (prin1-to-string `(,',sym ,@args))))
                   (write "* ")
                   (writeln call-str)
                   (let* ((dummy1 (Engine.Timing.Start))
                          (res    (apply old args))
                          (dummy2 (Engine.Timing.Stop)))
                     (write "  ")
                     (write call-str)
                     (write " -> ")
                     (writeln (prin1-to-string res))
                     (write (prin1-to-string ',sym))
                     (write " elapsed time: ")
                     (write (prin1-to-string (Engine.Timing.GetElapsed)))
                     (writeln " clocks")
                     (Engine.Timing.Reset)
                     res)))))
     (setf ,sym new)))

(defmacro timeit (expr)
  `(let* ((dummy1 (Engine.Timing.Start))
          (res    ,expr)
          (dummy2 (Engine.Timing.Stop)))
     (writeln (strcat (princ-to-string ',expr) " -> " res
                      " (" (prin1-to-string (Engine.Timing.GetElapsed))
                      " clocks)"))
     (Engine.Timing.Reset)
     res))

(defmacro dbg (expr)
  `(let ((res ,expr))
     (writeln (strcat (princ-to-string ',expr) " -> " res))
     res))

(defun is-type (x typename)
  (eq (GetType x) (System.Type.GetType typename)))

(defun read-from-string (s)
  (eval *interpreter* (strcat "'" s)))

(defun intern (s)
  (_intern *interpreter* s))

(defun equal (x y)
  (if x
      (and y (Equals x y))
    (not y)))

(defun member (x l)
  (if l
      (if (equal x (car l))
          l
        (member x (cdr l)))))

;; Numeric comparisons

(setf > _gt)
(setf < _lt)
(setf = _eq)

;; For creating CLR arrays

(defun clr-vec (&rest args)
  (_clr_vec args))

;; Increment and decrement

(defmacro incf (place)
  `(setf ,place (+ ,place 1)))

(defmacro decf (place)
  `(setf ,place (- ,place 1)))

;; Rudimentary testing facility
(defmacro test-suite (&rest tests)
  `(progn ,@(make-tests tests)))

(defun make-tests (tests)
  (if tests
      (cons 
       `(or ,(car tests)
            (error (strcat "Test failed.  Evaluating "
                           (prin1-to-string ',(car tests))
                           " produced " (prin1-to-string res)
                           "; expected true.")))
       (make-tests (cdr tests)))
    '((writeln "All tests passed.")
      (quit))))

;; Serialization: save interpreter state to a file

(defun save-lisp (filename)
  (save *interpreter*))
