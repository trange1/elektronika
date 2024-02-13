(in-package "front12.solve")
(use-package "front12")

;; Functions relevant to ordinary solve blocks
(export 'given-p 'has-block-terminator-p 'make-given
        'constraint-p 'make-constraint 'close-block
        'gather-symbols)

(defun given-p (x)
  (equal (ToLower 
          (Engine.Tags.StripFontTag (ToString (no-tag x))))
         "mc_given"))
  
(defun make-given (fnode)
  (make-primary
   fnode
   (eng-node 
    fnode nil
    (lisp-action
     (to-arraylist '("%%given" "%%constraints"))
     (lambda (env)
       (if (equal (lookup env "%%given") "true")
           (signal "NotInSolve")
           (make-result '(("%%given"       "true")
                          ("%%constraints" ())))))))))

;; constraints

(setf *constraint-ops* '(front12.op_eq front12.op_lt front12.op_gt
                                       front12.op_leq front12.op_geq))

(defun constraint-p (expr)
  (and (not (atom expr))
       (or
        ;; it's the special "relation" construct
        (and (not (atom (car expr)))
             (eqt (car (car expr)) 'front12.relation)
             (every (lambda (x) (member-t x *constraint-ops*))
                    (cdr (car expr))))
        ;; it's just an application of a relational operator
        (member-t (car expr) *constraint-ops*))))

(defun make-constraint (fnode lazy? expr)
  (make-primary
   fnode
   (eng-node
    fnode nil
    (lisp-action
     (to-arraylist '("%%constraints"))
     (lambda (env)
       (if (equal (lookup env "%%given") "true")
           (make-result `(("%result" "true")
                          ("%%constraints"
                           ,(append (handle-relation-chains expr) 
                                    (lookup env "%%constraints")))))
           (make-result '(("%result" "true")))))))))

;; Handle constructs like 1 < x < 2
;; Update 2005-01-05
;; This is considerably simpler given the new "relation" construct
(defun handle-relation-chains (expr)
  (if (atom (car expr))
      (list expr)
    ;; otherwise it's a relation chain
    (let ((ops      (cdr (car expr)))
          (operands (cdr expr)))
      (chains-helper (car operands) ops (cdr operands)))))

(defun chains-helper (x ops operands)
  (and ops operands
       (cons `(,(car ops) ,x ,(car operands))
             (chains-helper (car operands) (cdr ops) (cdr operands)))))


;; block terminators

(defun block-terminator-p (x)
  (if x
      (member-t (intern 
                 (ToLower (Engine.Tags.StripFontTag (ToString (no-tag x)))))
                '(front12.mc_find 
                  front12.mc_minerr 
                  front12.mc_minimize 
                  front12.mc_maximize
                  front12.mc_odesolve 
                  front12.mc_pdesolve))))

(defun has-block-terminator-p (expr)  
  (if (atom expr)
      (block-terminator-p expr)
    (some has-block-terminator-p expr)))

(defun close-block (fnode lazy? expr force-sym?)
  (let* ((given-f (if 
                   ;; The "given" is optional for minimize and maximize
                   (member-t (car (has-block-terminator-p expr))
                             '(front12.mc_minimize front12.mc_maximize))
                   (lambda (env) t)
                   (lambda (env) (or (equal (lookup env "%%given") "true")
                                     (signal "OnlyInSolve")))))
         (constraints-f (lambda (env)
                          (if (given-f env)
                              (lookup env "%%constraints")))))

    (unwind-protect
         (process-block fnode lazy? expr constraints-f force-sym?)
      (eng-node 
       fnode nil
       (lisp-action
        (to-arraylist '("%%given" "%%constraints"))
        (lambda (env)
          (make-result '(("%%given"       "false")
                         ("%%constraints" ())))))))))

(defun process-block (fnode lazy? expr constraints-f force-sym?)
  (let* ((terminator  (car (has-block-terminator-p expr)))
         (block-type  (cond ((member-t terminator 
                                       '(front12.mc_odesolve 
                                         front12.mc_pdesolve))
                             'diffeq)
                            (t 'solve)))
         (processor   (cond ((eq block-type 'diffeq)
                             process-diffeq-block)
                            (t process-solve-block)))
         ;; Our efi code can't handle the case where
         ;; there are no constraints.  So if there
         ;; are none, we add a trivial one.
         (constraints-f (cond ((eq block-type 'diffeq)
                               constraints-f)
                              (t (lambda (env)
                                   (or (constraints-f env)
                                       '((front12.op_eq 0 0))))))))
    (processor fnode lazy? expr terminator constraints-f force-sym?)))
                           
    
(defun slv-tup-rhs (rhs-f params)
  (if params                  
      (lambda (env) `(lambda ,params ,(rhs-f env)))
      rhs-f))

(defun slv-def-rhs (rhs params accessor)
  (if params
      (if accessor
          `(lambda ,params (,accessor (,rhs ,@params)))
          `(lambda ,params (,rhs ,@params)))
      (if accessor
          `(,accessor ,rhs)
          rhs)))

(defun slv-rhs (rhs tupdef? num-unknowns params)
  (if (and tupdef? params)
      (let ((temps (make-temps num-unknowns)))
        `(tuple ,@(mapcar 
                   (lambda (temp)
                     (slv-make-extract rhs params temps temp))
                   temps)))
      ;; else
      rhs))

(defun slv-make-extract (rhs params temps temp)
  `(lambda ,params (let (((tuple ,@temps) (,rhs ,@params)))
                     ,temp)))
                          
(defun make-temps (n)
  (and (> n 0) (cons (front12.make-temp) (make-temps (- n 1)))))

(defun process-solve-block (fnode lazy? expr-i terminator constraints-f
                                  force-sym?)
  (let* ((isc     (insert-solve-call expr-i nil terminator constraints-f
                                     force-sym?))
         (expr    (nth 0 isc))
         (call-f  (nth 1 isc))
         (sym?    (or (nth 2 isc) force-sym?))
         (head    (no-tag (car expr)))
         (tag     (if head (find-tag (car expr))))
         (is-def? (member-t head '(front12.define 
                                   front12.define-optimized
                                   front12.define_tuple)))
         (params  (nth 3 isc)))

    (if sym? ;; symbolic evaluation, not a definition
        (progn
          (eng-node fnode lazy? 
                    (def-action 
                        'front12.define 'front12.sym_slv_res 
                      (lambda (env) `(front12.symbolic () ,(call-f env)))))
          (make-primary 
           fnode
           (eng-node fnode lazy?
                     (if is-def?
                         (def1-from-expr def1-action expr)
                         (eval-action expr)))))
        ;; else
        (progn
          (eng-node fnode lazy?
                    (def-action 'front12.define 'slv_tup 
                      (slv-tup-rhs
                       call-f params)))
          (eng-node fnode lazy?
                    (def1-action 'front12.define 'slv_res 
                      (slv-def-rhs
                       'slv_tup params 'fst)))
          (eng-node fnode lazy?
                    (def1-action 'front12.define 'mc_ERR 
                      (slv-def-rhs
                       'slv_tup params 'snd)))
          
          (if is-def?
              ;; The solve block terminates with a definition.  As usual,
              ;; we must split it into a numeric and a symbolic definition.
              (let* ((isc-sym  (insert-solve-call expr-i params terminator 
                                                  constraints-f t))
                     (expr-sym   (nth 0 isc-sym))
                     (call-f-sym (nth 1 isc-sym)))
                
                (make-primary 
                 fnode
                 (eng-node fnode lazy?
                           (def1-from-expr def1-action expr)))
                (eng-node fnode t
                          (def-action 'front12.define 'front12.sym_slv_res
                            (lambda (env) `(front12.symbolic ()
                                            ,(slv-def-rhs 
                                              (call-f-sym env) params nil)))))
                (eng-node fnode t
                          (def1-from-expr def1-action-sym expr-sym)))
              
              ;; else
              (make-primary
               fnode
               (eng-node fnode lazy? (eval-action expr))))))))
         

;; To insert the solver call, we need to walk the expression
;; tree, maintaining state along the way.  To do this, we
;; borrow some monadic techniques from Haskell.

;; In Haskell, this would be the bind operation for a
;; state monad.
(defun bind (m f)
  (lambda (state)
    (let ((r1 (m state)))
      (and r1 (let ((m2 (f (nth 1 r1))))
                (m2 (nth 0 r1)))))))

;; This would be the return operation for the state monad.
(defun mreturn (x)
  (lambda (state) (list state x)))

;; We use macros to emulate Haskell's 'do' notation.
;; The body of an 'mdo' form must be a sequence of
;; monadic operations.  To bind variables, (the '<-' syntax
;; in Haskell), one uses the syntax (set <var> <operation>). 
(defmacro mdo (&rest seq)
  (process-monadic seq))

(defun process-monadic (seq)
  (let ((action (car seq)))
    (cond ((cdr seq)
           (let ((var (if (eq (car action) 'set)
                          (nth 1 action)
                          (gensym))))
             `(bind ,(if (eq (car action) 'set)
                         (nth 2 action)
                         action)
               (lambda (,var) ,(process-monadic (cdr seq))))))
          
          (t 
           action))))


;; A few monad-related utilities
(defun fail ()
  (lambda (state) nil))

(defun make-alts (m &rest ms)
  (let ((state (gensym)))
    `(lambda (,state)
      (or (,m ,state)
       ,(and ms
             `(,(apply make-alts ms) ,state))))))

(defmacro alts (&rest ms)
  (apply make-alts ms))

(defun traverse (f expr)
  (if (atom expr)
      (f expr)
      (mdo (set x (f (car expr)))
           (set r (traverse f (cdr expr)))
           (mreturn (cons x r)))))

;; Monadic operations for manipulating state (which we maintain
;; as a small hash table).
;; NOTE: Under this implementation, set-state is a destructive
;; operation.  This could cause problems if we needed
;; backtracking, but we don't.

(defun make-state () (make_hash_table1 11))

(defun set-state (key val)
  (lambda (state) 
    (set-hash state key val)
    (list state val)))

(defun get-state (key)
  (lambda (state) (list state (get-hash state key))))


(defun minsert-solve-call (expr)
  (alts (match-atom expr)
        (match-definition expr)
        (match-block-close expr)
        (match-symbolic expr)
        (traverse minsert-solve-call expr)))

(defun insert-solve-call (expr params terminator constraints-f sym?)
  (let* ((maction (mdo
                   (set-state 'params params)
                   (set-state 'terminator terminator)
                   (set-state 'constraints-f constraints-f)
                   (set-state 'sym? sym?)
                   (minsert-solve-call expr)))
         (mres    (maction (make-state)))
         (final-state (nth 0 mres))
         (res         (nth 1 mres)))
    (list res 
          (get-hash final-state 'call-f)
          (get-hash final-state 'sym?)
          (get-hash final-state 'params))))
          
    

(defun match-atom (x)
  (if (atom x)
      (mreturn x)
      (fail)))

(defun match-definition (expr)
  (if (eqt (car expr) 'front12.define)
      ;; Can't use an ordinary define because in Mathcad 12,
      ;; there are no mixed-unit matrices
      (let* ((adf      (analyze-solve-definition expr))
             (lhs      (nth 0 adf))
             (lhs-tup? (nth 1 adf))
             (nparams  (nth 2 adf))
             (rhs1     (nth 3 adf)))
        (mdo
         (set-state   'params   nparams)
         (set-state   'lhs-tup? lhs-tup?)
         (set rhs     (minsert-solve-call rhs1))
         (set tupdef? (get-state 'tupdef?))
         (set sym?    (get-state 'sym?))
         (mreturn 
           (let ((df (if (and tupdef? (not sym?))
                         'front12.define_tuple
                         'front12.define))
                 ;; Fix for bug 040902-114548.  For reasons of
                 ;; backward compatibility, it must appear that
                 ;; you can take the transpose of the result of
                 ;; MinErr (even though MinErr returns a tuple
                 ;; and you can't).  So, we detect that case and
                 ;; handle it specially.                  
                 (transpose? (and (not (atom rhs))
                                  (eqt (car rhs) 'front12.op_transpose))))
             `(,df ,(handle-transpose-lhs transpose? lhs) 
               ,(handle-transpose-rhs transpose? rhs))))))
      ;; else
      (fail)))

(defun match-block-close (expr)
  (if (block-terminator-p (no-tag (car expr))) 
      (let ((args (cdr expr)))
        (mdo         
         (set call-f (mmake-solve-call args))
         (set sym?   (get-state 'sym?))
         (if sym?
             (mreturn 'front12.slv_res)
             (mdo
              (set num-unknowns (get-state 'num-unknowns))
              (set tupdef?      (get-state 'tupdef?))
              (set params       (get-state 'params))
              (mreturn (slv-rhs 
                        'front12.slv_res tupdef? num-unknowns params))))))
      ;; else
      (fail)))

(defun match-symbolic (expr)
  (if (eqt (car expr) 'front12.symbolic)
      (mdo
       (set-state 'sym? t)
       (set nexpr (minsert-solve-call (nth 2 expr)))
       (mreturn   `(front12.symbolic ,(nth 1 expr) ,nexpr)))
      ;; else
      (fail)))


(defun analyze-solve-definition (expr)
  (let* ((al         (analyze-solve-lhs (nth 1 expr)))
         (lhs        (nth 0 al))
         (lhs-params (nth 1 al))
         (lhs-tup?   (nth 2 al))
         (ar         (analyze-solve-rhs (nth 2 expr)))
         (rhs        (nth 0 ar))
         (rhs-params (nth 1 ar)))
    (if (and lhs-params rhs-params)
        (signal "error in solve block"))
    (list lhs lhs-tup? (or lhs-params rhs-params) rhs)))

(defun analyze-solve-lhs (expr)
  (if (and (not (atom expr))
           (eqt (car expr) 'front12.op_matrix))
      (destructuring-bind (rows cols (-list &rest elem)) (cdr expr)
        (cond ((every atom elem)  ; not parametrized
               (list expr nil t)) ; lhs is valid for a tuple definition

              ((some atom elem) ; not parametrized
               (list expr nil nil)) 

              ((some (lambda (x) (eqt (car x) 'front12.subscript))
                     elem)      ; not parametrized
               (list expr nil nil)) 

              ;; parametrized
              (t (let ((functions    (mapcar car elem))
                       (params-lists (mapcar cdr elem)))
                   (if (not (all-eqt params-lists))
                       (signal "error in solve block"))
                   (list `(front12.op_matrix ,rows ,cols (list ,@functions))
                         (car params-lists)
                         t))))) ; lhs is valid for a tuple definition
      ;; else
      (list expr nil nil)))

(defun analyze-solve-rhs (expr)
  (if (and (not (atom expr))
           (eqt (car expr) 'lambda))
      (list (nth 2 expr) (nth 1 expr))
    ;; else
    (list expr nil)))

(defun all-eqt (lst)
  (if lst
      (let ((x (car lst)))
        (every (lambda (y) (eqt-rec x y)) (cdr lst)))
    t))

(defun eqt-rec (x y)
  (if (or (atom x) (atom y))
      (eqt x y)
    ;; else
    (and (eqt-rec (car x) (car y))
         (eqt-rec (cdr x) (cdr y)))))

;; Part of a fix for bug 040902-114548.
(defun handle-transpose-lhs (transpose? lhs)
  (if (and transpose?
           (not (atom lhs))
           (eqt (car lhs) 'front12.op_matrix))
      (destructuring-bind (rows cols (-list &rest elem)) (cdr lhs)
        `(front12.op_matrix ,cols ,rows (list ,@elem)))
    lhs))

;; Part of a fix for bug 040902-114548.
(defun handle-transpose-rhs (transpose? rhs)
  (if transpose?
      (car (cdr rhs))
    rhs))

(defun is-unknown (x)
  (is-mc-var x))

(defun gather-symbols (expr)
  (gather-symbols-1 expr '() (System.Collections.Hashtable 5)))
  
(defun gather-symbols-1 (expr accum seen)
  (if (atom expr)
      (let ((expr (no-tag expr)))
        (if (and (is-unknown expr)
                 (not (contains_hash seen expr)))
            (progn (set_Item seen expr t)
                   (cons expr accum))
          accum))
    (let ((r (gather-symbols-1 (cdr expr) accum seen)))
      (gather-symbols-1 (car expr) r seen))))
      
(defun make-format (expr sym? tupdef?)
  (let ((n    (length expr))
        (expr (mapcar check-valid-find-arg expr)))
    (cond (sym?    `(list ,@expr))
          (tupdef? `(tuple ,@expr))
          ((> n 1) `(front12.op_matrix (unboxed ,n) (unboxed 1) (list ,@expr)))
          (t (car expr)))))

;; Leopold 2005-12-02
;; As a compromise between bugs 051114-090540 and 050414-102427,
;; we allow compound expressions as arguments to Find, but only
;; if they don't contain subscripts.
(defun check-valid-find-arg (expr)
  (if (has-subscript-p expr)
      (signal "error in solve block" (or (find-tag expr) 0))
    expr))

(defun has-subscript-p (expr)  
  (if (atom expr)
      (eqt expr 'front12.subscript)
    (some has-subscript-p expr)))

;; Hook into the monad
(defun mmake-solve-call (args)
  (mdo
   (set terminator    (get-state 'terminator))
   (set params        (get-state 'params))
   (set constraints-f (get-state 'constraints-f))
   (set sym?          (get-state 'sym?))
   (set lhs-tup?      (get-state 'lhs-tup?))
   (let ((sc          (make-solve-call 
                       terminator params args constraints-f sym? lhs-tup?)))
     (mdo
      (set-state 'call-f       (nth 0 sc))
      (set-state 'tupdef?      (nth 1 sc))
      (set-state 'num-unknowns (nth 2 sc))
      (mreturn (nth 0 sc))))))
   
(defun make-solve-call (terminator params args constraints-f sym? lhs-tup?)
  (let* ((callback  (car  args))
         (options   (cadr args))
         (args      (cdr (cdr args)))
         (is-minmax (member-t terminator 
                              '(front12.mc_minimize 
                                front12.mc_maximize)))
         (objective (if is-minmax (car args)))
         (args      (if is-minmax (cdr args) args))
         (is-minerr (member-t terminator '(front12.mc_minerr)))
         (mip-str   (let ((s (car (last args))))
                      (and (not (atom s))
                           (eqt (car s) 'front12.string)
                           s)))
         (args      (if mip-str (butlast args) args))         
         (unknowns  (gather-symbols args))

         (n         (length unknowns))
         (ns        (length args))
         (iguess    (possibly-tuple unknowns sym?))
         (tupdef?   (and (> ns 1) lhs-tup?))
         (format    (make-format args sym? tupdef?))
         (lamparams (if sym? unknowns (list iguess)))
         (objective (fix-objective sym? params unknowns objective))
         (flam      `(lambda ,lamparams ,format))                  
         (call-f
          (lambda (env)
            (let* ((constraints (constraints-f env))
                   (m           (length constraints))
                   (c-lams    
                    (transform-constraints sym? lamparams constraints)))
              `(op_solve 
                ,options
                (as_f8 mc_TOL)
                (as_f8 mc_CTOL)
                (unboxed ,(if is-minerr 1 0)) ; minerr flag
                ,(if objective `(Really ,objective) 'Null) ; objective
                (unboxed ,n)                               ;; number guesses -- unnecessary
                ;; ,(if sym? 'Null iguess) ; initial guess         ;; reverse 7th and 9th arguments for numerics
                ,(if sym? 'Null (possibly-vector c-lams sym?))
                (unboxed ,m)                                    ;; number constraints -- unnecessary
                ;; ,(possibly-vector c-lams sym?)
                ,(if sym? (possibly-vector c-lams sym?) iguess) ; initial guess
                ,(possibly-vector (get-senses constraints sym?) sym?)
                ,(if mip-str `(Really (unboxed ,mip-str)) 
                     'Null) ; MIP string
                ,flam ; format lambda
                ,callback 
                (unboxed ,(if (eqt terminator 'front12.mc_maximize) 
                              1 
                              0)) ; is_max
                Null ;; ignored -- should be removed
                )))))
    (list call-f tupdef? ns)))
    
(defun possibly-vector (lst sym?)
  (if sym?
      `(list ,@lst)
      `(vector ,@lst)))
      
(defun possibly-tuple (lst sym?)
  (if sym?
      `(list ,@lst)
      `(tuple ,@lst)))
      
;; Note: 1) Null isn't a tuple type, 2) (tuple <one-thing>) is already treated as just <one-thing>
;;    (let ((len (length lst)))
;;      (cond ((equal len 0) 'Null)
;;            ((equal len 1) (car lst))
;;            (t `(tuple ,@lst))))))

;; ** DEAD **
;; Give the type checker a chance to spot unit errors
;;(defun make-unit-test (c-lams iguess objective)
;;  (if c-lams
;;     `(seq (,(car c-lams) ,@iguess)
;;            ,(make-unit-test (cdr c-lams) iguess objective))
;;    (if objective
;;        `(,objective ,@iguess)
;;      'Null)))

;; If the constraints contain references to the constants,
;; the compute engine's variable binding method will take
;; care of everything.
;; But if the objective function refers to the constants,
;; we have to transform it into a function which includes
;; them in its parameter list.
;; This fixes bug 990820-154339.
(defun fix-objective (sym? params unknowns objective)
  (or (and objective
           ;; Tupify (uncurry) objective function argument if params or more than one argument
           (or params (> (length unknowns) 1))
           (let ((unknowns    (mapcar no-tag unknowns))
                 (params      (mapcar no-tag params))
                 (lamparams   (if sym? unknowns (list (possibly-tuple unknowns sym?)))))
             `(lambda ,lamparams (,objective ,@(slmerge unknowns params)))))
      objective))

(defun slmerge (slist1 slist2)
  (mapcar intern
          (lmerge (mapcar ToString slist1) (mapcar ToString slist2))))

(defun lmerge (l1 l2)
  (append l1 (ldiff l2 l1)))

(defun ldiff (l1 l2)
  (let ((h (make_hash_table1 (length l2))))
    (mapcar    (lambda (x) (set_hash h x t)) l2)
    (remove_if (lambda (x) (contains_hash h x)) l1)))
    
(defun transform-constraints (sym? unknowns constraints)
   (if sym? 
      (transform-constraints-sym unknowns constraints)
      (transform-constraints-num unknowns constraints)))

(defun transform-constraints-num (unknowns constraints)
  (mapcar (lambda (c) (transform-constraint-num unknowns c))
          constraints))

(defun transform-constraint-num (unknowns constraint)
  (let ((lhs (nth 1 constraint))
        (rhs (nth 2 constraint)))
    `(lambda ,unknowns (magnitude (front12.op_sub ,lhs ,rhs)))))

(defun transform-constraints-sym (unknowns constraints)
  (mapcar (lambda (c) (transform-constraint-sym unknowns c))
          constraints))

(defun transform-constraint-sym (unknowns constraint)
  (let ((lhs (nth 1 constraint))
        (rhs (nth 2 constraint)))
    `(lambda ,unknowns (front12.op_sub ,lhs ,rhs))))

(defun get-senses (constraints sym?)
  (mapcar (lambda (c) (sense c sym?)) constraints))

(defun mcstr (s)
  `(front12.string ,s))

(defun sense (constraint sym?)
  (let ((op (no-tag (car constraint))))
    (cond ((eqt op 'front12.op_eq)  (mcstr "E"))
          ((eqt op 'front12.op_lt)  (mcstr (if sym? "l" "L")))
          ((eqt op 'front12.op_leq) (mcstr "L"))
          ((eqt op 'front12.op_geq) (mcstr "G"))
          ((eqt op 'front12.op_gt)  (mcstr (if sym? "g" "G"))))))

;; ODE blocks

(defun process-diffeq-block (fnode lazy? expr terminator constraints-f
                             force-sym?)
  (let ((lhs (get-lhs expr)))
    (make-primary
     fnode
     (eng-node 
      fnode lazy?
      (if lhs
          (def-action 'front12.define lhs (get-rhs-f expr constraints-f))
          ;; else
          (lisp-action 
           nil 
           (lambda (env)
             (eval-action
              (insert-diffeq-call expr (constraints-f env))))))))))

(defun get-lhs (expr)
  (cond ((atom expr) nil)
        ((eqt (car expr) 'front12.define)
         (nth 1 expr))
        (t (some get-lhs expr))))

(defun get-rhs-f (expr constraints-f)
  (cond ((atom expr) nil)
        ((eqt (car expr) 'front12.define)
         (lambda (env) (insert-diffeq-call (nth 2 expr) (constraints-f env))))
        (t (some (lambda (e) (get-rhs-f e constraints-f)) expr))))

(defun insert-diffeq-call (expr constraints)
  (cond ((atom expr) expr)
        ((eqt (car expr) 'front12.define)
         (let ((lhs (nth 1 expr))
               (rhs (insert-diffeq-call (nth 2 expr) constraints)))
           `(front12.define ,lhs ,rhs)))
        ((block-terminator-p (no-tag (car expr)))
         (let ((which (car (block-terminator-p (no-tag (car expr))))))
           `(,which ,(cdr expr) (list ,@constraints))))
        (t (mapcar 
            (lambda (e) (insert-diffeq-call e constraints))
            expr))))
