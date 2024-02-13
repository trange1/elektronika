;;********* Copyright © Parametric Technology Corporation. All rights reserved
;;*
;;*
;;*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/eng/mctranslator/prolog/main.prolog   306   2007-06-06 16:05:10-04:00   ltravis $
;;*
;;*
;;*  Purpose : Implements much of the translation from ARL to MPL.
;;*
;;*
;;*  Comments: This file uses a tab size of 3 spaces.
;;*
;;*
;;****************************************************************************

(!include "plots-eng.prolog")

;;****************************************************************************
;;* TRANS env request result
;;*
;;* Succeeds if 'result' is the translation of the request langauge form 'rl'.
;;* This is the main entry point into this ruleset.

( (trans (import $imports ($keyword | $form)) $res) (!)

   ;; Initialize modes
   (set-global SYMBOLIC-MODE false:)
   (set-global EXPLICIT-MODE false:)

   (tag $keyword $k $t)                               ; Split the keyword
   (trans-toplevel $k $t $form $tform) (!)            ; Translate the form
   (id $res (import $imports $tform))                 ; Restore the imports
   )

;;****************************************************************************
;;* TRANS-TOPLEVEL env keyword form result
;;*
;;* trans-toplevel
;;*   : define       $form
;;*   | define_tuple $form
;;*   | eval         $form
;;*   | LIT-FORM range compute or ordinary compute

( (trans-toplevel define: $tag $form $res) (!)

   (id $form ($lhs $rhs)) (!)
   (trans-define $tag $lhs $rhs $res) (!)
   )

( (trans-toplevel define_tuple: $tag $form $res) (!)

   (trans-tuple-define $tag $form $res) (!)
   )

( (trans-toplevel eval: $tag $form $res) (!)

   (trans-simplify $tag $form $res) (!)
   )

;;****************************************************************************
;;* TRANS-DEFINE env tag lhs rhs result
;;*
;;* Translate top level definitions.

( (trans-define $tag $lhs $rhs $res)

   ;; If this is an explicit (in the sense of explicit calculation)
   ;; definition, special handling is required.  For example,
   ;; if the left-hand side of the translated definition is
   ;; a tuple, putting (lambda (-mask_) ...) on the right-hand
   ;; side will result in a type error.  The right-hand side has to
   ;; become a tuple of (lambda (-mask_) ...) expressions;
   ;; this clause achieves that.
   (id $rhs (lambda (-mask_) $expr))   (!)
   (trans-define $tag $lhs $expr 
                 ($def $lhs1 $rhs1))   (!)
   (wrap-mask $lhs1 $rhs1 $rhs2)
   (id $res ($def $lhs1 $rhs2)) )

( (trans-define $tag $lhs $rhs $res)

   (id $lhs (subscript $m $i)) (!)
   (range-matrix-def-1 $tag $lhs $rhs $res)
   )

( (trans-define $tag $lhs $rhs $res)

   (id $lhs (subscript $m $i $j))
   (range-matrix-def-2 $tag $lhs $rhs $res)
   )

( (trans-define $tag $lhs $rhs $res)

   (id $lhs (op_matcol $m $i))
   (range-matrix-def-col $tag $lhs $rhs $res)
   )

( (trans-define $tag $lhs $rhs $res)

   (id $lhs (op_matrix $rows $cols (list | $lhss)))
   (id $rhs (op_matrix $rows $cols (list | $rhss))) (!)
   (range-parallel-def $tag $lhs $rhs $res)
   )

( (trans-define $tag $lhs $rhs $res)

   (id $lhs (op_matrix $rows $cols (list | $lhss)))
   (range-destructuring-def $tag $lhs $rhs $res)
   )

( (trans-define $tag mc_ORIGIN:$t $rhs $res)(!)

   (texp $rhs $trhs)
   (id $res (define:$tag mc_ORIGIN:$t (iv' (as_i4:$tag (reset $trhs)))))
   )

( (trans-define $tag $lhs $rhs
         (define:$tag $lhs (reset $trhs))) (!)

   (texp $rhs $trhs)
   )

;;****************************************************************************
;;* RANGE-MATRIX-DEF
;;*
;;* Input
;;*  $m    -- Variable being defined
;;*  $ei  -- Index expression i
;;*  $ej  -- Index expression j
;;*  $rhs -- Rhs expression
;;* Output
;;*  $res -- translatated definition

;;* Singly subscripted defintion
;;* m[ei] := e
;;* Note: this translation is appropriate for subscripted assignments
;;*       with no range variables, too.

;;*comma delimited array on RHS
( (texp-comma-cases $it $cases
         (progn (setf $it (add_i4 $it (unboxed 1)))
                (let (($s $it)) $res)))

   (new-temp 0 $s)
   (texp-cases-with-label $s 1: $cases $res)
   )

( (texp-cases-with-label $s $n ($c | $cs)
         $res)
   (!)
   (+ $n 1: $ii)
   (texp-cases-with-label $s $ii $cs $tcases)
   (id $res (if (iv' (ceq_i4 $s (unboxed $n))) $c $tcases))
   )

( (texp-cases-with-label $s $n ()
         zero_)
   )


( (range-matrix-def-1 $tag $lhs ((constant comma-array) $elem)
         $res)

   (!)
   (new-temp 0 $count-var)

   (texp-comma-cases $count-var $elem $rhs)

   (range-matrix-def-1 $tag $lhs $rhs (define $mm $val))
   (id $res (define:$tag $mm (let:$tag (($count-var (unboxed 0))) $val)))
   )

( (range-matrix-def-1 $tag $lhs $rhs
         $res)

   (id $lhs (subscript $m $ei))
   (is-symbolic $rhs $sym?)
   (tindex $ei _ORIGIN_i4 $ti $iv)                  ;;*translate index expression
   (texp $rhs $trhs)                                ;;*translate rhs expression

   (get-ranges $lhs $rs)                            ;;*identify range variables
   (nursery-matrix-1 $m $rs $ti $matexp)            ;;*construct updateable array
   (new-temp 0 $mat)                                     ;;*Give it a name
 ;;(update-1 $mat $ti $trhs $update)                     ;;*construct array update form
   (update-1 $mat $ti (bind_exit _return_ $trhs) $update);;*construct array update form

   (range-loops $tag $rs $iv $update $loop)              ;;*construct initialization loop

   (matrix-binding $m (as_matrix_value:$tag $mat) $matrix-bind)

   (id $new-rhs 
        (let:$tag (($mat $matexp))          ;;*construct MatVal
        (let:$tag ( $matrix-bind  )         ;;*corresponding Matrix id
          (as_matrix_value:$tag
           (unify $mat (bind_exit _until_ $loop))))))

   (wrap-sym $sym? $new-rhs $def-rhs)

   (id $res                                     ;;*embed loop in binding forms
      (define:$tag $m (reset $def-rhs)))

   )

;;* matrix-binding ENV $m $mat => BINDING-FORM
;;* Emit unrestricted binding when $m is of Matrix type
;;* Else emit subscript restricted binding.

( (matrix-binding $m $mat
         $res)
   (is-array $m)
   (id $res ($m $mat)) (!)
   )

( (matrix-binding $m $mat
         $res)
   (id $res (subscripted $m $mat)) (!)
   )

;;* Doubly subscripted defintion
;;* m[ei,ej] := e
;;* Note: this translation is appropriate for subscripted assignments
;;*       with no range variables, too.

;;* comma delimited array on RHS.
( (range-matrix-def-2 $tag $lhs ((constant comma-array) $elem)
         $res)
   (new-temp 0 $count-var)

   (texp-comma-cases $count-var $elem $rhs)

   (range-matrix-def-2 $tag $lhs $rhs (define $mm $val))
   (id $res (define:$tag $mm (let:$tag (($count-var (unboxed 0))) $val)))

   )

( (range-matrix-def-2 $tag $lhs $rhs
         $res)

   (id $lhs (subscript $m $ei $ej))
   (is-symbolic $rhs $sym?)
   (tindex $ei _ORIGIN_i4 $ti $iv)                  ;;*translate index expression
   (tindex $ej _ORIGIN_i4 $tj $jv)                  ;;*translate index expression
   (texp $rhs $trhs)                                ;;*translate rhs expression

   (get-ranges $lhs $rs)                            ;;*identify range variables
   (nursery-matrix-2 $m $rs $ti $tj $matexp)        ;;*construct updateable array
   (new-temp 0 $mat)                                     ;;*Give it a name
   (update-2 $mat $ti $tj (bind_exit _return_ $trhs)
            $update)                                     ;;*construct array update form

   (concat $iv $jv $ivars)                               ;;*integer vars
   (range-loops $tag $rs $ivars $update $loop)           ;;*construct initialization loop
   (matrix-binding $m (as_matrix_value:$tag $mat) $matrix-bind)

   (id $new-rhs 
        (let:$tag (($mat $matexp))               ;;*construct MatVal
        (let:$tag ( $matrix-bind )               ;;*corresponding Matrix id
          (as_matrix_value:$tag 
           (unify $mat (bind_exit _until_ $loop))))))

   (wrap-sym $sym? $new-rhs $def-rhs)
 
   (id $res                                      ;;*embed loop in binding forms
      (define:$tag $m (reset $def-rhs)))
  )

;;* column subscripted definition
;;* m<ei> := e
;;* Note: this translation is appropriate for matcol assignments
;;*       with no range variables, too.

( (range-matrix-def-col $tag $lhs $rhs
         $res)

   (id $lhs (op_matcol $m $ei))
   (is-symbolic $rhs $sym?)

   (tindex $ei _ORIGIN_i4 $ti $iv)                     ;;*translate index expression
   (texp $rhs $trhs)                                   ;;*translate rhs expression

   (get-ranges $lhs $rs)                               ;;*identify range variables
   (nursery-matrix-2 $m $rs (unboxed 0) $ti $matexp)   ;;*construct updateable array
   (new-temp 0 $mat)                                        ;;*Give it a name
   (update-col $mat $ti (bind_exit _return_ $trhs) $update) ;;*construct array update form

   (range-loops $tag $rs $iv $update $loop)                 ;;*construct initialization loop

   (matrix-binding $m (as_matrix_value:$tag $mat) $matrix-bind)

   (id $new-rhs 
        (let:$tag ((_ORIGIN_i4 (as_i4 mc_ORIGIN)))
        (let:$tag (($mat $matexp))                      ;;*construct MatVal
        (let:$tag ( $matrix-bind )                      ;;*corresponding Matrix id
          (as_matrix_value:$tag
           (unify $mat (bind_exit _until_ $loop)))))))

   (wrap-sym $sym? $new-rhs $def-rhs)

   (id $res                                             ;;*embed loop in binding forms
      (define:$tag $m (reset $def-rhs )))
   )

;;* range-parallel-def
;;*  /lhs1\    /rhs1\
;;* | lhs2 |:= | rhs2 |
;;*  \lhs3/    \rhs3/

( (range-parallel-def $tag $lhs $rhs $res)

   (id $lhs (op_matrix $rows $cols (list | $lhss)))
   (id $rhs (op_matrix $rows $cols (list | $rhss))) (!)
   (get-ranges $lhs $rs)
   (texp-parallel-option $tag $lhss $rhss $updates)
   (init-forms $rs $lhss $defined-vars $inits)
   (range-loops $tag $rs () (progn | $updates) $loop)
   (id $values (progn (bind_exit _until_ $loop) (tuple | $defined-vars)))
   (wrap-initializations $values $inits $prog)
   (id $res (define:$tag (tuple | $defined-vars) (reset $prog)))
   )


( (texp-parallel-option $tag $lhss $rhss
         $updates)

   (get-global EXT_OPT12 true:) (!) ;; succeeds when multiple-assignment-option is set to Mc12 compatibility
   (texp-parallel $tag $lhss $rhss $tmp-bindings $lhs-bindings $tmps)
   (concat $tmp-bindings $lhs-bindings $updates)
   )

( (texp-parallel-option $tag $lhss $rhss
         $updates)

   (texp-sequential $tag $lhss $rhss $updates)
   )


( (wrap-initializations $prog () $prog) )

( (wrap-initializations $prog ($init | $inits)
         (let ($init) $inner))

   (wrap-initializations $prog $inits $inner)
   )

;;* range-destructuring-def
;;* /lhs1\
;;  |lhs2 | := e
;;* \lhs3/

( (range-destructuring-def $tag $lhs $rhs $res)

   (id $lhs (op_matrix $r $c (list | $lhss)))
   (is-symbolic $rhs $sym?)
   (get-ranges $lhs $rs)
   (texp (setf $lhs (bind_exit _return_ $rhs)) $updates)
   (init-forms $rs $lhss $defined-vars $inits)
   (range-loops $tag $rs () $updates $loop)
   (id $values (progn (bind_exit _until_ $loop) (tuple | $defined-vars)))
   (wrap-initializations $values $inits $prog)
   (wrap-sym $sym? $prog $sprog)
   (id $res (define:$tag (tuple | $defined-vars) (reset $sprog)))
   )

;;* INIT-FORMS $rs $lhss
;;*   => $defined-vars $initializations)
;;*
;;* Provide list of variables defined in parallel definition
;;* and construct "preallocated" initializations for matrix
;;* definitions.

( (init-forms $rs ($lhs | $lhss)
         $more-vars $more-inits)

   (init-forms $rs $lhss $vars $inits)
   (init-form  $rs $lhs $vars $inits $more-vars $more-inits)
   )

( (init-forms $rs () () ()) )

;;* submatrix assignment

( (init-form $rs (op_matrix $r $c (list | $lhss)) $vars $inits
         $more-vars $more-inits )

   (init-forms-alt $rs $lhss $vars $inits $more-vars $more-inits)
   )

;;* The cognesenti will recognize this as a difference list implementation of
;;* init-forms wherein the components of the dl's are passed as separate variables

( (init-forms-alt $rs ($lhs | $lhss) $vars $inits
         $more-vars $more-inits)

   (init-forms-alt $rs $lhss $vars $inits
         $mvars $minits)
   (init-form $rs $lhs $mvars $minits
         $more-vars $more-inits)
         )

( (init-forms-alt $rs () $vars $inits $vars $inits) )

;;* singly subscripted array assignment

( (init-form $rs (subscript $m $ei) $vars $inits $vars $inits)

   (member $m $vars)
   )

( (init-form $rs (subscript $m $ei) $vars $inits
         ($m | $vars) $more-inits )

   (tidx $ei $ti)               ;;*translate index expression
   (nursery-matrix-1 $m $rs $ti $matexp)
   ;;*$matexp has a reference to $m in it which must bind to doc.m
   ;;*The Matrix value of $matexp shall be locally bound to m.
   ;;*A temporary and two initialialzation are needed to get the correct
   ;;*bindings because of Mpl's recursive let scoping rules.
   ;;*eg. in ($m (as_matrix_value $matexp)) the $m in $matexp would (recursively) bind
   ;;*to the local $m and result in a dependency cycle.
   (matrix-binding $m (as_matrix_value $mat) $matrix-bind)
   (new-temp 0 $mat)
   (id $more-inits (($mat $matexp) $matrix-bind | $inits))
   )

;;* doubly subscripted array assignment

( (init-form $rs (subscript $m $ei $ej) $vars $inits
         $vars $inits)

   (member $m $vars)
   )

( (init-form $rs (subscript $m $ei $ej) $vars $inits
         ($m | $vars) $more-inits )

   (tidx $ei $ti)                    ;;*translate index expression
   (tidx $ej $tj)                    ;;*translate index expression
   (nursery-matrix-2 $m $rs $ti $tj $matexp)
   ;;*$matexp has a reference to $m in it which must bind to doc.m
   ;;*The Matrix value of $matexp shall be locally bound to m.
   ;;*A temporary and two initialialzation are needed to get the correct
   ;;*bindings because of Mpl's recursive let scoping rules.
   ;;*eg. in ($m (as_matrix_value $matexp)) the $m in $matexp would (recursively) bind
   ;;*to the local $m and result in a dependency cycle.
   (new-temp 0 $mat)
   (matrix-binding $m (as_matrix_value $mat) $matrix-bind)
   (id $more-inits (($mat $matexp) $matrix-bind | $inits))
   )

;;* matcol assignment

( (init-form $rs (op_matcol $m $ei) $vars $inits
      $vars $inits)

   (member $m $vars)
   )

( (init-form $rs (op_matcol $m $ei) $vars $inits
         ($m | $vars) $more-inits )

   (tidx $ei $ti)                    ;;*translate index expression
   (nursery-matrix-2 $m $rs $ti (unboxed 0) $matexp)
   ;;*$matexp has a reference to $m in it which must bind to doc.m
   ;;*The Matrix value of $matexp shall be locally bound to m.
   ;;*A temporary and two initialialzation are needed to get the correct
   ;;*bindings because of Mpl's recursive let scoping rules.
   ;;*eg. in ($m (as_matrix_value $matexp)) the $m in $matexp would (recursively) bind
   ;;*to the local $m and result in a dependency cycle.
   (new-temp 0 $mat)
   (matrix-binding $m (as_matrix_value $mat) $matrix-bind)

   (id $more-inits (($mat $matexp) $matrix-bind | $inits))
   )

;;* ordinary var assignment

( (init-form $rs $x $vars $inits
         $vars $inits)

   (member $x $vars)
   )

( (init-form $rs $x $vars $inits
         ($x | $vars) $inits )
   )

;;* update $mat $i $j $rhs $update-form
;;* TO DO ** Special form for constant RHS

( (update-1 $mat $i $rhs
         (upd_1' $mat $i $rhs))
   )

( (update-2 $mat $i $j $rhs
         (upd_2' $mat $i $j $rhs))
   )

( (update-col $mat $i $rhs
         (upd_matcol $mat $i $rhs))
   )

;;****************************************************************************
;;* RANGE-LOOPS $rs $irs $body $res
;;*
;;* Input
;;*  $rs      -- list of range variables
;;*  $irs       -- list of variables required to be integral
;;*  $body     -- expresssion to iterate
;;* Output
;;*  $res       -- The loop expression

( (range-loops $tag $rs $irs $body $res)

   (make-loops $tag $rs $irs $body $loops $rngs)
   (wrap-loops $rs $rngs $loops $res)
   )

;;* for each range variable
;;*    bind the document range value to a new name ($rng)
;;*    introduce a local binding hiding the document range variable
;;* consequently all of the textual occurences of the range variable
;;* will refer to the local binding and the translated code is free to
;;* refer to the range value through the new name.

( (wrap-loops () () $loops $loops) )

( (wrap-loops ($r | $rs) ($rng | $rngs) $loops $res)

   (wrap-loops $rs $rngs $loops $inner)
   (id $res (let (($rng $r))
            (let (($r 0))
                  $inner)))
   )

;;****************************************************************************
;;* MAKE-LOOPS $rs $irs $body $res $rngs
;;* Input
;;*  $rs       -- list of iteration variables
;;*  $irs      -- list of variables required to be integral
;;*  $body     -- expresssion to iterate
;;* Output
;;*  $loops    -- The nested loop expressions
;;*  $rngs     -- list of range values

( (make-loops $tag () $irs $body $body ()) )

( (make-loops $tag ($r | $rs) $irs $body
         $res ($rng | $rngs))

   (make-loops $tag $rs $irs $body $inner $rngs)
   (new-temp 0 $rng)
   (range-loop $tag $r $rng $irs $inner $res)
   )

;;****************************************************************************
;;* RANGE-LOOP $r $rng $irs $body => $res
;;*
;;* Construct integer or float loop

;;* Not yet used, but leave it here.
;( (range-loop $tag $r $rng $irs $body $res)
;
;   (member $r $irs) ;;*Integer range loop
;   (iterate $tag $r (forRangeVar:$tag $rng) $body $res)
;   )

( (range-loop $tag $r $rng $irs $body $res)
   (iterate $tag $r (numeric (forRangeVar:$tag $rng)) $body $res)
   )

;;****************************************************************************
;;* nursery-matrix -- an updateable matrix value properly sized.
;;* This expression has type MatVal; not Matrix

;;*no ranges
( (nursery-matrix-1 $m () $ti
         $res)

   (init-matrix-t $m $dm)
   (id $res (realloc $dm (numeric $ti) (numeric (unboxed 0))))
   )

;;*one or more ranges
( (nursery-matrix-1 $m $rs $ti
         $res)

   (init-matrix-t $m $dm)
   (map-final $rs $finals)
   (id $res (realloc $dm ((numeric (lambda $rs $ti)) | $finals) 
                          (numeric (unboxed 0))))
   )

;;*no ranges
( (nursery-matrix-2 $m () $ti $tj
         $res)

   (init-matrix-t $m $dm)
   (id $res (realloc $dm (numeric $ti) (numeric $tj)))
   )

;;*one or more ranges
( (nursery-matrix-2 $m $rs $ti $tj
         $res)

   (init-matrix-t $m $dm)
   (map-final $rs $finals)
   (id $res (realloc $dm 
                    ((numeric (lambda $rs $ti)) | $finals)
                    ((numeric (lambda $rs $tj)) | $finals)))
   )

;;*-------------------------------------------------------------
;;*init-matrix-t -- document value which this definition extends

;;*Use type to determine value if previous definition exists
( (init-matrix-t $m $res)
   (is-array $m)
   (id $m $res)
   )

;;*Use zero if there is no previous >>Document<< definition of this name
( (init-matrix-t $m $res)
   (id $res zero_)
   )


;; Wrap with a symbolic form, if necessary
( (wrap-sym numeric:  $x $x) )
( (wrap-sym symbolic: $x (symbolic () $x)) )

;;****************************************************************************
;;* TEXP env expression result
;;*
;;* Succeed if 'result' is the translation of the given expression, which will
;;* be one of a number of special forms identified by the initial keyword, or
;;* a function application, a variable, or a literal. We break the tag off the
;;* first element and dispatch to the 'tform' predicate, whose clauses process
;;* each such special form separately.

( (texp ($keyword | $form) $res)                 ; Is a compound form?

   (tag $keyword $k $t)                               ; Break off the tag
   (tform $k $t $form $res)                      ; Dispatch on keyword
   )

;; This handles the Mathcad rule that builtins are defined
;; in all fonts for builtins that aren't efis.
;; This fixes bug 040911-170642.
( (texp $name_font? $res)

   (not-bound $name_font?)                       ; make sure it is not bound
   (strip-font $name_font? $name_nofont)              ; strip font information
   (is-builtin $name_nofont)                          ; is it a built-in without font?
   (id $res $name_nofont) )                           ; return the name without font


( (texp $simple-exp $simple-exp) )               ; Variable or literal

;;* UNTIL ; we plan to move this translation into the arl parser.

( (tform until: $tag $form $res) (!)

   (id $form ($cond $val))
   (texp $cond $tcond)
   (texp $val $tval)
   (id $res (if:$tag (op_lt:$tag $tcond zero_)
                     (exit _until_ no_value_)
                     ($tval)))
   )

;;* EVAL
;;*
;;* Translate evaluation without wrapping the result

( (tform eval: $tag $form $res) (!)

   (trans-simplify $tag $form $res) (!)
   )

;;* SYMBOLICCB
;;*
;;* Intermediate symbolic results need to be wrapped with a call to 'result'
;;* before they are passed to symboliccb.

( (tform symboliccb: $tag $form $res) (!)

   (id $form ($comp $tree $expr))
   (texp $expr $texpr)
   (tag $texpr $_ $t)
   (wrap-result $t $texpr $r)
   (id $res (symboliccb:$tag $comp $tree $r))
   )

;;* SYMEVAL
;;*
;;* Remove symeval if explicit is the only keyword present

( (tform symeval: $tag $form $res) (!)

	(id $form ($symbolic))
	(id $symbolic ($_ $keywords $__))
	(texp $symbolic $tsymbolic)
	(wrap-symeval $keywords $tsymbolic $tag $res)
	)		

;;* SYMBOLIC
;;*
;;* Symbolic evaluation, possibly with keywords.
;;* See utils.prolog for the helper predicates
;;* used by this clause.

( (tform symbolic: $tag $form $res) (!)

   (get-global SYMBOLIC-MODE $old-symbolic-mode)
   (set-global SYMBOLIC-MODE true:)

   (id $form ($keywords $expr))
   (split-keywords $keywords $splitkeys)
   (make-keycall $expr $splitkeys $kexpr)
   (texp $kexpr $tkexpr)
   (id $res (symbolic:$tag () $tkexpr))

   (set-global SYMBOLIC-MODE $old-symbolic-mode)
   )

;;* EXPLICIT
;;*

( (tform explicit: $tag $form $res) (!)

   (get-global EXPLICIT-MODE $old-explicit-mode)
   (set-global EXPLICIT-MODE true:)
   (get-global SYMBOLIC-MODE $old-symbolic-mode)
   (set-global SYMBOLIC-MODE true:)

   (id $form ($expr))   
   (texp $expr $texpr)
   (id $res (explicit:$tag $texpr))

   (set-global SYMBOLIC-MODE $old-symbolic-mode)
   (set-global EXPLICIT-MODE $old-explicit-mode)
   )

;;* NUMERIC

( (tform numeric: $tag $form $res) (!)

   (get-global SYMBOLIC-MODE $old-symbolic-mode)
   (set-global SYMBOLIC-MODE false:)
   (get-global EXPLICIT-MODE $old-explicit-mode)
   (set-global EXPLICIT-MODE false:)

   (id $form ($expr))   
   (texp $expr $texpr)
   (id $res (numeric:$tag $texpr))
 
   (set-global EXPLICIT-MODE $old-explicit-mode)
   (set-global SYMBOLIC-MODE $old-symbolic-mode)
   )

;;* SUBSCRIPT
;;*
;;* Translate index expressions for subscript and matcol.

( (tform subscript: $tag $form $res) (!)

   (tsubscript $tag $form $res)
   )

;;* OP_MATCOL
;;*
;;*

( (tform op_matcol: $tag $form $res) (!)

   (id $form ($m $c))
   (texp $m $tm)
   (tidx $c $tc)
   (id $res (op_matcol:$tag $tm $tc))
   )

;;* SETF
;;*
;;* Translation for local subscript assignments.

( (tform setf: $tag $form $res) (!)

   (id $form ($lhs $rhs))
   (tsetf $tag $lhs $rhs $res)
   )

;;* LAMBDA
;;*
;;* No translations are performed on the bound variables of a lambda, only its
;;* body.

( (tform lambda: $tag $form $res) (!)

   (id $form ($bvs $body))
   (texp $body $tbody)
   (id $res (lambda:$tag $bvs $tbody))
   )

;;* AND
;;*
;;*

( (tform and: $tag $form $res) (!)

   (id $form ($x $y))
   (texp $x $tx)
   (texp $y $ty)
   (id $res (bv (and_ (as_bool:$tag $tx) (as_bool:$tag $ty))))
   )

;;* OR
;;*
;;*

( (tform or: $tag $form $res) (!)

   (id $form ($x $y))
   (texp $x $tx)
   (texp $y $ty)
   (id $res (bv (or_ (as_bool:$tag $tx) (as_bool:$tag $ty))))
   )

;;* XOR
;;*
;;* Needed in the symbolic case to fix bug 060727-090752.

( (tform op_xor: $tag $form $res) (!)

   (get-global SYMBOLIC-MODE true:)
   (id $form ($x $y))
   (texp $x $tx)
   (texp $y $ty)
   (id $res (bv (xor_ (as_bool:$tag $tx) (as_bool:$tag $ty))))
   )

;;* NOT
;;*
;;*

( (tform op_not: $tag $form $res) (!)

   (id $form ($x))
   (texp $x $tx)
   (id $res (bv (not (as_bool:$tag $tx))))
   )

;;* AND-
;;*
;;* n-ary "and" and "or" -- Mathcad doesn't produce these,
;;* but they're useful in intermediate translations

( (tform and-: $tag $form $res) (!)

   (tand $tag $form $res)
   )

( (tform or-: $tag $form $res) (!)

   (tor $tag $form $res)
   )

;;* OP_PARENS
;;*
;;* TO DO ** Could let the general case do this? Purify will punt it anyway.

( (tform op_parens: $tag $form $res) (!)

   (id $form ($element))
   (texp $element $res)
   )

;;* FOR
;;*
;;*

( (tform for: $tag $form $res) (!)

   (tfor $tag $form $res)
   )

;;* POWER
;;*
;;* Could add a few more of these for cube, inverse, etc.

( (tform op_power: $tag $form $res)

   (id $form ($x 2))                                   ; This may fail
   (texp $x $tx)                                    ; Translate the base
   (id $res (op_sqr:$tag $tx))                           ; Use 'square' instead
   )

;;* VECTORIZE
;;*
;;* $form is an application (see ArlParser.y)

( (tform vectorize: $tag $form $res)

   ;; Don't do this special translation in explicit mode
   (get-global EXPLICIT-MODE false:)

   (id $form ($expr))
   (vectorize-apply $tag $expr $res)
   )

( (tform vectorize: $tag $form $res)

   ;; We'll only get here if we're in EXPLICIT-MODE.
   ;; If we're already within a 'vectorize' form,
   ;; ignore this nested 'vectorize' form.
   (get-global VECTORIZING-IN-EXPLICIT-MODE true:)

   (id $form ($expr))
   (texp $expr $res)
   )

( (tform vectorize: $tag $form $res)

   ;; We'll only get here if we're in EXPLICIT-MODE
   ;; and not already under a 'vectorize' form.
   (set-global VECTORIZING-IN-EXPLICIT-MODE true:)

   (id $form ($expr))
   (texp $expr $texpr)
   (id $res (vectorize $texpr))

   (set-global VECTORIZING-IN-EXPLICIT-MODE false:)
   )


;;* MC_SINC
;;* sin(x)/x
;;*

( (tform op_div: $tag $form $res)

   (id $form (($f $arg) $arg))

   (tag $f $sin_font $stag)
   (strip-font $sin_font  mc_sin: )                      ; strip font information
   (not-bound $sin_font)   (!)                      ; is it bound in the document
   (texp $arg $targ)
   (id $res ((qualified MC_mc mc_sinc:$tag) $targ))
   )

;;* NO-LOOP
;;*
;;*

( (tform (constant no-loop) $tag $form $res)

   (id ($i) $form)
   (is-range $i)
   (id $res (qualified MC_doc $i))
   )

( (tform (constant no-loop) $tag $form $res)

   (id ($i) $form)
   (texp $i $res)
   )

( (tform $in_set_fonted? $tag $form $res)  
  (strip-font $in_set_fonted? $in_set_unfonted)
; (trace2 "is-element-of" $in_set_unfonted)
  (is-element-of $in_set_unfonted) 
  (not-bound $in_set_fonted?)
; (trace2 "is-element-of ok" $in_set_unfonted)
  (!)
; (trace2 "tform form" $form)
  (t_in_set $tag $form $res))


;;* MC_ROOT
;;*
;;*

( (tform $root_font? $tag $form $res)

   (strip-font $root_font? $root_nofont)                 ; strip font information
   (is-root $root_nofont)                                ; is it root?
   (not-bound $root_font?) (!)                      ; is it bound in the document
   (troot $tag $form $root_font? $res)              ; Special translation
   )

;;* MC_POLYROOTS
;;*
;;* special translation for polyroots ** TO DO ** Just drop callback?

( (tform $poly_font? $tag $form $res)

   (strip-font $poly_font? $poly_nofont)                 ; strip font information
   (is-polyroots $poly_nofont)                           ; is it polyroots?
   (not-bound $poly_font?) (!)                      ; Refers to built-in?
   (id $form ($callback (unboxed $options) $v))
   (texp $v $tv)
   (id $res ($poly_font?:$tag (as_i4 $options) $tv))
   )

;;* MC_CREATEMESH
;;*
;;* Special translations for CreateMesh and CreateSpace

( (tform $mesh_font? $tag $form $res)

   (strip-font $mesh_font? mc_CreateMesh:)               ; strip font information
   (not-bound $mesh_font?) (!)                      ; Refers to built-in?
   (tcreatemesh $mesh_font? $tag $form $res)        ; Special translation
   )

;;* MC_CREATESPACE

( (tform $space_font? $tag $form $res)

   (strip-font $space_font? mc_CreateSpace:)             ; strip font information
   (not-bound $space_font?) (!)                     ; Refers to built-in?
   (tcreatespace $space_font? $tag $form $res)      ; Special translation
   )


;;* MC_RADAU  MC_BDF  MC_ADAMSBDF MC_STATESPACE
;;*
;;*

( (tform $radau_font? $tag $form $res)
   (strip-font $radau_font? mc_Radau:)              
   (not-bound $radau_font?) (!)                     
   (tradau $radau_font? $tag $form $res)            
   )

( (tform $radau_font? $tag $form $res)
   (strip-font $radau_font? mc_BDF:)                
   (not-bound $radau_font?) (!)                     
   (tradau $radau_font? $tag $form $res)            
   )

( (tform $radau_font? $tag $form $res)
   (strip-font $radau_font? mc_AdamsBDF:)           
   (not-bound $radau_font?) (!)                     
   (tradau $radau_font? $tag $form $res)            
   )

( (tform $radau_font? $tag $form $res)
   (strip-font $radau_font? mc_statespace:)              
   (not-bound $radau_font?) (!)                     
   (tradau $radau_font? $tag $form $res)            
   )


( (tobj $arg (as_object $arg)) )

( (tradau $radau_font? $tag $form $res) (!)
   (texp-each $form ($t1 $t2 $t3 $t4 $t5 | $optional))
   (map &tobj-%-2 $optional $toptional) 
   ;(id $res (mc__radau5:$tag $t1 $t2 $t3 $t4 $t5 | $toptional)) 
   (id $res ($radau_font?:$tag $t1 $t2 $t3 $t4 $t5 | $toptional)) 
   )
      

;;* JACOBIAN
;;*
;;*
( (tform mc_Jacob: $tag $form $res)

    ;; Check whether the user has redefined mc_Jacob
    (not-bound mc_Jacob:)

    (tjacob $tag $form $res) )


;; Helper for Jacobian translation.
( (tjacob $tag $form $res)

    ;; If there's no third argument, it's inferred by
    ;; looking for the largest subscript of $v
    ;; occurring in the expression.
    (id $form ($expr $v))
    
    (max-subscript $expr $v $max)
    (tjacob $tag ($expr $v $max) $res) )

;; Helper for Jacobian translation.
( (max-subscript $expr $v
                 $max)

    (get-global SYMBOLIC-MODE true:) 
    (id $max (op_add (max_subscript $expr $v) 1)) )

( (max-subscript $expr $v
                 (op_negate 1)) )


( (tjacob $tag $form $res)

    ;; If the second argument is not a single variable, but
    ;; rather a literal vector of variables, we can transform
    ;; the problem into one involving only a single variable.
    (id $form ($expr (op_matrix $r $c (list | $vars)) $max))
    
    (strip-to-num $r $nv)
    (strip-to-num $c 1:)    

    (new-temp 0 $v)
    (tjacob-multi $tag $expr $v $vars $jacob) (!)
    (id $res
        (let (($v (op_matrix $r $c (list | $vars))))
             $jacob)) )
    
( (tjacob-multi $tag $expr $v $vars $res)

    ;; This translation is only appropriate for symbolic Jacobians
    (get-global SYMBOLIC-MODE true:)

    (make-sym-unbound $vars $svars)
    (texp $expr $texpr)
    
    (tjacob-loop $tag $v 0 $loop)
    (make-sym-unbound ($v) ($sv))
    (jacob-subscripts $sv 0 $vars $subscripts)
    
    (id $res
        (let ((expr  ((lambda $vars $texpr) | $svars))
              (lam1  ((numeric SLam) (numeric (list | $svars)) expr))
              (vexpr (lam1 | $subscripts))
              (lam   ((numeric SLam) (numeric (list $sv)) vexpr)))
          $loop)) )

( (tjacob-multi $tag $expr $v $vars $res)

    (jacob-wrap-let $v $vars $expr $lexpr)
    (tjacob $tag ($lexpr $v 0) $res) )


( (tjacob $tag $form $res)

    ;; This translation is only appropriate for symbolic Jacobians
    (get-global SYMBOLIC-MODE true:)

    (id $form ($expr $v $max))
    (strip-local $v $sv)
    (texp $expr $texpr)
    (tjacob-loop $tag $v $max $loop)

    (id $res
        (let ((var  ((numeric make_sym) (numeric (unboxed (string $sv)))))
              (expr ((lambda ($v) $texpr) var))
              (lam  ((numeric SLam) (numeric (list (symbolic () var))) expr)))
          $loop))
)

( (tjacob $tag $form $res)

    (id $form ($expr $v $max))
    (texp $expr $texpr)
    (tjacob-loop $tag $v $max $loop)

    (id $res
        (let ((lam (lambda ($v) $texpr)))
          $loop))
)

;; Helper for Jacobian translation.
( (tjacob-loop $tag $v $max $res)

    (texp $max $tmax)
    (id $res
        (let ((max  (if (bv (is_vector $v))
                        (op_sub (mc_rows $v) 1)
                        (op_sub $tmax 1)))
              (vT   0)
              (res  0))
          (if (op_geq:$tag max 0)
              (progn
                (for i (numeric (forRange2 0 max))
                   (setf (subscript vT (as_i4 i))
                         ;; Note: It may seem pointless to add ORIGIN
                         ;; and then immediately subtract it,
                         ;; but subsequent stages of translation
                         ;; are sensitive to this.
                         (subscript $v (sub_i4 (add_i4 (as_i4 i) _ORIGIN_i4)
                                               _ORIGIN_i4))))
                
                (export vT)
              
                (for i (numeric (forRange2 0 max))
                   (progn
                     (setf vtmp (subscript vT (as_i4 i)))
                     (setf (op_matcol res (as_i4 i)) 
                           $deriv)))
                
                res)
              ;; else
              (op_deriv_1:$tag lam $v)))) 

    (matrix-deriv $tag $deriv)
)


;; Helper for Jacobian translation.
( (simple-deriv $tag $res)

    (id $res (op_deriv_1:$tag
                 (lambda (vtmp) (progn 
                                  (setf (subscript vT (as_i4 i))
                                        vtmp)
                                  (lam vT)))
                         vtmp)) )

( (matrix-deriv $tag $res)

    (get-global SYMBOLIC-MODE true:)
    ;; This works symbolically because MuPAD can differentiate
    ;; a vector-valued function of a scalar.
    (simple-deriv $tag $res) )

( (matrix-deriv $tag $res)

    (id $res 
        (let ((v0    (lam vT)))
         (let ((rows (mc_rows v0)))
          (if (op_eq rows 0)
              $simple
              (let ((r0 0))
               (progn
                (for j (numeric (forRange2 0 (op_sub rows 1)))
                  (progn
                   (setf (subscript r0 (as_i4 j))
                         (op_deriv_1:$tag
                             (lambda (vtmp) (progn
                                              (setf (subscript vT (as_i4 i))
                                                    vtmp)
                                              (subscript (lam vT) (as_i4 j))))
                             vtmp))))
                r0))))))

    (simple-deriv $tag $simple) )
             
;; Helper for Jacobian translation.
( (jacob-wrap-let $v $vars $expr
                  (let $bindings
                       $expr))

    (jacob-let-bindings 0: $v $vars $bindings) )

( (jacob-let-bindings $n $v ($var | $rest)
                      (($var (subscript $v $nn)) | $bindings))

    (id $nn $n)
    (+ $n 1 $m)
    (jacob-let-bindings $m $v $rest 
                        $bindings) )

( (jacob-let-bindings $n $v () ()) )

;; Helper for Jacobian translation.

( (jacob-subscripts $v $n ($_ | $vars) ($sub | $subscripts))

    (id $sub (subscript $v $n))
    (+ $n 1 $m)
    (jacob-subscripts $v $m $vars $subscripts) )

( (jacob-subscripts $v $n () ()) )


;; Helper for Jacobian translation.
( (make-sym-unbound ($v | $vars) ($sv | $svars))

    (strip-local $v $v1)
    (id $sv ((numeric make_sym) (numeric (unboxed (string $v1)))))
    (make-sym-unbound $vars $svars) )

( (make-sym-unbound () ()) )


;;* NABLA
;;*
;;*
( (tform nabla: $tag $form $res)

    (last    $form $expr) (!)
    (rm-last $form $vars) (!)
    (length  $vars $nv)   (!)
    (tnabla $nv $tag $expr $vars $texpr)
    (new-temp 0 $tmp)
    (id $res (let (($tmp $texpr))
                (if (bv (is_matrix $tmp))
                    (if (op_eq (mc_rows $tmp) 1)
                        (op_transpose $tmp)
                        $err)
                    $tmp)))

    (find-tag $expr $t)
    (terror-whole   $t "must be scalar-valued" $err) )

( (tnabla 1: $tag $expr ($v) $res)

    (find-tag $expr $t)
    (tjacob $t ($expr $v) $res) )


( (tnabla $nv $tag $expr $vars $res)

    (find-tag $expr $t)
    (id $mat (op_matrix (unboxed $nv) (unboxed 1) (list | $vars)))    
    (tjacob $t ($expr $mat) $res) )


;; If nabla is invoked without any variables specified, it comes
;; through like this.  We're supposed to infer the variables
;; (see bug 060912-125337).

( (tform mc_∇: $tag $form $res)

    (id $form ($expr))
    (find-nabla-vars $expr $vars) (!)
    (id $vars ($_ | $__)) ; make sure there's at least one variable
    (concat $vars ($expr) $newform)
    (tform nabla: $tag $newform $res)
)

;; Helpers for nabla translation.

( (find-nabla-vars $x $res)

    (fnv-helper-1 $x () $res))

; Ignore expressions in function position.  For example,
; in f(x,y), we want to find x and y, but not f.
( (fnv-helper-1 ($x | $r) $accum
                $res)

    (fnv-helper-2 $r $accum $res) )

( (fnv-helper-1 $x $accum
                $res)

    (is-nabla-var $x)
    (append-unique $accum $x $res) )

( (fnv-helper-1 $x $accum $accum) )

( (fnv-helper-2 ($x | $r) $accum
                $res)

    (fnv-helper-1 $x $accum
                  $accum1)
    (fnv-helper-2 $r $accum1
                  $res))

( (fnv-helper-2 () $accum $accum) )


( (is-nabla-var $x)

    (strprefix $x mc_:) )
    
;;* TRACE
;;*
;;* Requires special translation symbolically to fix bug
;;* 051212-155713.

( (tform mc_trace: $tag $form $res)

    (get-global SYMBOLIC-MODE true:)
    (not-bound mc_trace:)
    (id $res 0) ; dummy value that won't cause errors
)

;;* RELATION
;;*
;;* Translate the '(relation (operators)...)' special form, which yields a section
;;* over the the relation chain formed from the given relational operators.

( (tform relation: $tag ($op) $op) )

( (tform relation: $tag $ops $res)

   (new-temp 0 $y)
   (trel $ops $y $e $v)
   (texp (lambda ($y | $v) $e) $res)
   )

; trel (list-of-rel-ops) parameter => body (list-of-params)

( (trel ($o) $x
      ($o $x $y) ($y))
   (new-temp 0 $y)
   )

( (trel ($o | $os) $x
      (and ($o $x $y) $e)
      ($y | $v))
   (new-temp 0 $y)
   (trel $os $y $e $v)
   )

;;* AMBIGUOUS SYMBOLS
;;*
;;* Special translation for ambiguous symbols like "min" and "sec". We try to
;;* infer what the user meant by the context in which the symbol appears.

( (tform $name_font? $tag $args $res)

   (strip-font $name_font? $name_nofont)                    ; strip font information
   (not-bound $name_font?)                             ; This may fail
   (is-ambiguous $name_nofont)                              ; This may fail
   (texp-each $args $targs)                            ; Translate arguments
   (id $res ((qualified MC_mc $name_font?:$tag) | $targs))  ; Qualify operator
   )

;;* FUNCTION APPLICATION
;;*
;;* Anything else must be a simple function application.

( (tform $f $tag $args $res)

   (set-tag $f $tag $ff)                                    ; $f might be PCons, so be careful when putting a tag
   (texp-each ($ff | $args) $res)
   )

;;****************************************************************************
;;* ERROR HANDLING
;;*
;;* Translate a problem at compile time into a runtime error.


;; terror = translation error -- aren't they a 'terror'?
;;
;; terror-whole marks the whole form at that tag
;; terror-op    marks the operator at that tag
;; terror-param marks the parameter at that tag

( (terror-whole $tag $msg $res) (!) 

  ;; When the "parameter" number is -1, the whole form gets marked.
  ;;
  ;; e.g., in foo(x,y) you can mark all of foo(x,y) as we've done here
  ;; by specifying parameter -1.
  ;;
  ;; NOTE: We _would_ say (unboxed -1) here instead of (neg_i4 (unboxed 1))
  ;;       but "-" is an operator here and the net effect is not pretty.
  ;;       -kmp 16-Feb-2006

  (id $res (numeric (error2:$tag (string $msg) (unboxed $tag) (neg_i4 (unboxed 1))) )) ) 
  
( (terror-op $tag $msg $res) (!) 

  ;; When the "parameter" number is 0, the operator gets marked.
  ;; e.g., in foo(x,y) you can mark foo as we've done here by specifying parameter 0.

  (id $res (numeric (error2:$tag (string $msg) (unboxed $tag) (unboxed 0)) )) )

( (terror-param $n $tag $msg $res) (!) 

  ;; When the "parameter" number is an integer greater than 0, 
  ;; it denotes the corresponding parameter.  
  ;;
  ;; e.g., in foo(x,y) you can mark x by using $n=1, or y by $n=2.

  (id $res (numeric (error2:$tag (string $msg) (unboxed $tag) (unboxed $n)) )) )



;;****************************************************************************
;;* GET RANGES
;;*
;;* Any other top-level expression involving ranges

( (get-ranges $expr $ranges)

   (gather-range-subscripts (0:) $expr () $all-ranges) (!)
   (remove-duplicates $all-ranges $ranges) (!)
   )

( (gather-range-subscripts ($mode) (op_matrix $r $c (list | $v)) $r-accum
         $res)
   (map-accum &gather-range-subscripts-%-4 (0:) $v $r-accum $res) (!)
   )

( (gather-range-subscripts ($mode) (subscript $e | $subs) $r-accum
         $ranges)
   (map-accum &gather-range-subscripts-%-4 (1) $subs $r-accum $ranges) (!)
   )

( (gather-range-subscripts ($mode) (op_matcol $e | $subs) $r-accum $ranges)

   (map-accum &gather-range-subscripts-%-4 (1) $subs $r-accum $ranges) (!)
   )

( (gather-range-subscripts (1) $x $r-accum
         ($x | $r-accum))

   (is-range $x) (!) )

( (gather-range-subscripts ($mode) ($x | $r) $r-accum $res)

   (gather-range-subscripts ($mode) $r $r-accum $res1) (!)
   (gather-range-subscripts ($mode) $x $res1 $res) (!)
   )

( (gather-range-subscripts ($mode) $x $r-accum $r-accum) )

( (make-range-program $tag $ranges $vars $body $res)

    (mkrp-help $tag $ranges $vars $body () $prog $init)
    (make-inits $init $prog $res)
    )

( (make-inits () $prog $prog) )

( (make-inits ($init | $inits) $prog $res)

   (make-inits $inits $prog $inner)
   (id $res (let ($init) $inner))
   )

( (mkrp-help $tag ($r | $ranges) $vars $body $init
         $res $init1)
    (new-temp 0 $rng)

    (iterate $tag $r (numeric (forRangeVar:$tag $rng))
                     $body $prog)

    (id $i1 (($rng $r) ($r zero_)))
    (concat $i1 $init $i2)
    (mkrp-help $tag $ranges $vars $prog $i2 $res $init1) )

( (mkrp-help $tag () $vars $body $init
         $res $init)
    (id $res (progn:$tag $body (tuple | $vars))) )

;;*-------------------------------------------------------------
;;* TINDEX
;;*
;;* Index translation
;;*
;;* (tindex $e $org => $te $tv)
;;* Input
;;*    $e    an index expression
;;*    $org  integer expression (variable) of ORIGIN
;;* Output
;;*    $te   an integer expression
;;*    $tv   list of variables which must be integral
;;*          in order that the expression have integral value
;;*

;;* Convert $e into an integer and subtract integer form of ORIGIN
( (tindex $e $org
          (sub_i4 $te $org) $tv)

   (tint $e $te $tv)
   )

;;* simpler form of tindex which supplies the "correct" integer
;;* name of ORIGIN which is known to the purify step.

( (tidx $e $te)
         (tindex $e _ORIGIN_i4 $te $ignore)
)

;;* TINT
;;*
;;* (tint $e => $te $tv)
;;* Input
;;*    $e    a Mcad expression whose value should be integral
;;* Output
;;*    $te   $e converted to I4
;;*    $tv   list of variables determined to be integral

( (tint $i (unboxed $i) ())

   (integral $i) (!)
   )

( (tint $v:$t (as_i4:$t $v) ($v:$t))

   (identifier $v) (!)
   )

( (tint ($op $e1 $e2) ($top $te1 $te2) $tv)

   (i4op $op $top)
   (tint $e2 $te2 ())   ;;*integral with no assumptions about variables.
   (tint $e1 $te1 $tv)
   )

( (tint $e:$t
         (as_i4:$t $te) (Bogus) ) ;;*return a bogus list of variables so test above will fail

   (texp $e:$t $te)
   )

( (tint $e
         (as_i4 $te) (Bogus) ) ;;*return a bogus list of variables so test above will fail

   (texp $e $te)
   )

;;* I4OP
;;*
;;* (i4op $mcOperator $i4Operator)
;;* Input
;;*    $mcOperator  Mcad operator
;;* Output
;;*    $i4Operator  Corresponding operation on integers

( (i4op op_add add_i4) )
( (i4op op_sub sub_i4) )

;;****************************************************************************
;;* TRANS-TUPLE-DEFINE env tag form rhs result
;;*
;;* top-level simultaneous assignment, no ranges
;;* ** TO DO ** Is this correct? No need to deal with subscripted assignments in tuple variables?

( (trans-tuple-define $tag ((op_matrix $rows $cols (list | $lhss)) $rhs)
         (define:$tag (tuple | $lhss) $trhs))

   (texp $rhs $trhs)
   )

; 1-tuple definitions are the same as ordinary definitions

( (trans-tuple-define $tag ($lhs $rhs) $res)

   (trans-define $tag $lhs $rhs $res)
   )

;;****************************************************************************
;;* Handle result simplification

;; Expression with affine unit function in placeholder expression. Notice how
;; the translation wraps the inverse function with a lambda:
;;
;;    (lambda (x) ($tinverse x))
;;
;; This ensures that the signle argument to $tinverse is visible to the hidden
;; argument processing.

( (trans-simplify $tag ($expr $function) $res)

   (get-affine-inverse $function $inverse)               ; Get name of inverse
   (is-callable-with $function)                     ; Is a function?
   (is-callable-with $inverse  1:) (!)              ; Is a unary function?

   (trans-eval $tag $expr $texpr)
   (texp $inverse $tinverse)
   (wrap-result $tag (apply_affine_unit:$tag $texpr (lambda (x) ($tinverse x))) $res) (!)
	)

;; Expression with regular unit placeholder expression.

( (trans-simplify $tag ($expr $units) $res)

   (trans-eval $tag $expr $texpr)
   (texp $units $tunits)
   (new-temp 0 $tmp)
   (wrap-result $tag (divide_by_unit:$tag (let (($tmp $texpr)) $tmp) $tunits) $res) (!)
   )

;; Expression without unit placeholder expression.

( (trans-simplify $tag ($expr) $res)

   (trans-eval $tag $expr $texpr)
   (wrap-result $tag $texpr $res)
   )

;;****************************************************************************
;;* TRANS-EVAL env expr result
;;*
;;* Eval translation.

( (trans-eval $tag $expr $res)

   (find-all-ranges $expr $ranges) (!)     ;* identify ranges in the translation
   (texp $expr $texpr)                     ;* translate the expression
   (trans-range-eval $tag $texpr $ranges $re)   ;* wrap with loop if necessary
   (id $res (reset $re))
   )

;;****************************************************************************
;;* TRANS-RANGE-EVAL
;;*

( (trans-range-eval $tag $texpr () $res)        ;* No ranges
  (!)
  (id $texpr $res)                              ;* return texpr
  )

( (trans-range-eval $tag $texpr $ranges $res)   ;* Some ranges

   (new-temp 0 $result)
   (id $body (progn:$tag (setf $result (push':$tag $result $texpr)) $result))
   (make-range-program $tag $ranges ($result) $body $rprog)
   (prod-steps $ranges $nsteps)
   (id $res (progn:$tag (setf $result (set_IsRange (reserve' $nsteps)))
                        $rprog
                        (mm $result)))
   )

( (prod-steps () (unboxed 1) ) )
( (prod-steps ($r) (range_steps $r) ) )
( (prod-steps ($r | $rs)
         (mul_i4 (range_steps $r) $rest))
   (prod-steps $rs $rest) )

;;*find all ranges

( (find-all-ranges $expr
         $ranges)
    (frn-help $expr () $all-ranges) (!)
    (remove-duplicates $all-ranges $tmp) (!)
    (reverse $tmp $ranges)
    )

;;****************************************************************************
;;* REMOVE
;;*
;;* Remove 'x' from 'list' and append 'tail'

( (remove ($x | $xs) $x $tail $res)  (!)

   (remove $xs $x $tail $res)
   )

( (remove ($y | $xs) $x $tail $res)  (!)

   (remove $xs $x $tail $ys)
   (id $res ($y | $ys))
   )

( (remove () $x $tail $tail) (!) )

;;* helper

( (frn-help ($root $expr $var $a $b) $accum
         $res)

   (strip-font $root $root_nofont)                       ; strip font information
   (is-root $root_nofont)                                ; is it root?
   (not-bound $root) (!)                            ; is it bound in the document
                                                         ; Special translation
   (frn-help $expr () $res1)
   (remove $res1 $var $accum $res2)
   (frn-help $a $res2 $res3)
   (frn-help $b $res3 $res)
  )


;; Ignore ranges among symbolic keywords; fixes bug
;; 060616-123753.
( (frn-help (symbolic $keywords $expr) $accum
            $res)

    (get-global SYMBOLIC-MODE $old-symbolic-mode)
    (set-global SYMBOLIC-MODE true:)

    (frn-help $expr $accum
              $res) 

    (set-global SYMBOLIC-MODE $old-symbolic-mode)
)


( (frn-help ($f | $args) $accum
         $res)

   (frn-f $f $accum $res1)         ;* This will fail if $f == (constant no-loop)
   (frn-each $args $res1 $res)
   )

( (frn-help $e $accum $res)
   (is-range $e)
   (id $res ($e | $accum))
   )

( (frn-help $e $accum $accum) )

;* ignore ranges inside no-loop; that's its purpose, after all
( (frn-f (constant no-loop) $accum $res)
   (!) (fail 0)
   )

( (frn-f $f $accum $res)
   (frn-help $f $accum $res)
   )

( (frn-each ($e | $es) $accum $res)
   (frn-help $e $accum $res1)
   (frn-each $es $res1 $res)
   )

( (frn-each () $accum $accum) )

;;* translation of non-top-level expressions

( (tsubscript $tag ($m $s) $res)

   (texp $m $tm)
   (tidx $s $ts)
   (id $res (subscript:$tag $tm $ts))
   )

( (tsubscript $tag ($m $s1 $s2) $res)

   (texp $m $tm)
   (tidx $s1 $ts1)
   (tidx $s2 $ts2)
   (id $res (subscript:$tag $tm $ts1 $ts2))
   )

( (tsetf $tag (subscript:$t $m $s) $rhs
              (setf:$tag (subscript:$t $tm $ts) $trhs))

   (texp $m $tm)
   (texp $rhs $trhs)
   (tidx $s $ts)
   )

( (tsetf $tag (subscript:$t $m $s1 $s2) $rhs
              (setf:$tag (subscript:$t $tm $ts1 $ts2) $trhs))

   (texp $m $tm)
   (texp $rhs $trhs)
   (tidx $s1 $ts1)
   (tidx $s2 $ts2)
   )

;;* translation for local assignments to matcol

( (tsetf $tag (op_matcol:$t $m $c) $rhs
              (setf:$tag (op_matcol:$t $tm $tc) $trhs))

   (texp $m $tm)
   (tidx $c $tc)
   (texp $rhs $trhs)
   )

;;* local tuple assignment

( (tsetf $tag $lhs $rhs
         (progn:$tag | $all-bindings))

   (id $lhs (op_matrix $r $c (list | $v)))
   (id $rhs (op_matrix $r $c (list | $e)))
   (texp-parallel $tag $v $e $tmp-bindings $lhs-bindings $tmps)
   (new-temp 0 $resv)
   (id $res (let (($resv (op_matrix $r $c (list | $tmps)))) $resv))
   (append ($tmp-bindings $lhs-bindings ($res) ) $all-bindings)
   )

( (texp-parallel $tag ($lhs | $lhss) ($rhs | $rhss)
         $res1 $res2 $res3)
   (new-temp 0 $tmp)
   (texp (setf:$tag $tmp $rhs) $set-tmp)
   (texp (setf:$tag $lhs $tmp) $set-lhs)
   (texp-parallel $tag $lhss $rhss $more-tmps $more-lhs $tmps)
   (id $res1 ($set-tmp | $more-tmps))
   (id $res2 ($set-lhs | $more-lhs))
   (id $res3 ($tmp | $tmps))
   )

( (texp-parallel $tag () () () () ()) )

( (texp-sequential $tag ($lhs | $lhss) ($rhs | $rhss)
         $res)

   ;; The MC_possibly_free qualifier means that
   ;; this binding will override that qualifier.
   ;; This is part of a fix for bug 070115-133549.
   (texp (setf:$tag (MC_possibly_free $lhs) $rhs) $set-lhs)
   (texp-sequential $tag $lhss $rhss $more-lhs)
   (id $res ($set-lhs | $more-lhs))
   )

( (texp-sequential $tag () () ()) )

;;* destructuring assignment

( (tsetf $tag (op_matrix $rows $cols (list | $v)) $rhs $res)

   (new-temp 0 $tmp)
   (strip-to-num $rows $r)
   (strip-to-num $cols $c)
   (texp $rhs $trhs)
   (destructure $v $r $c 0: 0: $tmp $bindings)
   (id $res (progn:$tag | ((setf $tmp $trhs) | $bindings)))
   )

( (destructure $v $r $c $r $j $val      ;;*finished a column -- $i == $r
         $res)
   (+ $j 1: $nj)                                   ;;*nj = j + 1 -- next column
   (destructure $v $r $c 0: $nj $val $res) ;;*0th row, next column
   )

( (destructure ($v | $vs) $r $c $i $j $val
         ($set | $more))
   (+ $i 1: $ni)                                   ;;*ni = i + 1
   ;; TODO: Find a way to eliminate the addition of ORIGIN
   ;;       here (it just gets subtracted away later).
   ;;       We don't want to use a literal getm_2 call
   ;;       because that won't work symbolically.
   (texp (setf $v (subscript $val 
                                  (op_add $i mc_ORIGIN) 
                                  (op_add $j mc_ORIGIN))) 
              $set)
   (destructure $vs $r $c $ni $j $val $more)
   )

( (destructure () $r $c $i $j $val
         ($val))    ;; tack RHS onto end of bindings to represent the value of the assignment expression
   )

;;* Note: The op_parens wrapper below is necessary.
;;*      MPL disallows let expressions in certain
;;*      contexts, e.g.:
;;*
;;*   (symboliccb 414510488$ 415894864$
;;*        let
;;*        {
;;*          _val = dummy_1;
;;*        }
;;*        in (result _val (typeof _val)))
;;*
;;*      If the let is wrapped in parentheses, all is well.

( (wrap-result $tag $x
         (op_parens
            (let ((_val:$tag $x))
               (result:$tag _val (typeof _val)))))
   )

;;*translation of `for`

( (tfor $tag ($id $range $body) $prog)
   (get-iter $range $iterator)
   ;(texp $id $tid)
   (texp $body $tbody)
   (id $prog (for:$tag $id $iterator $tbody))
   )

; create an iterator from a range2
( (get-iter (op_range2:$t $init $end)
         $iterator)
   (texp $init $tinit)
   (texp $end $tend)
   (id $iterator (forRange2:$t $tinit $tend))
   )

; create an iterator from a range3
( (get-iter (op_range3:$t $init $next $end)
         $iterator)
   (texp $init $tinit)
   (texp $next $tnext)
   (texp $end $tend)
   (id $iterator (forRange3:$t $tinit $tnext $tend))
   )

( (seq-iterator $args $vec)

   (length $args $n)
   (strglue tup2vec_ $n $tup2vec)
   (id $vec ((numeric forValues)
               ((numeric $tup2vec) (tuple | $args))))
   )

;;( (all-to-numeric ($x | $r)
;;                  ((to-numeric $x) | $tr))
;;    (all-to-numeric $r $tr) )
;;( (all-to-numeric () ()) )

( (get-iter (list | $vals)
         $iterator)

   (get-iters $vals $its)
   (seq-iterator $its $iterator)
   )

( (get-iters () () ) )
( (get-iters ($v | $vs)
         $its)

   (get-iter $v $it)
   (get-iters $vs $more)
   (id $its ($it | $more))
   )

; create an iterator from a value (scalar, vector, or matrix)
( (get-iter $mat
         $iterator)
   (texp $mat $tmat)
   ;;(find-tag $mat $t)
   (new-temp 0 $x)
   (id $iterator (numeric (forValue $tmat)))
   )

; Base translation of collection iterations.
( (iterate $tag $tid $iterator $tbody   ;;*id, iterator, and body are assumed translated.
         (for:$tag $tid $iterator $tbody))
         )

;( (iterate $tag $tid $iterator $tbody   ;;*id, iterator, and body are assumed translated.
;         $prog)
;
;   (new-temp 0 $it)               ;;*iterator
;   (id $prog (progn:$tag
;                  (setf:$tag $it (numeric $iterator))
;                  (setf:$tag $tid (numeric zero_))
;                  (while:$tag (numeric (bv (not_null $it)))
;                              (progn:$tag (setf $tid (numeric (val_first $it)))
;                                          (setf $it (numeric (val_next $it)))
;                                          $tid
;                                          $tbody))))
;   )


( (t_in_set $tag ($elem $set) $res) (!)

  (texp $elem $telem)
  (new-temp 0 $elemvar)
  (t_in_set_helper $tag $elemvar $set $boolexpr)

  (id $res (let (($elemvar $telem)) $boolexpr)) )

( (t_in_set_helper $tag $elemvar (intersect:$t $a $b) $res)

    (t_in_set_helper $tag $elemvar $a $ta)
    (t_in_set_helper $tag $elemvar $b $tb)

    (id $res (op_and:$t $ta $tb)) )

( (t_in_set_helper $tag $elemvar (union:$t $a $b) $res)

    (t_in_set_helper $tag $elemvar $a $ta)
    (t_in_set_helper $tag $elemvar $b $tb)

    (id $res (op_or:$t $ta $tb)) )

( (t_in_set_helper $tag $elemvar (minus:$t $a $b) $res)

    (t_in_set_helper $tag $elemvar $a $ta)
    (t_in_set_helper $tag $elemvar $b $tb)

    (id $res (op_and:$t $ta (op_not:$t $tb))) )

( (t_in_set_helper $tag $elemvar (Interval:$t (list $a) $b) $res)

    ;;(trace2 "t_in_set Interval" (Interval:$t (list $a) $b))
    (texp $a $ta)
    (texp $b $tb)
    
    (id $res (op_and:$t (op_lt:$t $ta $elemvar) (op_geq:$t $tb $elemvar))) )

( (t_in_set_helper $tag $elemvar $set $res)

  ;(trace2 "t_in_set elem" $elem )
  ;(trace2 "t_in_set set"  $set )
  (get-element-of-alias $tag $set $op)
  ;(trace2 "t_in_set op" $op)
  (id $res ($op:$tag $elemvar)) 
  ;(trace2 "t_in_set res" $res)
 )

( ( get-element-of-alias $tag $set $res )
  ( element-of-alias $set $res )
; (trace2 "get-element-of-alias(1) res" $res)
 )

( ( get-element-of-alias $tag $set $res ) (!)
  (terror-param 2 $tag "bad_syntax" $res)
; (trace2 "get-element-of-alias(2) res" $res)
 )

;;*special translations for root

( (troot $tag ($expr $var) $root_font? $res) (!)
  ;; Two-argument case of root(...) becomes mc_root(...)

  (texp $expr $texpr)
  (id $res ($root_font?:$tag (lambda:$tag ($var) $texpr) $var)) )

( (troot $tag ($expr $var $a) $root_font? $res) (!)
  ;; Three argument case of root(...) is illegal.

  (terror-whole $tag "bad_syntax" $res) )

( (troot $tag ($expr $var $a $b) $root_font? $res) (!)
  ;; Four-argument case of root(...) becomes mc_root_bracket_(...)

  (texp $expr $texpr)
  (texp $a $ta)
  (texp $b $tb)
  (strip-font $root_font? $root_nofont)
  (strcat $root_nofont _bracket_ $bracket)
  (id $res ($bracket:$tag (lambda:$tag ($var) $texpr) $ta $tb)) )

;;* TO DO ** Note: for these to be correct translations
;;*                  all of the argument must actually have boolean type

( (tand $tag ($x) $tx)

   (texp $x $tx)
   )

( (tand $tag ($x | $r)
         (if:$tag $tx $tr zero_))

   (texp $x $tx)
   (tand $tag $r $tr)
   )

( (tor $tag ($x) $tx)

   (texp $x $tx)
   )

;;* TO DO ** If $x has boolean type then the setf is unnecessary: translate as (if $tx True $tr)

( (tor $tag ($x | $r)
       (progn:$tag (setf o_ $tx) (if:$tag o_ o_ $tr)))

   (texp $x $tx)
   (tor $tag $r $tr)
   )

;;****************************************************************************

( (tcreatemesh $name $tag ($f1 $f2 $f3 | $args)
         ($name:$tag (unboxed 3) $F | $targs))

   (is-callable-with $f1 2:)
   (is-callable-with $f2 2:)
   (is-callable-with $f3 2:) (!)
   (id $F (lambda (u v) (op_matrix (unboxed 3) (unboxed 1)
                           (list ($f1 u v) ($f2 u v) ($f3 u v)))))
   (tmesh-space-args $args $targs)
   )

( (tcreatemesh $name $tag ($F | $args)
         ($name:$tag (unboxed 0) $tF | $targs))

   (texp $F $tF)
   (tmesh-space-args $args $targs)
   )

( (tcreatespace $name $tag ($f1 $f2 $f3 | $args)
         ($name:$tag (unboxed 3) $F | $targs))

   (is-callable-with $f1 1:)
   (is-callable-with $f2 1:)
   (is-callable-with $f3 1:) (!)
   (id $F (lambda (u) (op_matrix (unboxed 3) (unboxed 1)
                           (list ($f1 u) ($f2 u) ($f3 u)))))
   (tmesh-space-args $args $targs)
   )

( (tcreatespace $name $tag ($F | $args)
         ($name:$tag (unboxed 0) $tF | $targs))

   (texp $F $tF)
   (tmesh-space-args $args $targs)
   )

( (tmesh-space-args $args
         $res)

   (last $args $fmap_font?)                              ; Take last argument
   (strip-font $fmap_font? $fmap)                        ; Strip the font tag
   (is-n-ary-coordinate-mapping $fmap)                   ; Is it special one?
   (not-bound $fmap)                                ; And not rebound?
   (rm-last $args $args1)                                ; Drop from the list
   (texp-each $args1 $r)                            ; Translate the list
   (id $res ((Really (lambda (x) ($fmap x))) | $r))      ; Prefix unary map
   )

( (tmesh-space-args $args
          $res)

   (last $args $fmap)
   (is-coordinate-mapping $fmap)
   (texp $fmap $tfmap)
   (rm-last $args $args1)
   (texp-each $args1 $r)
   (id $res ((Really $tfmap) | $r))
   )

( (tmesh-space-args $args
         (Null | $r) )

   (texp-each $args $r)
   )

;;****************************************************************************
;;* IS-N-ARY-COORDINATE-MAPPING name
;;*
;;* Is 'name' one of the special n-ary coordinate mapping functions that get a
;;* special translation when passed as a function argument to either the Space
;;* or Mesh  functions?

( (is-n-ary-coordinate-mapping mc_pol2xy:) )
( (is-n-ary-coordinate-mapping mc_xy2pol:) )
( (is-n-ary-coordinate-mapping mc_cyl2xyz:) )
( (is-n-ary-coordinate-mapping mc_sph2xyz:) )
( (is-n-ary-coordinate-mapping mc_xyz2cyl:) )
( (is-n-ary-coordinate-mapping mc_xyz2sph:) )

;;****************************************************************************
;;* IS-COORDINATE-MAPPING name
;;*
;;# Is 'name' a unary or ternary function?

( (is-coordinate-mapping $name) (is-callable-with $name 1:))
( (is-coordinate-mapping $name) (is-callable-with $name 3:))

;;* Is 'name' bound in either the document or static environment, and if so,
;;* is it callable with 'arity' arguments?

( (is-callable-with $name)
   (signature $name $signature)                          ; Has type signature?
   (is-function $signature)                              ; Describes function?
   )

( (is-callable-with $name $arity)
   (signature $name $signature)                          ; Has type signature?
   (accepts   $signature $arity)                         ; Callable with args?
   )

( (signature $name $signature)

   (lookup-type $name $signature) (!)                    ; Is document bound?
   )

( (signature $name $signature)
   (lookup-sig "": $name $signature) (!)                 ; Is statically bound?
   )

( (signature $name_font? $signature)
   (strip-font $name_font? $name_nofont)                 ; strip font information
   (lookup-sig "": $name_nofont $signature) (!)          ; Is statically bound?
   )

;;****************************************************************************
;;*vectorization

( (vectorize-apply $tag ((constant | $any1) | $any2) $res)

   (texp ((constant | $any1) | $any2) $res)
   )

;;*vectorization of user defined functions

( (vectorize-apply $tag ($f | $args) $res)

   (lookup-type $f $_)
   (simple-vectorization $tag $f $args $res)
   )

;;*vectorization of builtin functions

( (vectorize-apply $tag ($f | $args) $res)

   (lookup-sig-t $f $_)                                  ; It's a builtin
   (!)                                                   ; no turning back.
   (tag $f $tagless $t)                                  ; Break off the tag
   (strip-font $tagless $key)                            ; and strip the font

   (builtin-vectorization $tag $key $f $args $res)  ; go do it.
   )

;;* The 'relation' special form looks like a function application but isn't.
;;* (Jacob and nabla fall into this category as well.)
( (vectorize-apply $tag ($s:$t | $args) $res)

   (ignore-vectorization-special $s) (!)
   (texp ($s:$t | $args) $res)
   )

;;*vectorization of lexically bound functions

( (vectorize-apply $tag ($f | $args) $res)

   (!) ; must be (lexically-bound $f) ; its not document bound and not statically bound
   (simple-vectorization $tag $f $args $res) (!)
   )

( (simple-vectorization $tag $f $args
         (vectorize:$tag $tf | $targs) )

   (texp $f $tf)
   (texp-each $args $targs)
   )

;;* builtin-vectorization
;; ENV
;; TAG   of vectorization
;; key   tagless, strip-fonted
;; NAME  The original tag'd, font'd token
;; ARGS  list of remaining args
;; RES   the output

( (builtin-vectorization $tag op_power: $name $args $res)

   (power-vectorization $tag $name $args $res)
   )

( (builtin-vectorization $tag op_nthroot: $name $args $res)

   (power-vectorization $tag $name $args $res)
   )

( (builtin-vectorization $tag and: $name $args $res)

   (macro-vectorization $tag $name $args $res)
   )

( (builtin-vectorization $tag or: $name $args $res)

   (macro-vectorization $tag $name $args $res)
   )

( (builtin-vectorization $tag op_not: $name $args $res)

   (macro-vectorization $tag $name $args $res)
   )


( (builtin-vectorization $tag mc_interp: $name $args $res)

   (texp-each $args $targs)
   (id $targs ($s $x $y $p))     ; Oh, retch, this can fail
   (new-temp 0 $sv)
   (new-temp 0 $xv)
   (new-temp 0 $yv)
   (new-temp 0 $pv)
   (vectorize1 $tag (lambda ($pv) ($name $sv $xv $yv $pv)) $p
               $vec1)
   (id $res
      (let (($sv $s))
      (let (($xv $x))
      (let (($yv $y))
         $vec1))))

   )

( (builtin-vectorization $tag $key $name $args $res)

   (ignore-vectorization $key) (!)
   (texp ($name | $args) $res)
   )

( (builtin-vectorization $tag $key $name $args $res)

   (use-simple-vectorization $key) (!)
   (simple-vectorization $tag $name $args $res)
   )

( (builtin-vectorization $tag $key $name $args $res)

   (texp ($name | $args) $tcall)
   (id $tcall ($tf | $targs))

   (vecparams $targs $params $aargs $vargs)

   (id $res (vectorize:$tag (lambda:$tag $params ($tf | $aargs) ) | $vargs))
   )

;; How might the previous variant fail?
( (builtin-vectorization $tag $key $name $args $res)

   (texp-each $args $targs)

   (vecparams $targs $params $aargs $vargs)

   (texp ($name | $aargs) $tf)

   (id $res (vectorize:$tag (lambda:$tag $params $tf) | $vargs))
   )

( (macro-vectorization $tag $f $args $res)
   (texp-each $args $targs)

   (vecparams $targs $params $aargs $vargs)

   (texp ($f | $aargs) $tf)

   (id $res (vectorize:$tag (lambda:$tag $params $tf) | $vargs))
   )

( (devectorize (vectorize $exp) $res) (!)

   (devectorize $exp $res)
   )

( (devectorize ($h | $t)
               ($th | $tt)) (!)

   (devectorize $h $th)
   (devectorize $t $tt)
   )

( (devectorize $e $e ) )

( (is-arith op_add)   )
( (is-arith op_sub)   )
( (is-arith op_mult) )
( (is-arith op_div)   )
( (is-arith op_negate) )

( (is-constant (vectorize $exp)) (!)

   (is-constant $exp)
   )

( (is-constant ($f | $args)) (!)

   (is-arith $f)
   (each-is-constant $args)
   )

( (is-constant $e)
   (!)
   (is-atomic-constant $e)
   ;; (integral $e) (!)
   )

( (each-is-constant ($h | $t))

   (is-constant $h)
   (each-is-constant $t)
   )

( (each-is-constant () ) )


;; Vectorization helper

( (vectorize1 $tag $tf $texpr
              $res)

    ; not applicable to symbolics; see bug 060825-155900.
    (get-global SYMBOLIC-MODE false:)
    (id $res (vectorize_1:$tag $tf $texpr)) )

( (vectorize1 $tag $tf $texpr
              $res)

    ; symbolic translation
    (id $res (vectorize:$tag $tf $texpr)) )


( (power-vectorization $tag $func $args $res)

   (id $args ($base $exponent))
   (is-constant $exponent)
   (devectorize $exponent $exp)
   (texp $base $tbase)
   (new-temp 0 $var)
   (texp ($func $var $exp) $tbody)
   (vectorize1 $tag (lambda:$tag ($var) $tbody) $tbase 
               $res)
   )

;;****************************************************************************
;;* VECPARAMS args => params actual vargs
;;*

( (vecparams ($e | $es)
         $params ($e | $aargs) $vargs )

   (do-not-vectorize $e)
   (vecparams $es $params $aargs $vargs)
   )

( (vecparams ($e | $es)
         ($param | $params) ($param | $aargs) ($e | $vargs) )

   (new-temp 0 $param)
   (vecparams $es $params $aargs $vargs)
   )

( (vecparams () () () () ) )

;;****************************************************************************
;;* TEXP-EACH env exprs texprs
;;*
;;* Translate each of the given expressions in turn.

( (texp-each ($x | $r)
                  ($x1 | $r1))

   (texp $x $x1) (!)
   (texp-each $r $r1) (!)
   )

( (texp-each () ()) )

;;****************************************************************************
;;* DO-NOT-VECTORIZE name
;;*
;;* Succeed if 'name' names a function that must not be vectorized.

( (do-not-vectorize (lambda | $t)) )
( (do-not-vectorize (unboxed | $t)) )
( (do-not-vectorize (integralcb | $t)) )

;;****************************************************************************
;;* USE-SIMPLE-VECTORIZATION name
;;*
;;* Succeed if 'name' names a function that receives only simple vectorized.

( (use-simple-vectorization mc_sin:) )
( (use-simple-vectorization mc_cos:) )
( (use-simple-vectorization mc_tan:) )
( (use-simple-vectorization op_deriv_1:) )
( (use-simple-vectorization op_deriv_2:) )
( (use-simple-vectorization op_deriv_3:) )
( (use-simple-vectorization op_deriv_4:) )
( (use-simple-vectorization op_deriv_5:) )
( (use-simple-vectorization op_deriv_n:) )

;;****************************************************************************
;;* IGNORE-VECTORIZATION name
;;*
;;* Succeed if 'name' names a function that should never be vectorized.

( (ignore-vectorization integralcb:) )
( (ignore-vectorization op_cross:) )
( (ignore-vectorization op_matrix:) )
( (ignore-vectorization op_congugate:) )
( (ignore-vectorization op_transpose:) )
( (ignore-vectorization no-loop:) )
( (ignore-vectorization op_rangesum:) )
( (ignore-vectorization op_rangeproduct:) )
( (ignore-vectorization op_sigmasum:) )
( (ignore-vectorization mc_augment:) )
( (ignore-vectorization mc_bspline:) )
( (ignore-vectorization mc_Bulstoer:) )
( (ignore-vectorization mc_bulstoer:) )
( (ignore-vectorization mc_bvalfit:) )

( (ignore-vectorization mc_CFFT:) )
( (ignore-vectorization mc_cfft:) )
( (ignore-vectorization mc_cholesky:) )
( (ignore-vectorization mc_cond1:) )
( (ignore-vectorization mc_cond2:) )
( (ignore-vectorization mc_conde:) )
( (ignore-vectorization mc_condi:) )
( (ignore-vectorization mc_corr:) )
( (ignore-vectorization mc_csort:) )
( (ignore-vectorization mc_cspline:) )
( (ignore-vectorization mc_cvar:) )

( (ignore-vectorization mc_diag:) )
( (ignore-vectorization mc_eigenvals:) )
( (ignore-vectorization mc_eigenvecs:) )
( (ignore-vectorization mc_eigenvec:) )

( (ignore-vectorization mc_FFT:) )
( (ignore-vectorization mc_fft:) )

( (ignore-vectorization mc_expfit:) )
( (ignore-vectorization mc_genfit:) )
( (ignore-vectorization mc_gcd:) )
( (ignore-vectorization mc_geninv:) )
( (ignore-vectorization mc_genvals:) )
( (ignore-vectorization mc_genvecs:) )
( (ignore-vectorization mc_gmean:) )

( (ignore-vectorization mc_hist:) )
( (ignore-vectorization mc_histogram:) )
( (ignore-vectorization mc_hmean:) )

( (ignore-vectorization mc_ICFFT:) )
( (ignore-vectorization mc_icfft:) )
( (ignore-vectorization mc_IFFT:) )
( (ignore-vectorization mc_ifft:) )

( (ignore-vectorization mc_intercept:) )
( (ignore-vectorization mc_interp:) ) ;;* TO DO ** should be restricted
( (ignore-vectorization mc_iwave:) )

( (ignore-vectorization mc_ksmooth:) )
( (ignore-vectorization mc_kurt:) )

( (ignore-vectorization mc_last:) )
( (ignore-vectorization mc_lcm:) )
( (ignore-vectorization mc_length:) )
( (ignore-vectorization mc_lgsfit:))
( (ignore-vectorization mc_line:) )
( (ignore-vectorization mc_linfit:) )
( (ignore-vectorization mc_linterp:) ) ;;* TO DO ** restrict
( (ignore-vectorization mc_linfit:) )

( (ignore-vectorization mc_lnfit:) )
( (ignore-vectorization mc_loess:) )
( (ignore-vectorization mc_logfit:) )
( (ignore-vectorization mc_lookup:) ) ;;* TO DO ** wasn't listed
( (ignore-vectorization mc_lsolve:) )
( (ignore-vectorization mc_lspline:) )
( (ignore-vectorization mc_lu:) )
( (ignore-vectorization mc_max:) )
( (ignore-vectorization mc_min:) )
( (ignore-vectorization mc_mean:) )
( (ignore-vectorization mc_medfit:) )
( (ignore-vectorization mc_median:) )

( (ignore-vectorization mc_median:) ) ;;* TO DO ** Restrict
( (ignore-vectorization mc_mode:) )
( (ignore-vectorization mc_multigrid:) )

( (ignore-vectorization mc_norm1:) )
( (ignore-vectorization mc_norm2:) )
( (ignore-vectorization mc_norme:) )
( (ignore-vectorization mc_normi:) )

( (ignore-vectorization mc_polyroots:) )
( (ignore-vectorization mc_predict:) )
( (ignore-vectorization mc_pspline:) )
( (ignore-vectorization mc_norm:) )

( (ignore-vectorization mc_qr:) )
( (ignore-vectorization mc_Radau:) )
( (ignore-vectorization mc_radau:) )
( (ignore-vectorization mc_rank:) )

( (ignore-vectorization mc_recenter:) )
( (ignore-vectorization mc_regress:) )
( (ignore-vectorization mc_relax:) )
( (ignore-vectorization mc_reverse:) )

( (ignore-vectorization mc_Rkadapt:) )
( (ignore-vectorization mc_rkadapt:) )
( (ignore-vectorization mc_rkfixed:) )
( (ignore-vectorization mc_rref:) )
( (ignore-vectorization mc_rsort:) )
( (ignore-vectorization mc_sbval:) )

( (ignore-vectorization mc_sinfit:) )
( (ignore-vectorization mc_skew:) )
( (ignore-vectorization mc_slope:) )
( (ignore-vectorization mc_sort:) )

( (ignore-vectorization mc_stack:) )
( (ignore-vectorization mc_stderr:) )
( (ignore-vectorization mc_Stdev:) )
( (ignore-vectorization mc_stdev:) )

( (ignore-vectorization mc_Stiffb:) )
( (ignore-vectorization mc_stiffb:) )
( (ignore-vectorization mc_Stiffr:) )
( (ignore-vectorization mc_stiffr:) )
( (ignore-vectorization mc_submatrix:) )
( (ignore-vectorization mc_supsmooth:) )
( (ignore-vectorization mc_svd:) )
( (ignore-vectorization mc_svds:) )

( (ignore-vectorization mc_tr:) )
( (ignore-vectorization mc_Var:) )
( (ignore-vectorization mc_var:) )

( (ignore-vectorization mc_wave:) )

( (ignore-vectorization-special relation:) )
( (ignore-vectorization-special mc_Jacob:) )
( (ignore-vectorization-special nabla:) )
( (ignore-vectorization-special mc_∇:) ) ; also nabla

;;****************************************************************************
;;* IS-AMBIGUOUS name
;;*
;;* Succeed if the binding for 'name' would be ambiguous if left unqualified.

( (is-ambiguous mc_pF:) )
( (is-ambiguous mc_min:) )
( (is-ambiguous mc_sec:) )

;;****************************************************************************
;;* IS-BUILTIN name
;;*
;;* Succeed if the binding for 'name' is a name of a built-in variable.

( (is-builtin mc_FRAME:) )
( (is-builtin mc_TOL:) )
( (is-builtin mc_CTOL:) )
( (is-builtin mc_ORIGIN:) )
( (is-builtin mc_PRNPRECISION:) )
( (is-builtin mc_PRNCOLWIDTH:) )
( (is-builtin mc_CWD:) )
( (is-builtin mc_in0:) )
( (is-builtin mc_in1:) )
( (is-builtin mc_in2:) )
( (is-builtin mc_in3:) )
( (is-builtin mc_in4:) )
( (is-builtin mc_in5:) )
( (is-builtin mc_in6:) )
( (is-builtin mc_in7:) )
( (is-builtin mc_in8:) )
( (is-builtin mc_in9:) )

;;****************************************************************************
;;* IS-ROOT name
;;*
;;* Succeed if the binding for 'name' is 'mc_root' or 'sym_mc_root'.

( (is-root mc_root:) )
( (is-root sym_mc_root:) )

; Built-in, in order to handle hexing. Sigh.
;( (is-element-of op_element_of:) )
;( (is-element-of sym_op_element_of:) )
;( (is-element-of _hex_6D635FE28888:) )
;( (is-element-of sym__hex_6D635FE28888:) )

( (is-polyroots mc_polyroots:) )
( (is-polyroots sym_mc_polyroots:) )

;; ( (is-power op_power) )
;; ( (is-power op_nthroot) )

;; Should be named is-non-function-macro
;; ( (is-macro and) )
;; ( (is-macro or)  )

;;****************************************************************************
;;* IS-ARRAY
;;*
;;* One-argument variant of the built-in IS-ARRAY

( (is-array $x)

    (get-global EXT_ENV $env)
    (is-array $env $x) )


;;****************************************************************************
;;* MAP-FINAL list result
;;*

( (map-final () ()) )

( (map-final ($r | $rs)
         ((numeric (range_final $r)) | $finals))

   (map-final $rs $finals)
   )

;;****************************************************************************

;;****************************************************************************
;;* IS-RANGE env name
;;*
;;* One-argument variant of the built-in IS-RANGE.
;;* Succeeds if 'name' is bound to a range in the document environment.

( (is-range $name)

    (is-bound $name)                                      ; Be wary of x:=x
    (get-global EXT_ENV $env)
    (is-range $env $name) )

;;****************************************************************************
;;* IS-BOUND name
;;*
;;* Succeed if 'name' is bound to anything at all in the document environment.

( (is-bound $name)

   ;; Because of Mathcad's "x:=x" construct, it's possible that
   ;; a name can be bound numerically, but not symbolically.
   (sym-mangle $name $sname)
   (lookup-type $sname $_)                                ; Has type signature?
   )

;;****************************************************************************
;;* NOT-BOUND env name
;;*
;;* Succeed if 'name' is not bound in the document environment.

( (not-bound $name)

   (is-bound $name) (!)                                  ; Has type signature?
   (fail 0)                                              ; Then must be bound
   )

( (not-bound $name) )

;;****************************************************************************
;;* LOOKUP-SIG-T name signature
;;*
;;* Succeed if 'name' is bound to an object with the given MPL type signature
;;* in the static (import) environment.

( (lookup-sig-t (qualified $qualifier $name) $signature)

   (lookup-sig $qualifier $name $signature) (!)          ; Call the primitive
   )

( (lookup-sig-t $name $signature)

   (lookup-sig "": $name $signature) (!)                 ; Call the primitive
   )

( (lookup-sig $q $n $signature)

    (get-global EXT_IMPORTS $imports)
    (strcat $q   "~~" $tmp)
    (strcat $tmp $n  $nm)
    (lookup-sig-builtin $imports $nm $signature) )

;;****************************************************************************
;;* HAS-TYPE env name type
;;*
;;* Succeed if the given name has the given type by first checking the document
;;* environment and then the searching static environment.

( (has-type $name $type) (lookup-sig "": $name $type) )

( (has-type $name $type) 
    
    (lookup-type $name $type) )

;;****************************************************************************
;;* GET-AFFINE-INVERSE function inverse
;;*
;;* Succeed if 'function' and 'inverse' appear to name a pair of 'affine unit'
;;* functions; that is, a function and its inverse bound in either environment
;;* whose names differ by just an initial '/' character.

( (get-affine-inverse $function:$tag $inverse:$tag)

   (strcat "mc__2F_": $t $function)                      ; strip initial 'mc_/'
   (strcat "mc_":     $t $inverse)                       ; prefix with 'mc_'
   )

( (get-affine-inverse $function:$tag $inverse:$tag)

   (strcat "mc_":     $t $function)                      ; strip initial 'mc_'
   (strcat "mc__2F_": $t $inverse)                       ; prefix with 'mc_/'
   )


;;****************************************************************************
;;* IS-SYMBOLIC
;;*
;;* Tests whether an expression is symbolic, binding its second
;;* argument to symbolic: or numeric: as appropriate.

( (is-symbolic (symbolic $keywords $x) symbolic:) )
( (is-symbolic (explicit $x)           symbolic:) )
( (is-symbolic ($f | $r) symbolic:)
    (is-symbolic $f symbolic:) (!) )
( (is-symbolic ($f | $r) symbolic:)
    (some-symbolic $r symbolic:) (!) )

( (is-symbolic $x                      numeric:) )
 
( (some-symbolic ($x | $r) symbolic:)
    (is-symbolic   $x symbolic:) (!) )
( (some-symbolic ($x | $r) symbolic:)
    (some-symbolic $r symbolic:) (!) )


;;****************************************************************************
;;* SPLIT-KEYWORDS
;;*
;;* Helper for symbolic translation.
;;* Splits a list of the form 
;;*      (keyword arg arg ... keyword arg arg...)
;;* into
;;*      ((keyword arg arg ...) (keyword arg arg ...) ...)
;;*

( (split-keywords ($k:$t | $r) (($k:$t | $s) | $tr))

    (is-keyword $k)
    (split-keyargs $r ($s | $tr)) )

( (split-keywords () ()) )

( (split-keyargs ($k:$t | $r) ( () | $tr ))

    (is-keyword $k)
    (split-keywords ($k:$t | $r) $tr) )

( (split-keyargs ($a | $r) (($a | $s) | $tr))

    (split-keyargs $r ($s | $tr)) )

( (split-keyargs () (()) ) )


;;****************************************************************************
;;* MAKE-KEYCALL
;;*
;;* Helper for symbolic translation.
;;* Takes the output of SPLIT-KEYWORDS and
;;* produces an expression consisting of nested
;;* function calls. 

; The 'explicit' keyword needs special handling.  It must
; wrap all other keywords occurring in the same expression.
( (make-keycall $expr ((mc_explicit:$t | $args) | $krest)
                (numeric
                  (let ((mask_ (make_mask (list | $masked))))
                    (explicit:$t $res))))

    (make-masked $args $masked)
    (make-keycall $expr $krest $res) ) 

( (make-keycall $expr (($k:$t | $args) | $krest)
                $res)

    (key-wraps-all  $k)
    (make-keycall   $expr $krest 
                    $wrapped)
    (make-keycall-1 ($k:$t $wrapped | $args) 
                    $res) )

( (make-keycall $expr (($k:$t | $args) | $krest)
                $res)

    (make-keycall-1 ($k:$t $expr | $args) 
                    $kcall)
    (make-keycall   $kcall $krest
                    $res) )

( (make-keycall $expr () $expr) )

; Helper for MAKE-KEYCALL.  Properly packages the arguments
; to the make_mask efi.

( (make-masked ($x | $r) ((unboxed (string $x)) | $mr))

    (identifier $x)
    (make-masked $r $mr) )

( (make-masked ($x | $r) ($err))

    (find-tag $x $t)
    (id $err
        (error2:$t (string "must be identifier") (unboxed 0) (unboxed 0))) )

( (make-masked () ()) )

; Helper for MAKE-KEYCALL.  Turns mc_... in first position into
; keyword_...
; Also has special cases for certain keywords.

; Solve keyword needs special handling to fix bug 061003-140511.
( (make-keycall-1 (mc_solve:$t      $expr | $args)
                  (keyword_solve:$t $lam  | $hargs))

    (gather-solve-vars $expr $args
                       $vars)
    (id $vars ($v | $r)) ;; make sure there are some
    (make-sym-unbound $vars $svars)
    (id $lam ((numeric SLam) (numeric (list | $svars)) $expr))
    (hold-solve-vars $args $hargs) )

( (make-keycall-1 (mc_solve:$t      $expr | $args)
                  (numeric (error2:$t (string "need vars to solve for")
                                      (unboxed $t) (unboxed 0)))) )

( (make-keycall-1 ($k:$t  | $args)
                  ($kk:$t | $args) )

    (strcat mc_:      $kstem $k) ; $k is bound; we want $kstem
    (strglue keyword_ $kstem $kk) )
    

; Helpers for MAKE-KEYCALL-1

( (is-solve-var $x)

    (strprefix $x mc_:) )

;; Helper for handling the 'solve' keyword.
;; Traverses an expression, gathering unbound
;; variables.  (The idea is to auto-detect the
;; variable being solved for when the user
;; hasn't specified it.)
( (gather-all-vars ($x | $r) $accum 
                   $res)

    (gather-all-vars $x $accum $res1)
    (gather-all-vars $r $res1  $res) )

( (gather-all-vars $x $accum
                   $acc1)

    (is-solve-var $x)
    (unique-prepend $x $accum $acc1) )

( (gather-all-vars $x $accum
                   $accum) )


;; Helper for handling the 'solve' keyword.
;; This predicate traverses the arguments to
;; that keyword, accumulating the variables being
;; solved for.
( (gather-var-list ($x | $r) $accum
                   $acc2)

    (is-solve-var $x)
    (gather-var-list $r $accum $acc1)
    (unique-prepend $x $acc1 $acc2) )

( (gather-var-list ($m | $r) $accum
                   $acc1)

    (id $m (op_matrix $rows $cols (list | $vars)))
    (strip-to-num $rows $nr)
    (transpose $nr $vars $vars-t)
    (gather-var-list $vars-t $accum $acc1) )

( (gather-var-list ($x | $r) $accum
                   $acc2)

    ;; The arguments to 'solve' are not necessarily
    ;; variables (or matrices of variables).  They
    ;; can be general expressions (see bug 060602-153622).
    ;; If we encounter such an expression, we add a
    ;; dummy parameter to the lambda we're passing
    ;; to the solve keyword.
    (new-temp 0 $t)
    (gather-var-list $r $accum $acc1)
    (id $acc2 ($t | $acc1)) )

( (gather-var-list () $accum
                   $accum) )


( (gather-solve-vars $expr ()
                     $vars)

    ;; If there are no arguments to the 'solve' keyword, we
    ;; scan the expression looking for unbound variables.
    (gather-all-vars $expr () $allvars) (!)
    (filter-solve-vars $allvars $vars) (!)
    ;; It's an error if there isn't exactly one variable.
    (id $vars ($x))
)

( (gather-solve-vars $expr $args
                     $vars)

    (gather-var-list $args () $vars) (!) )

;; Helper for gather-solve-vars.  Filters out, if necessary,
;; variables which have document or built-in bindings,
;; in an attempt to reduce the list to a single variable.
;; Relevant bugs: 061103-171319, 061003-140511.

( (filter-solve-vars () ()) )
;; If there's only one variable, don't filter anything; see
;; comments in bug 061103-171319.
( (filter-solve-vars ($x) ($x)) )

( (filter-solve-vars $lst $res)

    (filter-solve-bound $lst $res) )

( (filter-solve-bound () ()) )

( (filter-solve-bound ($x | $r) $res)

    (fsb-help ($x | $r) $res) )

( (fsb-help ($x | $r) $r1)

    (solve-bound $x)
    (fsb-help $r $r1) )

( (fsb-help ($x | $r) ($x | $r1))

    (fsb-help $r $r1) )

( (fsb-help () ()) )

( (solve-bound $x)

    (is-bound $x) )

( (solve-bound $x)

    (lookup-sig-t $x $sig) )

;; Helper for handling the 'solve' keyword.  Holds
;; any solve variables found in an expression.
( (hold-solve-vars ($x  | $r)
                   ($hx | $hr))

    (hold-solve-vars $x $hx)
    (hold-solve-vars $r $hr) )

( (hold-solve-vars $x ((numeric hold) $x))

    (is-solve-var $x) )

( (hold-solve-vars $x $x) )


;;****************************************************************************
;;* WRAP-MASK
;;*
;;* Helper for explicit (in the sense of explicit calculation)
;;* definitions.

; If the RHS is a (reset ...) form, we must make sure it becomes
; (reset (lambda (-mask_) ...)) rather than
; (lambda (-mask_) (reset ...)).  The latter causes an internal
; error in the MPL compiler: "An unexpected error has occurred. 
; Please contact support@mathsoft.com."
( (wrap-mask $lhs (reset $rhs) 
             (reset $res))

   (wrap-mask $lhs $rhs $res) )


( (wrap-mask (tuple | $ids) $rhs $res)

   (new-temp 0 $f)
   (make-tuple-extraction-lambdas $ids $ids $f
                                  $masked)
   (id $res (let (($f (lambda (-mask_) $rhs)))
             (tuple | $masked))) )

( (make-tuple-extraction-lambdas ($id | $r) $ids $func
                                 ($lam | $rest))

    (id $lam (lambda (-mask_)
               (let (((tuple | $ids) ($func -mask_)))
                 $id)))
    (make-tuple-extraction-lambdas $r $ids $func
                                   $rest) )

( (make-tuple-extraction-lambdas () $ids $func
                                 ()) )


( (wrap-mask $lhs $rhs (lambda (-mask_) $rhs)) )
             

;;****************************************************************************
;;* STRIP-SYM 
;;*
;;* Strip the 'sym_' prefix.

( (strip-sym $x $y)

    (strcat "sym_": $y $x) )

( (strip-sym $x $x) )

;;****************************************************************************
;;* WRAP-SYMEVAL
;;*
;;* Wrap with a symeval call unless 'explicit' is the
;;* only keyword present.  If 'explicit' is present with
;;* other keywords, also wrap with a call to 'keyword_explicit'.

( (wrap-symeval $keywords $x $t
                $res)

    (analyze-keywords $keywords false: false: $has-explicit $has-other) (!)
    (wrap-symeval-1 $has-explicit $has-other $x $t $res) )


;; helper for WRAP-SYMEVAL

; explicit and non-explicit keywords
( (wrap-symeval-1 true:  true:  $x $t
                  ((numeric psymeval:$t) (symbolic () (keyword_explicit $x)))))

; explict and no non-explict keywords
( (wrap-symeval-1 true:  false: $x $t
                  $x) )

; no explicit keyword
( (wrap-symeval-1 false: $_     $x $t
                  ((numeric psymeval:$t) $x)) )


; helper for WRAP-SYMEVAL
( (analyze-keywords $keywords true: true:
                              true: true:) )

( (analyze-keywords (mc_explicit:$_ | $r) $has-explicit     $has-other
                                          $has-explicit-new $has-other-new)

    (analyze-keywords $r true:             $has-other
                         $has-explicit-new $has-other-new) )

( (analyze-keywords ($k:$_ | $r)          $has-explicit     $has-other
                                          $has-explicit-new $has-other-new)

    (is-keyword $k)
    (analyze-keywords $r $has-explicit     true:
                         $has-explicit-new $has-other-new) )
    
( (analyze-keywords ($_ | $r)             $has-explicit     $has-other
                                          $has-explicit-new $has-other-new)

    (analyze-keywords $r $has-explicit     $has-other
                         $has-explicit-new $has-other-new) )

( (analyze-keywords ()                    $has-explicit $has-other
                                          $has-explicit $has-other) )
