( (texp (-PLOT:$tag $comp $tree $options $xopt $yopt $y2opt $xs $xll $xul $xm1 $xm2 $ys $yll $yul $ym1 $ym2 $y2s $y2ll $y2ul $y2m1 $y2m2)
			(eval (cplot:$tag $callback 
							 $options $xopt $yopt $y2opt
							 (list | $typarams) 
							 (list | $ty2params) 
							 (list | $tyxs)
							 (list | $ty2xs)
							 (list | $tys)
							 (list | $ty2s)
							 $txll $txul $txm1 $txm2
							 $tyll $tyul $tym1 $tym2
							 $ty2ll $ty2ul $ty2m1 $ty2m2)))
	(id $callback (plotcb $comp $tree))

	;; translate Xs while replacing placeholders
	;; with -PLOTVAR
	(substitute true $xs $txs) 

	; make sure Ys, and Y2s are lists and are translated
	(substitute false $ys $tys)
	(substitute false $y2s $ty2s)

	;; split the Xs in Y Xs and Y2 Xs
	(split $tys $txs $tyxs $txs')
	(split $ty2s $txs' $ty2xs $_)

	;; guess whether the traces are parametric
	(map &parametric-%-2 $tyxs $typarams)
	(map &parametric-%-2 $ty2xs $ty2params)

	;; translate limits and markers
	(id ($xll $xul $xm1 $xm2 $yll $yul $ym1 $ym2 $y2ll $y2ul $y2m1 $y2m2) $list)
	(map &tval-%-2 $list $tlist)
	(id ($txll $txul $txm1 $txm2 $tyll $tyul $tym1 $tym2 $ty2ll $ty2ul $ty2m1 $ty2m2) $tlist) )

;; translate tagged sequence of expressions
;; extract tags, and replace placeholders if
;; necessary
( (substitute $_ NULLPTR ()) )
( (substitute $_ () ()) )
( (substitute $replace ($x | $xs)
			($tx | $txs))
	(plot-var $replace $x $tx) 
	(substitute $replace $xs $txs) )

;; substitute X placeholder
( (plot-var true -NULLO:$tag -PLOTVAR:$tag) )
( (plot-var $_ $x
			$tx)
	(texp $x $tx) )

;; Ys has at least 1 and Xs has more than 1 element
( (split ($y1 | $ys) ($x1 $x2 | $xs)
			($x1 | $yxs) $y2xs)
	(split $ys ($x2 | $xs) $yxs $y2xs) )

;; Xs has only 1 element - use it for all remaining
( (split ($y1 | $ys) ($x1)
			($x1 | $yxs) $y2xs)
	(split $ys ($x1) $yxs $y2xs) )

;; no more Ys, return the remaining Xs
( (split () $xs () $xs) )

;; check whether the Xs could be used in parametric plot
;; i.e. whether X is not a variable, but a function of one
;; This is a lame check though as it would consider (x) a
;; parametric function
( (parametric $x (I (unboxed 0)))
	(atom $x) )
( (parametric $_ (I (unboxed 1))) )

;; special translation of limits and markers 
;; so placeholders won't abort the translation
;; Also strip units from them
( (tval -NULLO:$tag
			(number 0:$tag)) )

( (tval $v $tv) 
	(texp $v $tv) )
