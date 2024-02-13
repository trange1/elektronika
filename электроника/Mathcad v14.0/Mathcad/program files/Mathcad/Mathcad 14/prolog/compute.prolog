;********** Copyright © Parametric Technology Corporation. All rights reserved
;**
;**
;**  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/eng/mcfront12/prolog/compute.prolog   224   2007-04-02 18:09:39-04:00   ltravis $
;**
;**
;**  Purpose : Prolog ruleset for transforming editing trees into expressions
;**				for calculuation.
;**
;**  Comments: This file uses a tab size of 3 spaces.
;**
;**
;*****************************************************************************

; top level solves need an (eval ...) and no callback
( (texp (-EROOT $null (-SOLVE:$tag $comp $node $expr $_))
			(eval:$tag $texpr))
	(texp (-SOLVE:$tag $expr) $texpr) )

( (texp (-EROOT $null $tree)
			$ttree)
	(texp $tree $ttree) )

;;*****************************************************************************
;;* definitions

; global definition
( (texp (-GLOBEQ:$tag $lhs $rhs)
			(global:$tag $tlhs $trhs))
	(tdef $lhs $rhs $tlhs $trhs) )

; global optimized definition
( (texp (-GLOBEQ:$tag OPTIMIZED $comp $tree $lhs $rhs)
				(global-symbolic:$tag true $comp $tree $tlhs $trhs))
	 (tdef $lhs $rhs $tlhs $trhs) )

; global :=...-> definition
( (texp (-GLOBEQ:$tag SYMBOLIC $comp $tree $lhs $rhs)
				(global-symbolic:$tag false $comp $tree $tlhs $trhs))
	 (tdef $lhs $rhs $tlhs $trhs) )

; global :=...= definition
( (texp (-GLOBEQ:$tag NUMERIC $comp $tree $lhs $rhs)
			(global-numeric:$tag $comp $tree $tlhs $trhs))
	(id $rhs (-COMPUTE:$ctag $expr $units))
	(texp (-GLOBEQ:$tag $lhs $expr) (global:$tag $tlhs $texpr)) (!)
	(tcompute ($ctag $texpr $units) $trhs) )

; invalid global :=...= definition
( (texp (-GLOBEQ:$tag NUMERIC $comp $tree $lhs $rhs)
			aborted)
	(abort invalid_numeric_definition $tag) )

; WRITE-like function definition
( (texp (-DEFINE:$tag $lhs $rhs)
			$res)
	(write-special $tag $lhs $rhs $res) )

; optimized write-like evaluation (fix for bug 050203-144546)
( (texp (-DEFINE:$tag OPTIMIZED $comp $tree $lhs $rhs)
			$res)
	(write-special $tag $lhs $rhs $res) )

; definition
( (texp (-DEFINE:$tag $lhs $rhs)
			(define:$tag $tlhs $trhs))
	(tdef $lhs $rhs $tlhs $trhs) )

; optimized definition
( (texp (-DEFINE:$tag OPTIMIZED $comp $tree $lhs $rhs)
			(define-symbolic:$tag true $comp $tree $tlhs $trhs))
	(tdef $lhs $rhs $tlhs $trhs) )

; :=...-> definition
( (texp (-DEFINE:$tag SYMBOLIC $comp $tree $lhs $rhs)
			(define-symbolic:$tag false $comp $tree $tlhs $trhs))
	(tdef $lhs $rhs $tlhs $trhs) )

; :=...= definition
( (texp (-DEFINE:$tag NUMERIC $comp $tree $lhs $rhs)
			(define-numeric:$tag $comp $tree $tlhs $trhs))
	(id $rhs (-COMPUTE:$ctag $expr $units))
	(texp (-DEFINE:$tag $lhs $expr) (define:$tag $tlhs $texpr)) (!)
	(tcompute ($ctag $texpr $units) $trhs) )

; invalid :=...= definition
( (texp (-DEFINE:$tag NUMERIC $comp $tree $lhs $rhs)
			aborted)
	(abort invalid_numeric_definition $tag) )

; pseudofunction definition
( (tdef (-PAIR $f (-PARENS $null $params)) $rhs
			$tf $lambda)
	(is-pseudo $f $tf) (!)
	(tlam $params $rhs $lambda) )

; function definition
( (tdef (-PAIR $f (-PARENS $null $params)) $rhs
			$tf $lambda)
	(texp $f $tf)
	(tlam $params $rhs $lambda) )

; HACK - to support buggy MC11 trees allowing (-PAIR $f (-MATRIX ...))
( (tdef (-PAIR $f $mat) $rhs
			$tf $lambda)
	(id $mat (-MATRIX | $_))
	(tdef (-PAIR $f (-PARENS NULLPTR $mat)) $rhs $tf $lambda) )

; lambda definition
( (tlam $params $body
			(lambda $tparams $tbody))
	(tseq $params        $tparams)
        (valid-lambda-params $tparams)
	(texp $body $tbody) )

( (valid-lambda-params ((number $n:$tag) | $r))

    (abort bad_identifier $tag) )

( (valid-lambda-params (($x | $r) | $s))

    (find-tag $x $t)
    (abort bad_identifier $t) )

( (valid-lambda-params ($x | $r))

    (valid-lambda-params $r) )

( (valid-lambda-params ()) )

; function parameters
( (tseq $p $res)
	(id $p (-SEQUENCE | $r))
	(texp $p (list | $res)) )

( (tseq $x ($tx))
	(texp $x $tx) )

; comma-delimited array on rhs (see bug 040422-140506)
( (tdef (-SUBSCRIPT:$tag | $l) (-SEQUENCE | $s)
			$tlhs (comma-array $trhs))
	(texp (-SUBSCRIPT:$tag | $l) $tlhs)
	(texp (-SEQUENCE | $s) (list | $trhs)) )

; non-function definition
( (tdef $lhs $rhs
			$tlhs $trhs)
	(texp $lhs $tlhs)
	(texp $rhs $trhs) )


;;*****************************************************************************
;;* numeric evaluations

; top-level numeric evaluations don't need callback
( (texp (-COMPUTE:$tag $expr $units)
			$res)

   (set-global INSERT-SYMBOLIC-CALLBACKS true:)
	(texp $expr $texpr)
	(tcompute ($tag $texpr $units) $res) )

( (tcompute ($tag $texpr $units)
			$res)
	(tunits $units $tunits)
	(id $res (eval:$tag (numeric:$tag $texpr) | $tunits)) )

; no change of units
( (tunits -NULLO ()) )

; change of units
( (tunits $units
			($tunits))
	(texp $units $tunits) )


;;*****************************************************************************
;;* symbolic evaluations

;; Note: The function of the INSERT-SYMBOLIC-CALLBACKS global is to
;; ensure that no callback is emitted for the outermost -SOLVE
;; in a nested expression of the form ... (-SOLVE ... (-SOLVE ...) ....
;; Its introduction is part of a fix for bug 070319-103411 which maintains
;; the fix for bug 061115-111411.

; top-level symbolic evaluations don't need callback
( (texp (-SOLVE:$tag $expr)
			$res)

   (set-global INSERT-SYMBOLIC-CALLBACKS true:)
	(tsymbolic $expr $tmods $texpr) 
	(id $res (symeval:$tag (symbolic:$tag $tmods $texpr))) )

; chained or embedded symbolic evaluations need to
; call-back to return the intermediate results
( (texp (-SOLVE:$tag $comp $node $expr $null)
			;; Note: the front end is sensitive to
			;; how we wrap this 'let'.
			(numeric:$tag
				(let ((dummy $res))
					(seq (symboliccb:$tag $comp $node dummy) dummy))))

   (get-global INSERT-SYMBOLIC-CALLBACKS true:)
	(texp (-SOLVE:$tag $expr) $res) )

( (texp (-SOLVE:$tag $comp $node $expr $null)
        $res)

    (texp (-SOLVE:$tag $expr) $res) )

; special rule to allow placeholder as the only
; modifier in a symbolic evaluation expr _ ->
( (tsymbolic (-LIST $expr -NULLO)
			() $texpr)
	(texp $expr $texpr) )

( (tsymbolic (-LIST $expr $mods)
			$tmods $texpr)
	(texp $expr $texpr)
	(tkeywords $mods $tmods) )

( (tsymbolic $expr
			() $texpr)
	(texp $expr $texpr) )

( (tkeywords ($n $kk $k)
			$res)
	 (keysep $n)
	 (tkeywords $k  $tk)
	 (tkeywords $kk $tkk)
	 (concat $tkk $tk $res) )

( (tkeywords $x $y)
	 (tkey $x $y) )

( (tkey (-EQUALS:$t1 mc_assume:$t2 $expr)
			$res)
    (texp (-EQUALS mc_ALL:$t2 $expr) $tk)
	(id $res (mc_assume:$t2 $tk)) )

( (tkey $k ($tk))
	(texp $k $tk) )

( (keysep -LIST) )
( (keysep -SEQUENCE) )

; Components

( (tcomp-map $progid
			$func)
	(assoc &strprefix-%-2 $progid
		(
			(Mathcad.Matlab.Component			  mc_eval_component_dimless_)
			(Mathcad.ScriptedObject.Component	mc_eval_component_dimless_)
			(Mathcad.Buddy.Component		 mc_eval_component_dimless_)
			(Mathcad.User.Component			mc_eval_component_dimless_)
			(Mathcad.Picture.Component			 mc_eval_component_dimless_)
			(Mathcad.SPlus.Component				mc_eval_component_dimless_)
			(Mathcad.SPlusGraph.Component		 mc_eval_component_dimless_)
			(Mathcad.Axum2D.Component			mc_eval_component_dimless_)
			(Mathcad.Axum3D.Component			mc_eval_component_dimless_)
			(Mathcad.InputTable.Component		 mc_eval_component_dimless_)
			(Mathcad.OutputTable.Component		mc_eval_component_dimless_)
			(Mathcad.FileRead.Component			mc_eval_component_dimless_)
			(Mathcad.FileWrite.Component		  mc_eval_component_dimless_)
			(Mathcad.DataImport.Component		mc_eval_component_dimless_)
			(Mathcad.Excel.Component				mc_eval_component_dimless_)
			(Mathcad.ODBCRead.Component			mc_eval_component_dimless_)
			(Mathcad.Web.Control					 mc_eval_component_dimless_)
			(Mathcad.SmartSketch.Component		mc_eval_component_)
			(Mathcad.3DPlot.Component			  mc_eval_3dplot_)
		) $func) )

( (tcomp-map $progid mc_eval_component_) )

; Stuff the inputs in a vector so that they can be of different types.
; Also decides which mc_eval_XXX_ function to call for the given ProgID
; The result is (mc_eval_XXX_ handle [inputs])
( (tcomponent (($handle $progid:$tag) $inputs $n)
			(coerce (numeric ($func:$tag $handle $tinputs))))
	(tcomp-map $progid $func) (!)
	(tinputs $inputs $n $tinputs) )

; make sure the inputs are a list even if
; there was just one input or even a NULLPTR
; also treat parenthesized sequences as vectors
( (tinputs NULLPTR $_ (list)) )
( (tinputs $inputs 1
			(list | $tinputs))
	(tseq $inputs $tinputs_)
	(map &tinval-%-2 $tinputs_ $tinputs) )

; if more than 1 input, then the inputs are in a matrix
; so we "unpack" the matrix into a list
( (tinputs (-MATRIX $r $c $inputs) $n
			(list | $tinputs))
	(texp $inputs (list | $tinputs_))
	(map &tinval-%-2 $tinputs_ $tinputs) )

( (tinval (list | $inputs)
			$res)
	(length $inputs $length)
	(tinval (init_vector (unboxed $length) (list | $inputs)) $res) )

( (tinval $input (let ((dummy (numeric $input))) (tuple (as_object dummy) (typeof dummy)))) )

; component without outputs
( (texp (-VSCIENCE:$tag NULLPTR | $args)
			(eval:$tag (numeric $res)))
	(tcomponent $args $res) )

; function definition with a component as its body
( (texp (-VSCIENCE:$tag $lhs | $args)
			$res)
	(id $lhs (-PAIR | $_)) (!)
	(tcomponent $args $rhs)
	(texp (-DEFINE:$tag $lhs $rhs) $res) )

; component with outputs
( (texp (-VSCIENCE:$tag $outputs | $args)
			$res)
	(tcomponent $args $rhs)
	(texp (-DEFINE:$tag $outputs $rhs) $res) )

;*****************************************************************************
; 2D plots
(!include "plots.prolog")

;*****************************************************************************
;* Expressions

; string
( (texp (-STRING:$tag $s) (string $s:$tag)) )

; placeholders
( (texp -NULLO:$tag
			aborted)
	(abort bad_placeholder $tag) )

; errors
( (texp (-ERROR:$tag $msg)
			aborted)
	(abort $msg $tag) )

( (texp (-PAIR $t (-ERROR:$tag $msg))
			aborted)
	(abort $msg $tag) )

; sequence
( (texp (-SEQUENCE | $list)
			(list | $tlist))
	(gather -SEQUENCE () $list $s)
	(map &texp-%-2 $s $s1)
	(reverse $s1 $tlist) )

; LIST only seems to occur in a SOLVE
( (texp (-LIST | $list)
			$tlist)
	(gather -LIST () $list $s)
	(map &texp-%-2 $s $s1)
	(reverse $s1 $tlist) )

; INARRAY is just like sequence
( (texp (-INARRAY | $list)
			(list | $tlist))
	(gather -INARRAY () $list $s)
	(rtail $s $s1)					 ; Remove trailing NULLO before it can force an abort.
	(map &texp-%-2 $s1 $tlist) )

; MATRIX is just sugar
( (texp -MATRIX:$tag op_matrix:$tag) )

; function application
( (texp (-PAIR $f (-PARENS $null $params))
			$res)
	(tapply $f $params $res) )

; HACK - to support buggy MC11 trees (-PAIR $f (-MATRIX ...))
( (texp (-PAIR $f $mat)
			$res)
	(id $mat (-MATRIX | $_))
	(tapply $f $mat $res) )

; For debugging only...remove for release
;( (tapply mc_typeof:$t $e
;         (typeof | $te))
;  (tseq $e $te) )

( (to-fmt $e (let ((dummy $e)) (tuple (as_object dummy) (typeof dummy)))) )

( (tapply $f:$t $params
			(mc_format:$t | $oparams))
	(is-format $f)
	(tseq $params $tparams)
	(map &to-fmt-%-2 $tparams $oparams) )

( (tapply ($f:$t $component $tree) $params
			(mc_trace:$t $callback | $oparams))
	(is-trace $f)
	(id $callback (tracecb $component $tree))
	(tseq $params $tparams)
	(map &to-fmt-%-2 $tparams $oparams) )

( (tapply ($f:$t $component $tree) $params
			(mc_pause:$t $callback | $oparams))
	(is-pause $f)
	(id $callback (pausecb $component $tree))
	(tseq $params $tparams)
	(map &to-fmt-%-2 $tparams $oparams) )

( (tapply ($f:$t $algorithm) $params
			(mc_genfit:$t $algorithm | $tparams))
	(is-genfit $f)
	(tseq $params $tparams) )

; special solve-block functions
( (tapply ($f $component $tree | $options) $params
			($tf $callback | $ttparams))
	(is-solve $f) (!)
	(id $callback (solvecb $component $tree))
	(texp $f $tf)
	(tseq $params $tparams)
	(concat $options $tparams $ttparams) )

( (tapply $f $params
			($tf | $tparams))
	(is-pseudo $f $tf) (!)
	(tseq $params $tparams) )

( (tapply $f $params
			($tf | $tparams))
	(texp $f $tf)
	(tseq $params $tparams) )

; program
( (texp (-PROGRAM:$tag | $r)
			$res)
	(tprogram $tag $r $res) )

( (texp (-WHILE:$tag $body $test)
			(while:$tag $ttest $tbody))
	(texp $test $ttest)
	(texp $body $tbody) )

( (texp (-FOR:$tag $body (-LOCAL_ASSIGN $i $range))
			(for:$tag $ti $trange $tbody))
	(texp $i $ti)
	(tfor-range $range $trange)
	(texp $body $tbody) )

; if the for range is a sequence, wrap it with a (list)
( (tfor-range $range
			$trange)
	(id $range (-SEQUENCE | $_))
	(texp $range $trange) )

( (tfor-range $range
			$trange)
	(texp $range $trange) )

( (texp (-IFTHEN:$tag $expr $cond)
			(ifthen:$tag $tcond $texpr))
	(texp $expr $texpr)
	(texp $cond $tcond) )

( (texp (-ELSE:$tag $null $expr)
			(otherwise:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-ONERROR:$tag $catch $try)
			(try:$tag $ttry $tcatch))
	(texp $try $ttry)
	(texp $catch $tcatch) )

( (texp (-RETURN:$tag $null $expr)
			(return:$tag $texpr))
	(texp $expr $texpr) )

; fix a bug in the editor which puts the LOCAL_ASSIGN in the PAIR
( (texp (-PAIR $f (-LOCAL_ASSIGN:$tag $parens $expr))
			$res)
	(texp (-LOCAL_ASSIGN:$tag (-PAIR $f $parens) $expr) $res) )

( (texp (-LOCAL_ASSIGN:$tag $lhs $rhs)
			(setf:$tag $tlhs (let (($tlhs $trhs)) $tlhs)))
	(id $lhs (-PAIR $f $parens))
	(tdef $lhs $rhs $tlhs $trhs) )

( (texp -LOCAL_ASSIGN:$tag setf:$tag) )
( (texp -BREAK:$tag		  break:$tag) )
( (texp -CONTINUE:$tag	  continue:$tag) )

; boolean
( (texp (-NOT:$tag $null $expr)
			(op_not:$tag $texpr))
	(texp $expr $texpr) )

( (texp -EQUALS:$tag	 op_eq:$tag) )
( (texp -LTHAN:$tag	  op_lt:$tag) )
( (texp -GTHAN:$tag	  op_gt:$tag) )
( (texp -NOTEQUALS:$tag op_neq:$tag) )
( (texp -LTEQ:$tag		op_leq:$tag) )
( (texp -GTEQ:$tag		op_geq:$tag) )

( (texp -AND:$tag	 and:$tag) )
( (texp -OR:$tag	  or:$tag) )
( (texp -XOR:$tag	 op_xor:$tag) )

; calculator
( (texp (-PARENS $null $expr) ; this is a special case (needs info whether the right parenthesis exists)
			$texpr)
	(texp $expr $texpr) )

( (texp (-FACTORIAL:$tag $expr $null)
			(op_factorial:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-DET:$tag $null $expr)
			(op_det:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-ABSVAL:$tag $null $expr)
			(op_abs:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-SQRT:$tag $null $expr)
			(op_sqrt:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-UMINUS:$tag $null $expr)
			(op_negate:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-CONJUGATE:$tag $expr $null)
			(op_conjugate:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-MIXEDNUM:$tag $w (-BIND $n $d))
			$res)
	(texp (-MIXEDNUM:$tag $w $n $d) $res) )

( (texp (-NTHROOT:$tag $rad $expr)
			(op_nthroot:$tag $texpr $trad))
	(texp $rad $trad)
	(texp $expr $texpr) )

( (texp -DIVIDE:$tag	 op_div:$tag) )
( (texp -IDIVIDE:$tag	op_div:$tag) )
( (texp -PLUS:$tag		op_add:$tag) )
( (texp -EQNSPLIT:$tag  op_add:$tag) )
( (texp -MINUS:$tag	  op_sub:$tag) )
( (texp -TIMES:$tag	  op_mult:$tag) )
( (texp -POWER:$tag	  op_power:$tag) )
( (texp -MIXEDNUM:$tag  op_mixednum:$tag) )

; calculus
( (texp (-DERIVATIVE:$tag $x $f)
			(op_deriv_1:$tag $lambda $tx))
	(tlam $x $f $lambda)
	(texp $x $tx) )

( (texp (-NTH_DERIV:$tag (number $n:$t) (-BIND $x $f))
			($op:$tag $lambda $tx))
	(is-small-power $n) (!)
	(strglue op_deriv_ $n $op)
	(tlam $x $f $lambda)
	(texp $x $tx) )

( (texp (-NTH_DERIV:$tag $n (-BIND $x $f))
			(op_deriv_n:$tag $lambda $tn $tx))
	(tlam $x $f $lambda)
	(texp $n $tn)
	(texp $x $tx) )

;; Warn If Variable Capture
;;( (texp (-INDEFINTG:$tag $x $expr)
;;			(checkNoOccurrences (qualified MC_mc $x)
;;                          (op_indef_integral:$tag $lambda)))
;;	(tlam $x $expr $lambda) )

;; No one gives a Hoot	
( (texp (-INDEFINTG:$tag $x $expr)
		   (op_indef_integral:$tag $lambda $tx))
	(tlam $x $expr $lambda) 
        (texp $x $tx) )
	
( (texp (-INTEGRAL:$tag $component $tree $algorithm (-BIND $a $b) (-BIND $x $f))
			(mc_integral_:$tag $callback $lambda $ta $tb $algorithm))
	(tlam $x $f $lambda)
	(texp $a $ta)
	(texp $b $tb)
	(id $callback (integralcb $component $tree)) )

( (texp (-VBINDSUM:$tag (-BIND $a $b) (-BIND $i $expr))
			(op_rangesum:$tag $lambda (no-loop $trange)))
	(tlam $i $expr $lambda)
	(texp (op_range2_i:$tag $a $b) $trange) )

( (texp (-VBINDPROD:$tag (-BIND $a $b) (-BIND $i $expr))
			(op_rangeproduct:$tag $lambda (no-loop $trange)))
	(tlam $i $expr $lambda)
	(texp (op_range2_i:$tag $a $b) $trange) )

( (texp (-SUM:$tag $i $expr)
			(op_rangesum:$tag $lambda (no-loop $trange)))
	(tlam $i $expr $lambda)
	(texp $i $trange) )

( (texp (-PROD:$tag $i $expr)
			(op_rangeproduct:$tag $lambda (no-loop $trange)))
	(tlam $i $expr $lambda)
	(texp $i $trange) )

( (texp (-LIMIT:$tag $lim (-BIND $x $f))
			(op_limit:$tag $lambda $tlim))
	(tlam $x $f $lambda)
	(texp $lim $tlim) )

( (texp (-LIMITPLUS:$tag $lim (-BIND $x $f))
			(op_limitright:$tag $lambda $tlim))
	(tlam $x $f $lambda)
	(texp $lim $tlim) )

( (texp (-LIMITMIN:$tag $lim (-BIND $x $f))
			(op_limitleft:$tag $lambda $tlim))
	(tlam $x $f $lambda)
	(texp $lim $tlim) )

( (texp (-PREFIX (-SUBSCRIPT $nabla $vars) $expr)
			$res)
	(nabla-special $nabla $vars $expr $res) )

; matrix

; range
; - the range could be in the form f..l or f,s..l
; - throw an error if the left child is not a single node or a sequence with 2 elements only
; - throw an error if the righr child is a sequence
( (texp (-RANGE:$tag (-SEQUENCE (-SEQUENCE | $1) $2) $3)
			aborted)
	(abort bad_comma $tag) )

( (texp (-RANGE:$tag $1 (-SEQUENCE | $2))
			aborted)
	(abort bad_comma $tag) )

( (texp (-RANGE:$tag (-SEQUENCE $f $s) $l)
			(op_range3:$tag $tf $ts $tl))
	(texp $f $tf)
	(texp $s $ts)
	(texp $l $tl) )

( (texp (-RANGE:$tag $f $l)
			(op_range2:$tag $tf $tl))
	(texp $f $tf)
	(texp $l $tl) )

; subscript
; - the index could be nested in parentheses several times, so just remove them
( (texp (-SUBSCRIPT:$tag $base $i)
			(subscript:$tag $tbase | $ti))
	(texp $base $tbase)
	(tsub $i $ti) )

( (tsub (-PARENS $null $i) $ti)
	(tsub $i $ti) )

( (tsub $i $ti)
	(tseq $i $ti) )

; unary operators
( (texp (-SIGMASUM:$tag $null $expr)
			(op_sigmasum:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-TRANSPOSE:$tag $expr $null)
			(op_transpose:$tag $texpr))
	(texp $expr $texpr) )

( (texp (-VECTORIZE:$tag $expr $null)
			(vectorize:$tag $texpr))
	(texp $expr $texpr) )

( (texp -MATCOL:$tag	 op_matcol:$tag) )
( (texp -MATROW:$tag	 op_matrow:$tag) )
( (texp -CROSSPROD:$tag op_cross:$tag) )

; symbolic
( (texp (-INFIX $l (-BIND $op $r))
			$res)
	(tapply $op (-SEQUENCE $l $r) $res) )

( (texp (-TREE_INFIX $l (-BIND $op $r))
			$res)
	(tapply $op (-SEQUENCE $l $r) $res) )

( (texp (-PREFIX (-POWER $trig $power) $args)
			$res)
	(trig-special $trig $power $args $res) )

( (texp (-PREFIX (-SUBSCRIPT $log $base) $args)
			$res)
	(log-special $log $base $args $res) )

( (texp (-PREFIX $op $e)
			$res)
	(tapply $op $e $res) )

( (texp (-POSTFIX $e $op)
			$res)
	(tapply $op $e $res) )

; unreachable (handled in TreeToString
( (texp (-SERROR $err $tree:$tag) aborted)
	(abort $err $tag) )	  ; this should never get translated

;*****************************************************************************
;* Programs

( (tprogram $tag $p
			(progn:$tag | $tlines))
	(gather -PROGRAM () $p $lines)
	(process-lines $lines () $tlines) )

( (process-lines () $lines $lines) )
( (process-lines $lines $accum
			$tlines)
	(process-next $lines $tl $lines1)
	(process-lines $lines1 ($tl | $accum) $tlines) )

( (is-cond (-IFTHEN | $_)) )
( (is-cond (-ELSE | $_)) )

( (process-next ($if | $lines)
			(progn | $tifs) $lines1)
	(is-cond $if) (!)
	(process-ifthens ($if | $lines) () $tifs $lines1) )

( (process-next ($x | $lines)
			$tx $lines)
	(texp $x $tx) )

( (process-ifthens ($if | $lines) $accum
			$tifs $tlines)
	(is-cond $if) (!)
	(texp $if $tif)
	(process-ifthens $lines ($tif | $accum) $tifs $tlines) )

( (process-ifthens $lines $accum
			$accum $lines) )


;*****************************************************************************
;* Relation Chains

( (texp ($op $e1 $e2)
			((relation | $ops) | $args))
	(is-relop $op) (!)
	(rel ($op $e1 $e2) $ops $args)
	)

( (rel ($op $l $r)
			$ops $args)
	(is-relop $op) (!)
	(rel $l $lo $la)
	(rel $r $ro $ra)
	(texp $op $top)
	(append $lo $top $tlo)
	(concat $tlo $ro $ops)
	(concat $la $ra $args)
	)

( (rel $e () ($te))
	(texp $e $te) )

( (is-relop -GTEQ) )
( (is-relop -LTEQ) )
( (is-relop -GTHAN) )
( (is-relop -LTHAN) )
( (is-relop -EQUALS) )
( (is-relop -NOTEQUALS) )

;*****************************************************************************
;* Pseudofunctions

( (is-pseudo $f:$t 
			$tf:$t)
	(strip-font $f $ff)
	(is-pseudo_ $ff $tf) )

( (is-pseudo_ mc_if: if:) )
( (is-pseudo_ mc_until: until:) )

;*****************************************************************************
;* Trigonometric

; sin^-1(x) => asin(x)
( (trig-special $f:$t $power $args
			$res)
	(is-negative-one $power) (!)
	(strip-font $f $ff)
	(is-trig $ff $if) (!)
	(texp ($if:$t $args) $res) )

; sin^2(x) => sin(x)^2
( (trig-special $f:$t $power $args
			$res)
	(strip-font $f $ff)
	(is-trig $ff $_) (!)
	(texp (-POWER ($f:$t $args) $power) $res) )

( (is-negative-one (-UMINUS $null (number 1:$t))) )
( (is-negative-one (number -1:$t)) )

; cos -> acos
( (is-trig mc_sin: mc_asin:) )
( (is-trig mc_cos: mc_acos:) )
( (is-trig mc_tan: mc_atan:) )
( (is-trig mc_cot: mc_acot:) )
( (is-trig mc_sec: mc_asec:) )
( (is-trig mc_csc: mc_acsc:) )
( (is-trig mc_sinh: mc_asinh:) )
( (is-trig mc_cosh: mc_acosh:) )
( (is-trig mc_tanh: mc_atanh:) )
( (is-trig mc_coth: mc_acoth:) )
( (is-trig mc_sech: mc_asech:) )
( (is-trig mc_csch: mc_acsch:) )

; acos -> cos
( (is-trig mc_asin: mc_sin:) )
( (is-trig mc_acos: mc_cos:) )
( (is-trig mc_atan: mc_tan:) )
( (is-trig mc_acot: mc_cot:) )
( (is-trig mc_asec: mc_sec:) )
( (is-trig mc_acsc: mc_csc:) )
( (is-trig mc_asinh: mc_sinh:) )
( (is-trig mc_acosh: mc_cosh:) )
( (is-trig mc_atanh: mc_tanh:) )
( (is-trig mc_acoth: mc_coth:) )
( (is-trig mc_asech: mc_sech:) )
( (is-trig mc_acsch: mc_csch:) )

;*****************************************************************************
;* Logarithmic

; log[10 x => (log x 10)
( (log-special $log $base $expr
			$res)
	(id $log mc_log:$t)
	(tapply $log (-SEQUENCE $expr $base) $res) )


;*****************************************************************************
;* Gradient

; Del[x f(x) => (nabla (x) (f x))
( (nabla-special $nabla $vars $expr
			$res)
	(id $nabla mc_âˆ‡:$t)
	(tapply nabla:$t (-SEQUENCE $vars $expr) $res) )


;*****************************************************************************
;* WRITE-like function definitions

( (write-special $tag (-PAIR $f (-PARENS $null $params)) $rhs
			(eval:$tag (numeric ($tf | $tparams))))
	(strip-font $f $ff)
	(is-write $ff) (!)
	(texp $f $tf)
	(texp $rhs $trhs)
	(tseq $params $tparams_)
	(append $tparams_ $trhs $tparams) )

( (is-write mc_APPENDPRN:) )
( (is-write mc_WRITE_5F_HLS:) )
( (is-write mc_WRITE_5F_HSV:) )
( (is-write mc_WRITEWAV:) )
( (is-write mc_WRITEBMP:) )
( (is-write mc_WRITERAW:) )
( (is-write mc_WRITEBIN:) )
( (is-write mc_WRITEPRN:) )
( (is-write mc_WRITERGB:) )

;*****************************************************************************
;* Solve-block functions

( (is-solve $f:$t)	
	(strip-font $f $ff)
        (tolower $ff $lf)
	(is-solve_ $lf) )

( (is-solve_ mc_find:) )
( (is-solve_ mc_minimize:) )
( (is-solve_ mc_maximize:) )
( (is-solve_ mc_minerr:) )
( (is-solve_ mc_odesolve:) )
( (is-solve_ mc_odefind:) )
( (is-solve_ mc_pdesolve:) )
( (is-solve_ mc_numol:) )
( (is-solve_ mc_polyroots:) )

;*****************************************************************************
;* Other special functions

( (is-genfit $f)
	(strip-font $f $ff)
	(id $ff mc_genfit:) )

( (is-format $f)
	(strip-font $f $ff)
	(id $ff mc_format:) )

( (is-trace $f)
	(strip-font $f $ff)
	(id $ff mc_trace:) )

( (is-pause $f)
	(strip-font $f $ff)
	(id $ff mc_pause:) )

;*****************************************************************************
;* Derivative special powers

( (is-small-power 1:) )
( (is-small-power 2:) )
( (is-small-power 3:) )
( (is-small-power 4:) )
( (is-small-power 5:) )

;*****************************************************************************
;* The general cases - s-expression and identity

( (texp ($f | $args)
			($tf | $targs))
	(texp $f $tf)
	(map &texp-%-2 $args $targs) )

( (texp $x $x) )


;*****************************************************************************
;* Utilities

( (lookup $x $l1 $l2 $res) (lookup &id-%-2 $x $l1 $l2 $res) )
( (lookup $eq $x ($x1 | $1) ($res | $2) $res)
	($eq $x $x1) )

( (lookup $eq $x ($1 | $from) ($2 | $to)
			$res)
	(lookup $eq $x $from $to $res) )

( (rtail ($a) ()) )
( (rtail ($h | $t) ($h | $rt))
	(rtail $t $rt) )

( (gather $marker $accum ( ($marker | $r) | $r1 )
			$res)
	(gather $marker $accum $r $res1)
	(gather $marker $res1 $r1 $res) )

( (gather $marker $accum ($x | $r)
			$res)
	(gather $marker ($x | $accum) $r $res) )

( (gather $marker $accum ()
			$accum) )

; apply a predicate on a list
( (map $pred () ()) )
( (map $pred ($x | $r)
			($x1 | $r1))
	($pred $x $x1)
	(map $pred $r $r1) )

; apply a predicate on two equally long lists
( (zip $pred () () ()) )
( (zip $pred ($x | $xr) ($y | $yr)
			($h | $t))
	($pred $x $y $h)
	(zip $pred $xr $yr $t) )

( (reverse $l1 $l2)
	(reverse $l1 () $l2) )
( (reverse () $l $l) )
( (reverse ($h | $l1) $l2 $l3)
	(reverse $l1 ($h | $l2) $l3) )

( (concat () $l $l) )
( (concat ($h | $t) $l
			($h | $r))
	(concat $t $l $r) )

( (append () $e ($e)) )
( (append ($h | $t) $e
			($h | $r))
	(append $t $e $r) )

( (length () 0) )
( (length ($h | $t)
			$len)
	(length $t $tlen)
	(+ 1 $tlen $len) )

( (assoc $pred $args (($key $value) | $t)
			$value)
	($pred $args $key) )

( (assoc $pred $args ($h | $t)
			$res)
	(assoc $pred $args $t $res) )

;; Find the first tag (in depth-first order) within
;; an expression.
( (find-tag $x:$t $t) )

( (find-tag ($x | $r)
            $t)

    (find-tag $x $t))

( (find-tag ($x | $r)
            $t)

    (find-tag $r $t))


( (id $x $x) )

;*****************************************************************************
