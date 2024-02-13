;;; rules for plots
( (trans-eval $tag (cplot:$t | $form)
			$res) (!)

   (id $form       ($callback $options $xopt $yopt $y2opt
						  $yparams $y2params 
						  (list | $yxs) (list | $y2xs)
						  (list | $ys) (list | $y2s)
						  $xll $xul $xm1 $xm2 
						  $yll $yul $ym1 $ym2 
						  $y2ll $y2ul $y2m1 $y2m2))
	
	(sub-traces $yxs $ys $ytraces)
	(sub-traces $y2xs $y2s $y2traces) 

	(scale-limits $xll $xul $xm1 $xm2 $xlimits)
	(scale-limits $yll $yul $ym1 $ym2 $ylimits)
	(scale-limits $y2ll $y2ul $y2m1 $y2m2 $y2limits)

	(id $res_ (cplot:$t 
							$callback 
							$options $xopt $yopt $y2opt
							$yparams 
							$y2params 
							(list | $ytraces) 
							(list | $y2traces) 
							$xlimits
							$ylimits
							$y2limits
							))

	(texp $res_ $res) )

;; append only if not present in the list
( (append-unique () $a ($a)) )
( (append-unique ($a | $_) $a
	($a | $_)) )

( (append-unique ($h | $t) $a
			($h | $ta))
	(append-unique $t $a $ta) )

;; scan id's not in function position
( (scan-args () () ()) )
( (scan-args () $a $list
			$res)
	(atom $a)
	(append-unique $list $a $res) )

( (scan-args () ($f | $as) $list
			$args)
	(map-accum &scan-args-%-4 () $as $list $args) )

;; collect unresolved arguments from a list
( (collect-unresolved $args
		      $unresolved)
	(collect &is-unresolved-%-1 () $args $unresolved) )

( (is-unresolved $var)
	(strprefix $var "-") (!)				; names starting with '-' are special so fail
	(fail 0) )

( (is-unresolved $var)
	(signature $var $_) (!)			; if it is document or statically bound
	(fail 0) )									; fail

( (is-unresolved $var)				; all other names are unresolved
	(is-string $var) )

;; scan for unresolved arguments
( (scan-unresolved $expr 
			$unresolved)
	(scan-args () $expr () $args)
	(collect-unresolved $args $unresolved) )

;; create a list of traces, flag unresolved identifiers
;; and return the names of the quick plot parameters, if any
( (sub-traces () () ()) )
( (sub-traces ($x | $xs) ($y | $ys) 
			($t | $ts))
	(mktrace0 $x $y $t) 
	(sub-traces $xs $ys $ts) )

;;; mktrace0 scans for unresolved identifiers in Y
( (mktrace0 $x $y
			$trace)
	; find all unresolved arguments in the Y expression
	(scan-unresolved $y $unresolved)
	(mktrace1 $unresolved $x $y $trace) )

;;; mktrace1 checks the number of unresolved in Y, raises 
;;; appropriate errors, replaces the X placeholder, scans
;;; for unresolved X
;; if 2 or more unresolved raise an error in Y
( (mktrace1 ($u1:$tag $u2 | $us) $x $y
			aborted)
	(abort undefined1 $tag) )

;; if no unresolved but we have a placeholder in X
;; raise an error in X
( (mktrace1 () (constant -PLOTVAR:$tag) $y
			aborted)
	(abort bad_placeholder $tag) )

;; if 1 unresolved and we have a placeholder in X
;; replace the placeholder and continue
( (mktrace1 ($var:$_) (constant -PLOTVAR:$tag) $y
			$trace)
	(mktrace1 ($var:$_) $var:$tag $y $trace) )

;; ...otherwise...
( (mktrace1 $unresolved-ys $x $y
			$trace)
	; find all unresolved arguments in the X expression
	(scan-unresolved $x $unresolved-xs)

	(mktrace2 $unresolved-xs $unresolved-ys $x $y $trace) )

;;; mktrace2 merges the unresolved Y and X identifiers
( (mktrace2 $uxs () $x $y 
			$trace)
	(mktrace3 $uxs $x $y $trace) )

( (mktrace2 $uxs ($yvar) $x $y 
			$trace)
	(append-unique $uxs $yvar $us) 
	(mktrace3 $us $x $y $trace) )

;;; mktrace3 raises an error if too many unresolved
;;; then scans for ranges
;; if 2 or more unresolved raise an error in Y
( (mktrace3 ($u1:$tag $u2 | $us) $x $y
			aborted)
	(abort undefined2 $tag) )

( (mktrace3 $us $x $y
 			$trace)
	; find all range variables, put 0 in function position
	; so that X is not skipped
	(find-plot-ranges ($x $y) $ranges)

	(mktrace4 $us $ranges $x $y $trace) )

;;; mktrace4 creates the appropriate trace - vector, range, or quick
;; vector trace - no unresolved, no ranges
( (mktrace4 () () $x $y
			$trace)
	;; get the X and Y expression tags
	(get-tag $x $uxt $xt)
	(get-tag $y $uyt $yt)

	(types (_) () $x $y $yt $sfs)
	(scale-trace (_) $x xsf $xlambda)
	(scale-trace (_) $y ysf $ylambda)

	; MPL doesn't allow lambdas with no arguments so 
	; create a unary lambdas with _ as the argument
	(id $trace 
	    (let ((sfs $sfs) (xsf (ldelem_f8 sfs (unboxed 0))) (ysf (ldelem_f8 sfs (unboxed 1))))
					(vector_trace:$yt 
						$x							; 
						$xlambda					; x-lambda
						$ylambda					; y-lambda
						$uxt $uyt))) )			; x- and y-tags for error reporting

;; range trace - no unresolved, some ranges
( (mktrace4 () $ranges $x $y
			$trace)
	;; get the X and Y expression tags
	(get-tag $x $uxt $xt)
	(get-tag $y $uyt $yt)

	; wrap ranges with no-loop so they won't be iterated over
	(map &no-loop-%-2 $ranges $wranges)

	(types $ranges $ranges $x $y $yt $sfs)
	(scale-trace $ranges $x xsf $xlambda)
	(scale-trace $ranges $y ysf $ylambda)

	(id $trace 
	    (let ((sfs $sfs) (xsf (ldelem_f8 sfs (unboxed 0))) (ysf (ldelem_f8 sfs (unboxed 1))))
					(range_trace:$yt 
						(vector | $wranges)     	; list of ranges
						$xlambda							; x-lambda
						$ylambda							; y-lambda
						$uxt $uyt))) )					; x- and y-tags for error reporting

;; quick plot trace - one unresolved, no ranges
( (mktrace4 ($var) () $x $y
			$trace)
	;; get the X and Y expression tags
	(get-tag $x $uxt $xt)
	(get-tag $y $uyt $yt)

	(types ($var) (quick_range) $x $y $yt $sfs)
	(scale-trace ($var) $x xsf $xlambda)
	(scale-trace ($var) $y ysf $ylambda)

	; put the quick parameter name in the trace so it can 
	; be inserted in the place of placeholders later
	(id $trace 
	    (let ((sfs $sfs) (xsf (ldelem_f8 sfs (unboxed 0))) (ysf (ldelem_f8 sfs (unboxed 1))))
					(quick_trace:$yt					
						(string $var)	; name of quick plot variable
						$xlambda			; x-lambda
						$ylambda			; y-lambda
						$uxt $uyt))) )	; x- and y-tags for error reporting

;; extracts the tag of an expression
;; if not tag is found, return 0
( (get-tag $_:$tag 
			(unboxed $i) $tag)
	(int-to-tag $i $tag) )

( (get-tag ($h | $t)
			$utag $tag)
	(get-tag $h $utag $tag) )

( (get-tag $_ 
			(unboxed 0) $tag) 
	(int-to-tag 0: $tag) )

;; apply a predicate on a list
( (map $pred () ()) )
( (map $pred ($x | $r)
			($x1 | $r1))
	($pred $x $x1)
	(map $pred $r $r1) )

;; find plot ranges
( (find-plot-ranges $x ($x))
	(atom $x)
	(is-range $x) )

( (find-plot-ranges $x $res)
	(find-plot-ranges-aux $x () $res) )

( (find-plot-ranges-aux ($f | $args) $accum $res) (!)
	(find-plot-ranges $f $h)
	(unique-concat $accum $h $1)
	(find-plot-ranges-aux $args $1 $res) )

( (find-plot-ranges-aux $_ $accum $accum) ) 

( (unique-prepend $x $lst $lst)
	(member $x $lst) )

( (unique-prepend $x $lst ($x | $lst)) )

( (unique-concat () $b $b) )
( (unique-concat ($h | $t) $b $res)
	(unique-concat $t $b $1)
	(unique-prepend $h $1 $res) )

;; wrap a range with no-loop
( (no-loop $r (as_object ((constant no-loop) $r))) )

( (types $arg-names $arg-vals $x $y $tag
			(scale_factors (typeof:$tag ($foo (tuple | $arg-vals) (lambda $arg-names $x) (lambda $arg-names $y)))))
	(length $arg-vals $n)
	(strglue check_trace_ $n $foo) )

( (scale-trace $arg-names $exp $sf 
			(lambda $arg-names (divide_by_float $exp $sf))) )

( (scale-limits $ll $ul $m1 $m2
			(let ((sf (scale_factor (typeof $kind)))) (list $tll $tul $tm1 $tm2)))
	(get-tag $ll $_1 $lltag)
	(get-tag $ul $_2 $ultag)
	(get-tag $m1 $_3 $m1tag)
	(get-tag $m2 $_4 $m2tag)
	(id $kind (check_limits:$lltag (list $ll $ul $m1 $m2)))
	(id $tll (as_real:$lltag (divide_by_float $ll sf)))
	(id $tul (as_real:$ultag (divide_by_float $ul sf)))
	(id $tm1 (as_real:$m1tag (divide_by_float $m1 sf)))
	(id $tm2 (as_real:$m2tag (divide_by_float $m2 sf))) )
