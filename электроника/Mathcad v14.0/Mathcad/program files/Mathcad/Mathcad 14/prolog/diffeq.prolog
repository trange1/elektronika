;;********* Copyright © Parametric Technology Corporation. All rights reserved
;;*
;;*
;;*  Version : $Header: /MathcadClient/Trunk/eng/mctranslator/prolog/diffeq.prolog   56   2006-10-19 16:42:16-04:00   jbell $
;;*
;;*
;;*  Purpose : 
;;*
;;*
;;*  Comments: This file uses a tab size of 3 spaces.
;;*
;;*
;;****************************************************************************

; Point of transition between 12 and 11.  The "trans" predicate
; is a Mathcad 12 thing, and dispatches to the older
; create-pde-solver-call which was used in 11.
;( (trans $env (mc_pdesolve ($callback | $rest) $constraints)
;              $pde-call)
;    (create-pde-solver-call 0 $rest $constraints
;                            $pde-call)  (!) )

; Point of transition between 12 and 11.  The "trans" predicate
; is a Mathcad 12 thing, and dispatches to the older
; create-pde-solver-call which was used in 11.
( (texp (mc_pdesolve (($cb $sink $tree) | $rest_) 
                      (list | $constraints_))
        $res)
    (eliminate-top-recursion $rest_        $rest)        (!)
    (eliminate-top-recursion $constraints_ $constraints) (!)
    (create-pde-solver-call ($cb $sink $tree) $tree $rest $constraints
                            $pde-call) 
    (texp $pde-call
          $res) )


; EINFO points to the block closer tree node 

( (create-pde-solver-call $callback $EINFO $args $constraints
                      $res)
    (create-pde-call-no-fname $callback $EINFO $args $constraints
                              $r1)
    (postprocess $r1 $res) )

( (create-pde-solver-call $callback $EINFO $args $constraints
                      $res)
    (create-pde-call $callback $EINFO $args $constraints
                     $r1)
    (postprocess $r1 $res) )


; This clause is here to accomodate bug 020826-170504, which says
; that you can use a PDE block without specifying a function name.
( (create-pde-call-no-fname $callback $EINFO 
                                   ($options
                                    $space-var $space-endpoints $time-var | $r)
                                   $constraints
                            $res)
    (is-string $space-var)
    (is-string $time-var)
    (id $space-endpoints (op_matrix $rows $cols | $r1))
    (strip-to-num $rows 2)
    (strip-to-num $cols 1)
    (infer-function-name $space-var $time-var $constraints
                         $fname)
    (create-pde-call $callback $EINFO 
                               ($fname $options
                                 $space-var $space-endpoints $time-var | $r)
                               $constraints
                     $res)
    )
    
( (infer-function-name $space-var $time-var $constraints
                       $fname)
    (map-accum-rec &is-pderiv-%-5 ($space-var $time-var) () $constraints
                   $res $accum-end) (!)
    (id $accum-end ($fname | $r)) )

( (is-pderiv ($space-var $time-var) $accum $expr
             0: ($fname | $accum))
    (pderiv $fname $time-var $order $args $expr)
    (> $order 0:) )

( (is-pderiv ($space-var $time-var) $accum $expr
             0: ($fname | $accum))
    (pderiv $fname $space-var $order $args $expr)
    (> $order 0:) )



( (create-pde-call $callback $EINFO 
                      ($options $fmat $space-var | $r) $constraints
                  (error2 (string "must be identifier") $EINFO (unboxed 2)))
    (not-string-t $space-var) )

( (create-pde-call $callback $EINFO ($options 
                           $fmat $space-var $space-endpoints $time-var | $r)
                          $constraints
                 (error2 (string "must be identifier") $EINFO (unboxed 4)))
    (not-string-t $time-var) )


( (create-pde-call $callback $EINFO $args $constraints
                   (error2 (string "too_few_arguments") $EINFO (unboxed 0)))
    (length $args $n)
    (< $n 5:) )


( (create-pde-call $callback $EINFO ($options
                           $fmat $space-var $space-endpoints $time-var | $r)
                           $constraints
                   (error2 (string "PDE2ndOrderTimeNotAllowed") 
                           $EINFO (unboxed 0)))
    (has-2-order-time ($space-var $time-var) $constraints
                      1:) )

( (create-pde-call $callback $EINFO ($options
                           $fmat $space-var $space-endpoints $time-var | $r)
                           $constraints
                   (error2 (string "PDE3rdOrderSpaceNotAllowed") 
                           $EINFO (unboxed 0)))
    (has-3-order-space ($space-var $time-var) $constraints
                       1:) )


( (filter-init-c $EINFO $args $constraints
                 ($options $fnames $space-var $leftb $rightb 
                  $time-var $btime $etime
                  $eqns $num-spatial $num-temporal
                  $dirichlet-bc
                  $neumann-bc
                  $init-c
                  $sfnames $perm-func $num-func
                  $rest))
    (preprocess-pde $EINFO $args $constraints
                    ($options $fnames $space-var $leftb $rightb 
                     $time-var $btime $etime
                     $eqns $num-spatial $num-temporal))
    (filter &is-dirichlet-bc-%-3 ($fnames $space-var $time-var) $eqns
                                 $dirichlet-bc $r1) (!)
    (filter &is-neumann-bc-%-3 ($fnames $space-var $time-var) $r1
                       $neumann-bc $r2) (!)
    (filter &is-init-c-%-3 ($fnames $space-var $btime) $r2
                           $init-c $rest) (!)
    (make-permutation-func $fnames
                           $sfnames $perm-func)
    (length $fnames $num-func) )

( (create-pde-call $callback $EINFO $args $constraints
                   $res)
    (filter-init-c $EINFO $args $constraints
                   ($options $fnames $space-var $leftb $rightb 
                    $time-var $btime $etime
                    $eqns $num-spatial $num-temporal
                    $dirichlet-bc
                    $neumann-bc
                    $init-c
                    $sfnames $perm-func $num-func
                    $rest))
    (length $init-c $lic)
    (!= $lic $num-func)
    (id $res (error0 (string "PDEBadNumInit"))) )


( (create-pde-call $callback $EINFO $args $constraints
                   $res)
    (filter-init-c $EINFO $args $constraints
                   ($options $fnames $space-var $leftb $rightb 
                    $time-var $btime $etime
                    $eqns $num-spatial $num-temporal
                    $dirichlet-bc
                    $neumann-bc
                    $init-c
                    $sfnames $perm-func $num-func
                    $rest))
    (filter &is-pde-%-3 ($fnames $space-var $time-var) $rest
                  $pdes $r4)
    (filter &is-pae-%-3 ($space-var) $r4
                  $paes $r5)
    (filter &is-coae-%-3 () $r5
                  $coaes ())
    (make-coae-bindings 
         $fnames $space-var $time-var $num-spatial $leftb $rightb $coaes
         $dirichlet-bc $neumann-bc
      $coae-bindings $new-dbc $new-vbc)
    (nsort $pdes &compare-first-%-2
           $pdes-sorted)
    (nsort $init-c &compare-first-%-2
           $init-c-sorted)
    (nsort $new-dbc &compare-first-%-2
           $dirichlet-bc-sorted)
    (nsort $new-vbc &compare-first-%-2
           $neumann-bc-sorted)
    (create-pdesolve-call $callback
                            $EINFO $options $sfnames $dirichlet-bc-sorted 
                            $neumann-bc-sorted $init-c-sorted
                            $pdes-sorted $paes
                            $leftb $rightb $btime $etime
                            $num-spatial $num-temporal
                            $space-var $time-var
                          $pde-call) 
    (make-pde-interp-mat ($perm-func $pde-call) $num-func 
                         $leftb $rightb $btime $etime
                     $pde-interp)
    (id $res (let* $coae-bindings
                   $pde-interp)) )
                    
( (preprocess-pde $EINFO ($options $fmat 
                            $space-var (op_matrix $2 $1 (list $leftb $rightb))
                            $time-var  (op_matrix $2 $1 (list $btime $etime)) 
                            | $opt-args)
                         $constraints
                  ($options 
                   $fnames $space-var $leftb $rightb $time-var $btime $etime
                   $eqns | $popt-args))
    (strip-to-num $2 2:) ; cute, eh?
    (strip-to-num $1 1:)
    (get-fnames $fmat $fnames)
    (preprocess-constraints $constraints $eqns) 
    (preprocess-opt-args $EINFO $opt-args
                         $popt-args) )



( (get-fnames (op_matrix $n $1 (list | $fnames)) $fnames)
    (strip-to-num $1 1:) )
( (get-fnames $x ($x)) )

; Optionally, the number of spatial and temporal discretization
; points can be specified
( (preprocess-opt-args $EINFO ()
                       ($spatial $temporal))
    (make-discr-func 10 $EINFO 3 (string "PDESpatialEndpointsMustBeReal")
                     $spatial)
    (make-discr-func 100 $EINFO 5 (string "PDETemporalEndpointsMustBeReal")
                     $temporal) )

( (preprocess-opt-args $EINFO ($nspace)
                       ($spatial $temporal))
    (make-discr-const $nspace $spatial)
    (make-discr-func 100 $EINFO 5 (string "PDETemporalEndpointsMustBeReal")
                     $temporal) )

( (preprocess-opt-args $EINFO ($nspace $ntime)
                       ($spatial $temporal))
    (make-discr-const $nspace $spatial)
    (make-discr-const $ntime $temporal) )

( (preprocess-opt-args $EINFO ($nspace $ntime | $r)
                       ((error2 (string "too_many_arguments") 
                                $EINFO (unboxed 0)) 
                        0:)))

( (make-discr-func $n $EINFO $param_no $message
                   (lambda (a b) 
                      (mc_trunc (op_mult $n (op_abs (op_sub $ca $cb))))))
    (make-check-real $EINFO $param_no $message a
                     $ca)
    (make-check-real $EINFO $param_no $message b
                     $cb) )

( (make-discr-const $n
                    (lambda (a b) $n)) )

( (make-check-real $EINFO $param_no $message $x
                   (if (and- (bv (is_number $x))
                             (op_eq (mc_Im $x) 0))
                       $x
                    (error2 $message $EINFO (unboxed $param_no)))) )
                            


( (is-dirichlet-bc ($fnames $space-var $time-var1) 
                            (op_eq ($fname $pt $time-var2) $expr)
                   ($fname $pt $expr))    
    (id-t $time-var1 $time-var2)
    (nth-rev $n $fnames $fname) 
    (neq-t $pt $space-var)
    ; make sure that the function names don't occur on the right-hand side:
    (map-collect &has-%-3 $fnames $expr ()
                 $occurrences) (!)
    (id $occurrences ()) )

( (is-neumann-bc ($fnames $space-var $time-var1) (op_eq ($fx $pt $time-var2) 
                                                          $expr)
                 ($fname $pt $expr))
    (id-t $time-var1 $time-var2)
    (count-partial $fx $fname $space-var 1) 
    (nth-rev $n $fnames $fname)
    (neq-t $pt $space-var)
    ; make sure that the function names don't occur on the right-hand side:
    (map-collect &has-%-3 $fnames $expr ()
                 $occurrences) (!)
    (id $occurrences ()) )

( (is-init-c ($fnames $space-var1 $btime) (op_eq ($fname $space-var2 $pt) 
                                                   $expr)
             ($fname $pt $expr))
    (id-t $space-var1 $space-var2)
    (nth-rev $n $fnames $fname) )


( (is-pde ($fnames $space-var $time-var) $expr
          $res)
    (find-first &is-pde1-%-3 ($expr $space-var $time-var) $fnames
                $res) )

( (is-pde1 ($expr $space-var $time-var) $fname
           ($fname $res))
    (make-pderiv $fname $time-var 1 ($space-var $time-var)
                 $pd) (!)
    (solve $pd $expr $res) )
         
; helper for is-pae below
( (hasvar $var1 $var2 $var2)
    (id-t $var1 $var2) )

( (is-pae ($space-var) (op_eq $lhs $rhs)
                       (op_sub $lhs $rhs))
    (find-sub &hasvar-%-3 $space-var ($lhs $rhs)
              $var) (!)
    (id-t $var $space-var) )

( (has-2-order-time ($space-var $time-var) $expr
                    1:)
    (map-accum-rec &is-2-order-time-%-5 ($space-var $time-var) () $expr
                   $res $accum-end)
    (id $accum-end (1: | $r)) )

( (is-2-order-time ($space-var $time-var) $accum $expr
                   0: (1: | $accum))
    (pderiv $fname $time-var $order $args $expr)
    (> $order 1:) )


( (has-3-order-space ($space-var $time-var) $expr
                     1:)
    (map-accum-rec &is-3-order-space-%-5 ($space-var $time-var) () $expr
                   $res $accum-end)
    (id $accum-end (1: | $r)) )

( (is-3-order-space ($space-var $time-var) $accum $expr
                    0: (1: | $accum))
    (pderiv $fname $space-var $order $args $expr)
    (> $order 2:) )


; This predicate assumes that the PAEs have been filtered out
; Nutshell difference between a PAE and a COAE: the spatial
; variable appears explicitly in a PAE.
( (is-coae () (op_eq $lhs $rhs)
              (op_sub $lhs $rhs)) )

( (create-pdesolve-call $callback $EINFO $options
                          $fnames $dirichlet-bc $neumann-bc 
                          $init-c $pdes $paes
                          $leftb $rightb $btime $etime
                          $num-spatial $num-temporal
                          $space-var $time-var
   (if (and- $check1
;;        $check2
        $dbc-check
        $vbc-check)
      (pdesolve $callback
                $options
                $leftb $rightb 
                ($num-spatial $leftb $rightb)
                $btime $etime
                ($num-temporal $btime $etime)
                $num-pde
                $num-pae
                $pdae-exist-2-order
                $pfunc
                $pinit-func
                0 ; no coupled ODE
                num_coae        ; num OAE
                0 ; no couple vec for ODE
                coae_couple_vec ; couple vec for OAE
                coae_rhs        ; rhs for ODE and OAE
                (coae_init $pinit-func)  ; init. vec for ODE and OAE
                $boundary-matrix
                $bfunc-d-left
                $bfunc-d-right
                $bfunc-n-left
                $bfunc-n-right)
        ;else
        (error0 (string "unknown error")))) ; should never get here
    (length $pdes $num-pde)
    (length $paes $num-pae)
    (has-2-order $pdes $paes $space-var $pdae-exist-2-order)
    (make-check1 $EINFO $num-pde $num-pae $fnames
                 $check1)
    (make-pfunc $pdes $paes $fnames $space-var $time-var
                $pfunc)
    (make-pinit-func $init-c $btime $space-var
                     $pinit-func)
;; No longer needed. Check takes place in create-pde-call
;;    (make-check2 $init-c $fnames
;;                 $check2)
    (fill-bc-entries $fnames $dirichlet-bc
                     $dbc-filled)
    (make-bc-check $leftb $rightb $dirichlet-bc
                   $dbc-check)
    (fill-bc-entries $fnames $neumann-bc
                     $vbc-filled)
    (make-bc-check $leftb $rightb $neumann-bc
                   $vbc-check)
    (make-bc-matrix ($leftb $rightb) $dbc-filled $vbc-filled
                    $boundary-matrix)
    (make-bc-lambda-func ($leftb $rightb) $time-var $dbc-filled $vbc-filled
                         ($bfunc-d-left
                          $bfunc-d-right
                          $bfunc-n-left
                          $bfunc-n-right)) )
      
; Detect 2nd-order spatial derivatives
            
( (has-2-order $pdes $paes $space-var
               $pdae-exist-2-order)
    (find-sub &is-2-order-%-3 $space-var $pdes
              $pdae-exist-2-order) )

( (has-2-order $pdes $paes $space-var
               $pdae-exist-2-order)
    (find-sub &is-2-order-%-3 $space-var $paes
              $pdae-exist-2-order) )

( (has-2-order $pdes $paes $space-var
               0:) )

( (is-2-order $var $expr
              1:)
    (pderiv $fname $var 2: $args $expr) )


; Make function for evaluating PDE and PAE right-hand sides

( (make-pfunc $pdes $paes $fnames $space-var $time-var
              (lambda ($space-var $time-var u ux uxx v)
                 (op_matrix (unboxed $rows) (unboxed 1) (list | $rhs))))
    (filter &nth-%-3 1: $pdes
            $pde-rhs ())
    (map-rec &pderiv-subs-%-3 ($fnames $space-var $time-var) $pde-rhs
             $p1)
    (map-rec &pderiv-subs-%-3 ($fnames $space-var $time-var) $paes
             $p2)
    (append ($p1 $p2) $rhs)
    (length $rhs $rows) )

( (pderiv-subs ($fnames $space-var $time-var) $expr
               (subscript $vname (op_add $index mc_ORIGIN)
                                 (op_add 0      mc_ORIGIN)))
    (pderiv $fname $space-var $order ($space-var $time-var) $expr)
    (nth-rev $index $fnames $fname)
    (repeat "x": $order $xx)
    (strcat "u": $xx $vname) )
    

; Predicates for analyzing the COAE

( (make-coae-bindings 
         $fnames $space-var $time-var $num-spatial $leftb $rightb $coae
         $old-dbc $old-vbc
      $bindings $new-dbc $new-vbc)
    (id $bindings
      ( ;(-repeat (lambda (x n)
        ;            (if (op_eq n 0)
        ;                (list)
        ;              (-cons x (-repeat x (-sub n 1))))))
       (n ($num-spatial $leftb $rightb))
       (discr_index (lambda (left right x)
                        (mc_round 
                          (op_mult (op_sub n 1) 
                                   (op_div (op_sub x left)
                                           (op_sub right left))))))

       (coae_pairs (list | $coae-pairs))

       (indices (map
                  (lambda (pair)
                    (discr_index $leftb $rightb (fst pair)))
                  coae_pairs))

       (cmp     (lambda (i1 i2) (as_bool (op_lt i1 i2))))

       (coae_couple_vec (list2vec (sort_list cmp indices)))

       (num_coae  (iv (length indices)))
       
       (coae_rhs  (lambda $args
                    (list2vec (sort_by_indices cmp indices
                                (map (lambda (pair)
                                       ((snd pair) | $args))
                                     coae_pairs)))))

       (coae_init (lambda (pfunc)
                    (list2vec (list | $coae-ic))))))

    (map-accum &analyze-coae-%-5
               ($fnames $space-var $time-var) 
               (0: () $old-dbc $old-vbc) 
               $coae
         $coae-pairs ($m $coae-ic-r $new-dbc $new-vbc))
    (!)
    (id $args ($time-var u ux uxx v))
    (reverse $coae-ic-r $coae-ic) (!) )
    



( (analyze-coae ($fnames $space-var $time-var) $accum $expr
                (tuple $pt (lambda ($time-var u ux uxx v) $rhs))
                $new-accum)
    (analyze-coae-points ($fnames $space-var $time-var) $expr
                         $points) (!)
    (make-all-eq-test $points "PDEBadCOAE" $pt) (!)
    (do-coae-subs ($fnames $space-var $time-var) (0: $accum) $expr
                  $rhs (1: $new-accum)) (!) )
;;    (id $nacc (1 $new-accum)) )

( (analyze-coae-points ($fnames $space-var $time-var) $expr
                       $points)
    (map-collect &analyze-coae-pt-%-3 ($fnames $space-var $time-var) $expr ()
                 $points) )

( (analyze-coae-pt ($fnames $space-var $time-var) $expr
                   $pt)
    (pderiv $fname $space-var $order ($pt $time-var) $expr)
    (nth-rev $index $fnames $fname) )


;; Here we are trying to heuristically automate the process
;; of turning boundary conditions into COAE, as in the example
;; on pages 203-204 of Prof. Schittkowski's manuscript.

( (do-coae-subs ($fnames $space-var $time-var) $accum $expr
                $rhs $new-accum)
    (map-accum-rec &coae-subs-dirichlet-%-5 ($fnames $space-var $time-var) 
                                            $accum $expr
                   $rhs $nacc)
    (id $new-accum $nacc) )

( (do-coae-subs ($fnames $space-var $time-var) $accum $expr
                $rhs $new-accum)
    (map-accum-rec &coae-subs-neumann-%-5 ($fnames $space-var $time-var) 
                                          $accum $expr
                   $rhs $nacc)
    (id $new-accum $nacc) )

( (coae-subs-dirichlet ($fnames $space-var $time-var) 
                            ($did-subs $accum) $expr
                       (subscript $vname (op_add $index mc_ORIGIN)
                                         (op_add 0      mc_ORIGIN))
                       ($did-subs $accum))
    (pderiv $fname $space-var $order ($pt $time-var) $expr)
    (nth-rev $index $fnames $fname)
    (repeat "x": $order $xx)
    (strcat "u": $xx $vname)
    (dbc-subs-not-needed $did-subs $order) )

; okay to do above substitution in these cases:
( (dbc-subs-not-needed 1: $order) )
( (dbc-subs-not-needed 0: $order)
    (!= $order 0:) )

( (coae-subs-dirichlet ($fnames $space-var $time-var) (0: $accum) $expr
                       $vsubs (1: $new-accum))
    (pderiv $fname $space-var $order ($pt $time-var) $expr)
    (nth-rev $index $fnames $fname)
    (id $order 0:)
    (id $init (subscript (pfunc $pt) (op_add $index mc_ORIGIN)
                                     (op_add 0      mc_ORIGIN)))
    (id $accum ($n $ic $dbc $vbc))
    (id $new-accum ($m 
                    ($init | $ic) 
                    (($fname $pt $vsubs) | $dbc)
                    $vbc))
    (id $vsubs (subscript v (op_add $n mc_ORIGIN)
                            (op_add 0  mc_ORIGIN)))
    (+ $n 1: $m) )

( (coae-subs-neumann ($fnames $space-var $time-var) 
                              ($did-subs $accum) $expr
                       (subscript $vname (op_add $index mc_ORIGIN)
                                         (op_add 0      mc_ORIGIN))
                       ($did-subs $accum))
    (pderiv $fname $space-var $order ($pt $time-var) $expr)
    (nth-rev $index $fnames $fname)
    (repeat "x": $order $xx)
    (strcat "u": $xx $vname)
    (vbc-subs-not-needed $did-subs $order) )

; okay to do above substitution in these cases:
( (vbc-subs-not-needed 1: $order) )
( (vbc-subs-not-needed 0: $order)
    (!= $order 1:) )

( (coae-subs-neumann ($fnames $space-var $time-var) (0: $accum) $expr
                      $vsubs (1: $new-accum))
    (pderiv $fname $space-var $order ($pt $time-var) $expr)
    (nth-rev $index $fnames $fname)
    (id $order 1:)
    (id $init 0:)
    (id $accum ($n $ic $dbc $vbc))
    (id $new-accum ($m 
                    ($init | $ic) 
                    $dbc
                    (($fname $pt $vsubs) | $vbc)))
    (id $vsubs (subscript v (op_add $n mc_ORIGIN)
                            (op_add 0  mc_ORIGIN)))
    (+ $n 1: $m) )

( (make-all-eq-test ($x) $err 
                    $x) )

( (make-all-eq-test ($x | $r) $err 
                    (if (op_eq $x $rest)
                        $x
                        (error0 (string $err))))
    (make-all-eq-test $r $err
                      $rest) )
                        


; Make function for (checking and) evaluating initial conditions

( (make-pinit-func $init-c $btime $space-var
                   (lambda ($space-var)
                      (op_matrix (unboxed $rows) (unboxed 1) (list | $ic))))
    (filter &make-ic-entry-%-3 $btime $init-c
            $ic ()) (!)
    (length $ic $rows) )

( (make-ic-entry $btime ($fname $pt $expr)
                 (if (op_eq $pt $btime)
                     $expr
                   (error0 (string "PDEICNotConsistentWithBlock")))) )


; pderiv predicate below isn't reversible, so...

( (make-pderiv $fname $var $order $args
               $res)
    (strip-tag            $fname $fname1)
    (strip-tag-and-prefix $var   $var1)     (!)
    (make-pderiv-1 $fname1 $var1 $order $args
                   $res) )

( (make-pderiv-1 $fname $var $order $args 
                 ($f | $args))
    (repeat $var $order $sub)
    (strcat $fname "_2E_": $tmp)
    (strcat $tmp $sub $f) )

; TODO
; Rethink pderiv.
; The fact that $var can either be bound or not
; may indicate that it should be broken into
; two separate predicates.

; pderiv -- predicate is true if last argument is a
; partial derivative of order $order with
; respect to $var.

( (pderiv $fname $var $order $args1 ($f | $args2))
    (id-t-lists $args1 $args2)            (!)
    (count-partial $f $fname $var $order) (!)
)


; Recognizes literal subscripts as partial derivatives
;  $f must be bound; the other arguments need not be.
( (count-partial $f $fname $var2 $order)
    (strip-tag $f $f1) 
    (strip-tag $var2 $var1)
    (strcat "mc_": $var $var1)
    (count-partial-1 $f1 $fname $var $order) )

; if $var is not bound...
( (count-partial $f $fname $var $order)
    (strip-tag $f $f1) 
    (count-partial-1 $f1 $fname $var1 $order)
    (strcat "mc_": $var1 $var) )

( (count-partial-1 $f $fname $var $order)
    (last-char $f $var)
    (strcat $f1 $var $f)
    (count-partial-1 $f1 $fname $var $o1)
    (+ $o1 1: $order) )

( (count-partial-1 $f $fname $var 0:)
    (strsuffix $f "_2E_":) ; this is the code for "."
    (strcat $fname "_2E_": $f) )

( (count-partial $f1 $f2 $var 0:)
    (id-t $f1 $f2) )

; Filter -- splits a list into two lists (those
; that satisfy a predicate, and those that don't).

( (filter $pred $pred-args ($x | $r)
          ($res | $yes) $no)
    ($pred $pred-args $x
           $res)
    (filter $pred $pred-args $r
            $yes $no) )

( (filter $pred $pred-args ($x | $r)
          $yes ($x | $no))
    (filter $pred $pred-args $r
            $yes $no) )

( (filter $pred $pred-args ()
          () ()) )
          


; Find the first element of a list which satisfies a
; given predicate

( (find-first $pred $pred-args ($x | $r)
              $res)
    ($pred $pred-args $x
           $res) )
              
( (find-first $pred $pred-args ($x | $r)
              $res)
    (find-first $pred $pred-args $r
                $res) )


; Find the first subexpression which satisfies a
; given predicate

( (find-sub $pred $pred-args $x
            $res)
    ($pred $pred-args $x
           $res) )

( (find-sub $pred $pred-args ($x | $r)
            $res)
    (find-sub $pred $pred-args $x
              $res) )

( (find-sub $pred $pred-args ($x | $r)
            $res)
    (find-sub $pred $pred-args $r
              $res) )

; Map a given predicate down a list, recursively

( (map-rec $pred $pred-args ($x | $r)
           ($y | $s))
    ($pred $pred-args $x $y)
    (map-rec $pred $pred-args $r
             $s) )

( (map-rec $pred $pred-args ($x | $r)
           ($y | $s))
    (map-rec $pred $pred-args $x
             $y)
    (map-rec $pred $pred-args $r
             $s) )

( (map-rec $pred $pred-args $x $x) )

; Map a predicate down a list, recursively, collecting
; its results into a another list

( (map-collect $pred $pred-args ($x | $r) $accum
               $s)
    ($pred $pred-args $x $y)
    (map-collect $pred $pred-args $r ($y | $accum)
                 $s) )

( (map-collect $pred $pred-args ($x | $r) $accum
               $s)
    (map-collect $pred $pred-args $x $accum
                 $s1)
    (map-collect $pred $pred-args $r $s1
                 $s) )

( (map-collect $pred $pred-args $x $accum
               $accum) )


; Map a predicate down a list, maintaining an accumulator
; which is passed to it each time
; (It's assumed that the predicate never fails)

( (map-accum $pred $pred-args $accum-start ($x | $r)
             ($y | $s) $accum-end)
    ($pred $pred-args $accum-start $x
           $y $accum-next) (!)
    (map-accum $pred $pred-args $accum-next $r
               $s $accum-end) (!) )

( (map-accum $pred $pred-args $accum-start ()
             () $accum-start) )

; For testing map-accum:
( (counter () $n $x
           $x $m)
    (+ $n 1: $m) )


; Like map-accum, but walks recursively down sublists

( (map-accum-rec $pred $pred-args $accum-start ($x | $r)
                 ($y | $s) $accum-end)
    ($pred $pred-args $accum-start $x
           $y $accum-next) (!)
    (map-accum-rec $pred $pred-args $accum-next $r
                   $s $accum-end) (!) )

( (map-accum-rec $pred $pred-args $accum-start ($x | $r)
                 ($y | $s) $accum-end)
    (map-accum-rec $pred $pred-args $accum-start $x
                   $y $accum-next) (!)
    (map-accum-rec $pred $pred-args $accum-next $r
                   $s $accum-end) (!) )

( (map-accum-rec $pred $pred-args $accum-start $x
                 $x $accum-start) )

; For testing map-accum-rec:
( (count-str () $n $x
             $x $m)
    (+ $n 1 $m)
    (!= $x "") )

; $lst should contain a list of three-element lists, like so:
;   ((<function-name>  <spatial point> <expression>)
;    (<function-name>  <spatial point> <expression>)
;    ... )

( (fill-bc-entries ($f1 | $fnames) (($f2 $pt1 $exp1) ($f3 $pt2 $exp2) | $rest)
                   (($f1 ($pt1 $exp1) ($pt2 $exp2)) | $frest))
    (id-t $f1 $f2)
    (id-t $f2 $f3)
    (fill-bc-entries $fnames $rest $frest) )

( (fill-bc-entries ($f1 | $fnames) (($f2 $pt1 $expr1) | $rest)
                   (($f1 ($pt1 $expr1) -NONE) | $frest))
    (id-t $f1 $f2)
    (fill-bc-entries $fnames $rest $frest) )                           
                           
( (fill-bc-entries ($f | $fnames) $rest
                   (($f -NONE -NONE) | $frest))
    (fill-bc-entries $fnames $rest $frest) )

( (fill-bc-entries () ()
                   ()) )


; Create a lambda that generates entries for the boundary-condition
; matrix

( (make-bc-matrix ($leftb $rightb) $dbc-triples $vbc-triples
                  (op_matrix (unboxed $rows) (unboxed 2) (list | $entries)))
    (zip &make-bc-matrix-entry-%-4 ($leftb $rightb)
                                   $dbc-triples $vbc-triples
         $pairs) (!)
    (lists-nth 0: $pairs $lfst) (!)
    (lists-nth 1: $pairs $lsnd) (!)
    (append ($lfst $lsnd) $entries) (!)
    (length $pairs $rows) (!) )


( (make-bc-matrix-entry ($leftb $rightb) ($f1 $db1 $db2) ($f2 $vn1 $vn2)
       ($left $right))
    (id-t $f1 $f2) (!)
    (make-bct $leftb $db1 $db2 $vn1 $vn2
              $left) (!)
    (make-bct $rightb $db1 $db2 $vn1 $vn2
              $right) (!) )

( (make-bct $pt $db1 $db2 $vn1 $vn2
            (op_add 1 (op_add $db $vn)))
    (make-bct1 1 $pt $db1 $db2
               $db)
    (make-bct1 2 $pt $vn1 $vn2
               $vn) )

( (make-bct1 $val $pt -NONE -NONE
             0) )

( (make-bct1 $val $pt ($pt1 $expr1) -NONE
             (if (op_eq $pt $pt1)
                 $val
               0)) )

( (make-bct1 $val $pt ($pt1 $expr1) ($pt2 $expr2)
             $val) )


; Create the four functions which will
; be used at run-time to evaluate the boundary conditions

( (make-bc-lambda-func ($leftb $rightb) $time-var $dbc-triples $vbc-triples
                       ($db-left $db-right
                        $vb-left $vb-right))
    (make-bc-lam $leftb $time-var $dbc-triples
                 $db-left)
    (make-bc-lam $rightb $time-var $dbc-triples
                 $db-right)
    (make-bc-lam $leftb $time-var $vbc-triples
                 $vb-left)
    (make-bc-lam $rightb $time-var $vbc-triples
                 $vb-right) )

( (make-bc-lam $pt $time-var $triples
               (lambda ($time-var v)
                        (list2vec (concat (list | $r)))))
    (filter &make-bc1-%-3 $pt $triples
            $r ()) )

( (make-bc1 $pt ($f -NONE -NONE)
            (list)) )

( (make-bc1 $pt ($f ($pt1 $expr1) -NONE)
            (if (op_eq $pt $pt1)
                (list $expr1)
              (list))) )

( (make-bc1 $pt ($f ($pt1 $expr1) ($pt2 $expr2))
            (if (op_eq $pt $pt1)
                (list $expr1)
              (list $expr2))) )

; Make various consistency checks for the PDE block


; Create a basic check: number of functions being solved for
; must match number of equations

( (make-check1 $EINFO $num-pde $num-pae $fnames
               (or- (op_eq $n $m)
                    (error2 (string "PDEBadNumEQ") $EINFO (unboxed 1))))
    (+ $num-pde $num-pae $n)
    (length $fnames $m) )


; Another basic check: number of functions must match number
; of initial conditions
;; No longer needed. Check takes place in create-pde-call
;; ( (make-check2 $init-c $fnames
;;                (or (op_eq $n $m)
;;                    (-mkError "PDEBadNumInit")))
;;     (length $init-c $n)
;;     (length $fnames $m) )

; Make a check on the boundary conditions: check that there
; are at most two for each function, and that they actually
; are at the boundaries.
( (make-bc-check $leftb $rightb $triples
                 (and- (and- 1 | $at-most-2)
                       (and- 1 | $at-boundaries)))
    (make-at-most-2-check $triples
                          $at-most-2)
    (filter &at-boundaries-%-3 ($leftb $rightb) $triples
            $at-boundaries ()) )

( (make-at-most-2-check (($f | $a) ($f | $b) ($f | $c) | $r)
                        ((error0 (string "PDETooManyBC")) | $s))
    (make-at-most-2-check $r $s) )

( (make-at-most-2-check ($x | $r)
                        $s)
    (make-at-most-2-check $r $s) )

( (make-at-most-2-check () ()) )

( (at-boundaries ($leftb $rightb) ($f $pt $expr)
                 (or- (op_eq $pt $leftb)
                      (op_eq $pt $rightb)
                      (error0 (string "PDEBCNotConsistentWithBlock")))) )


; Create interpolator lambdas

; don't need this for 12
;; special case: only one function
;( (make-pde-interp-tuple $matlist 1 $leftb $rightb $btime $etime
;                         (let ((matlist $matlist))
;                            $lambda))
;    (make-pde-interp-lambdas 0 1 $leftb $rightb $btime $etime
;                             ($lambda)) )

( (make-pde-interp-mat $matlist $n $leftb $rightb $btime $etime
                    (let ((matlist $matlist))
                      $mat))
    (make-pde-interp-lambdas 0 $n $leftb $rightb $btime $etime
                             $lambdas)
    (single-or-mat $lambdas $mat) )
    
( (make-pde-interp-lambdas $i $n $leftb $rightb $btime $etime
                           ((let ((mi (ldelem matlist (unboxed $i))))
                              (lambda (x t)
                                 (mc_pdeinterp $leftb $rightb $btime $etime
                                               mi x t)))
                            | $rest))
    (< $i $n)
    (+ $i 1 $m)
    (make-pde-interp-lambdas $m $n $leftb $rightb $btime $etime
                             $rest) )

( (make-pde-interp-lambdas $i $n $leftb $rightb $btime $etime
                           ()) )

( (make-permutation-func $fnames 
                $sorted-fnames
                (lambda (vec)
                   (let* $letbindings
                    (clr_vec (unboxed $n) (list | $fnames)))))
    (length $fnames $n)
    (nsort $fnames &lt-nt-%-2 $sorted-fnames)
    (make-pletbindings $sorted-fnames 0
                       $letbindings) )

( (make-pletbindings ($name | $r) $n
                     (($name (ldelem vec (unboxed $n))) | $bindings))
    (+ $n 1 $m)
    (make-pletbindings $r $m $bindings) )

( (make-pletbindings () $n ()) )

; Not a PDE


; Point of transition between 12 and 11.  The "trans" predicate
; is a Mathcad 12 thing, and dispatches to the older
; create-ode-solver-call which was used in 11.
( (texp (mc_odesolve ($callback $meth-num | $rest_)
                     (list | $constraints_))
         $res)
    (eliminate-top-recursion $rest_        $rest)        (!)
    (eliminate-top-recursion $constraints_ $constraints) (!) 
    (create-ode-solver-call $callback ($meth-num 1 0 0  ; the 1 is for LSPLINE
                                        | $rest)
                                      $constraints
                            $ode-call)
    (texp $ode-call
          $res) )
                          
;; Fix for bug 041229-103753
;; An ODE/PDE block never defines a recursive function.
( (eliminate-top-recursion (qualified MC_possibly_free $x) $x) )
( (eliminate-top-recursion ($x | $r) ($ex | $er))
    (eliminate-top-recursion $x $ex)
    (eliminate-top-recursion $r $er) )
( (eliminate-top-recursion $x $x) )

 

( (create-ode-solver-call $callback $args $constraints
                          $res)                                             

    (preprocess $args $constraints
                ($soln-method $R $TREE $fnames $ivar $endpt $num-steps $eqns))
    (is-string $ivar)
    (analyze-iconds $fnames $ivar $eqns
                    $iconds $rest-eqns)        
    (make-ode-omap $fnames $ivar $rest-eqns $omap)
    (analyze-eqns $omap $ivar $rest-eqns
                  $derivs $alg)
    (enough-derivs $omap $derivs)
    (no-ic-error $iconds $derivs $alg)
    (fix-deriv-rhs $omap $ivar $derivs
                   $new-derivs)    
    (check-no-fail $new-derivs)
    (make-deriv-mat $fnames $new-derivs $alg
                    $dmat $smap $alg-f)
    (perform-substitutions $ivar $smap $dmat
                           $new-dmat)
    (check-no-fail $new-dmat)
    (length $smap $num-func)
    (length $fnames $num-func)
    (length $alg $nalg)
    (make-ipoint $iconds $smap $ivar $new-dmat $alg-f 
                 $ipoint-and-ic) 
    ;(make-ic-mat $iconds $alg-f $icmat)
    ;(make-ic-check $icmat $ivar $ipoint $alg 
    ;               $ic-check)
    ;(perform-substitutions $ivar $omap $ic-check
    ;                       $new-ic-check)
    (make-sol-matrix $fnames $smap $sol-tuple)
    (make-solver-call 
       $soln-method $callback ic_mat $endpt $num-steps $ivar $new-dmat $nalg
       $solver-call)
    (postprocess (let* ((ipoint_and_ic $ipoint-and-ic)
                        (ipoint  (fst ipoint_and_ic))
                        (ic_mat  (snd ipoint_and_ic))
                        (epoint  $endpt)
                        (_reverse (op_gt ipoint epoint))
                        (_notreverse (op_gt epoint ipoint))
                        ;(ic_consistent $new-ic-check)
                        (sol $solver-call))
                      $sol-tuple)
                 $res)
)

;( (create-ode-solver-call $EINFO $args $constraints
;                      $res)
;    (!) (fail 0))

; If the above rule fails, see if we can return some
; indication of why

( (create-ode-solver-call $callback $args $constraints
                          (error0 (string "must be scalar")))

    (preprocess $args $constraints
                ($soln-method $R $TREE $fnames $ivar $endpt $num-steps $eqns))
    (not-string-t $ivar) )

( (create-ode-solver-call $callback $args $constraints
                      $res)                                             

    (preprocess $args $constraints
                ($soln-method $R $TREE $fnames $ivar $endpt $num-steps $eqns))
    (analyze-iconds $fnames $ivar $eqns
                    $iconds $rest-eqns)        
    (make-ode-omap $fnames $ivar $rest-eqns $omap)
    (analyze-eqns $omap $ivar $rest-eqns
                  $derivs $alg)
    
    (length $iconds $ninit)
    (length $alg $nalg)
    (dsum $derivs $ds)
    (+ $ds $nalg $neq)
    (report-ic-error $neq $ninit
                     $res) )

( (dsum (($f $o $e) | $derivs) $res)
    (dsum $derivs $s)
    (+ $o $s $res) )

( (dsum () 0:) )

( (report-ic-error $neq $ninit
                   (error0 (string "ODETooFewInit")))
    (< $ninit $neq) )

( (report-ic-error $neq $ninit
                   (error0 (string "ODETooManyInit")))
    (> $ninit $neq) )
    
( (no-ic-error $iconds $derivs $alg)
    (length $iconds $ninit)
    (length $alg $nalg)
    (dsum $derivs $ds)
    (+ $ds $nalg $neq) (!)
    (id $neq $ninit) )


( (count-gt-0 (($f 0:) | $r) $n)
    (count-gt-0 $r $n) (!) )

( (count-gt-0 ($p | $r) $n)
    (count-gt-0 $r $m) (!)
    (+ $m 1: $n)       (!) )

( (count-gt-0 () 0:) )


( (enough-derivs $omap $derivs)
    (count-gt-0 $omap $lo) (!)
    (length $derivs $ld)   (!)
    (id $lo $ld) )

( (preprocess ( $meth-num
                $interp-num 
                $R $TREE
                (op_matrix $r $c (list | $fnames)) $ivar $endpt | $opt) 
                $constraints
              ($meth $R $TREE $fnames $ivar $endpt $num-steps $eqns))
    (strip-to-num $meth-num $mn)
    (lookup-alist $mn ((0 mc__AdamsBDF) (1 mc_Rkadapt) (2 mc__radau) (3 mc_rkfixed))
                  $meth) (!)
    (preprocess-constraints $constraints $eqns) (!)
    (make-num-steps $endpt $opt
                    $num-steps $rest-opt) (!) )

; New in 12: single-equation ODE blocks now go through the
; ruleset.  This means we have to infer the function name.
( (preprocess ( $meth-num
                $interp-num 
                $R $TREE
                $ivar $endpt | $opt) 
                $constraints
              $res)
    (infer-ode-function-name $ivar $constraints
                             $fname) (!)
    (preprocess ( $meth-num
                  $interp-num 
                  $R $TREE
                  (op_matrix 1 1 (list $fname)) $ivar $endpt | $opt)
                  $constraints
                $res) )

( (infer-ode-function-name $ivar ($c | $constraints)
                           $fname:$t)
    (id $c (op_eq ($f:$t $pt) $expr))
    (neq-t $pt $ivar)
    (strip-tag $f  $f1)
    (strip-primes $f1 $fname) )

( (infer-ode-function-name $ivar ($c | $constraints)
                           $fname)
    (infer-ode-function-name $ivar $constraints
                             $fname) )


; In Mathcad 12, we don't need to do all the constraint
; preprocessing necessary in 11.
( (preprocess-constraints $x $x) )

( (analyze-iconds $fnames $ivar ($eq | $eqns)
                  (($f $order $point $val) | $iconds) $rest)
    (analyze-icond $fnames $ivar $eq ($f $order $point $val)) (!)
    (analyze-iconds $fnames $ivar $eqns
                    $iconds $rest)  (!) )

( (analyze-iconds $fnames $ivar ($eq | $eqns)
                  $iconds ($eq | $rest))
    (analyze-iconds $fnames $ivar $eqns
                    $iconds $rest) (!) )

( (analyze-iconds $fnames $ivar ()
                  () ()) )
    
;; Helper for create-ode-solver-call
( (make-ode-omap ($f | $fnames) $ivar $eqns
                 (($f $o) | $omap))

    (order ($f $ivar) $eqns 
           $o) (!)
    (make-ode-omap $fnames $ivar $eqns
                   $omap) (!) )

( (make-ode-omap () $ivar $eqns
                 ()) )


( (analyze-eqns $omap $ivar ($eq | $eqns)
                (($f $order $expr) | $derivs) $alg)
    (analyze-eq $omap $ivar $eq ($f $order $expr))
    (remove ($f $order) $omap $omap1)
    (analyze-eqns $omap1 $ivar $eqns
                  $derivs $alg) )

; For now, anything which isn't a differential equation
; or an initial condition will be considered an algebraic
; constraint.
( (analyze-eqns $omap $ivar ($eq | $eqns)
                $derivs ($alg-rhs | $alg))
    (analyze-alg $eq $alg-rhs)
    (analyze-eqns $omap $ivar $eqns
                  $derivs $alg) )

( (analyze-eqns $omap $ivar ()
                () ()) )


; This worked, but it turned out to be much more efficient
; to first extract the initial conditions...

; ( (analyze-block $fnames $ivar ($eq | $eqns)
;   $iconds (($f $order $expr) | $derivs) $alg)
;     (analyze-eq $fnames $ivar $eq ($f $order $expr))
;     (analyze-block $fnames $ivar $eqns
;                    $iconds $derivs $alg) )
; 
; 
; ( (analyze-block $fnames $ivar ($eq | $eqns)
;   (($f $order $point $val) | $iconds) $derivs $alg)
;     (#) (analyze-icond $fnames $ivar $eq ($f $order $point $val)) (!)
;     (analyze-block $fnames $ivar $eqns
;                    $iconds $derivs $alg) )
; 
; ; For now, anything which isn't a differential equation
; ; or an initial condition will be considered an algebraic
; ; constraint.
; ( (analyze-block $fnames $ivar ($eq | $eqns)
;   $iconds $derivs ($alg-rhs | $alg))
;     (#) (analyze-alg $eq $alg-rhs) (!)
;     (analyze-block $fnames $ivar $eqns
;                    $iconds $derivs $alg) )
; 
; ( (analyze-block $fnames $ivar ()
;                  () () ()) )
 
( (analyze-icond ($f | $fnames) $ivar $eq ($f $order $point $val))
    (analyze-icond-1 $f $ivar $eq ($f $order $point $val)) )

( (analyze-icond ($f | $fnames) $ivar $eq ($g $order $point $val))
    (analyze-icond $fnames $ivar $eq ($g $order $point $val)) )

( (analyze-icond-1 $fname $ivar (op_eq $a $val) ($fname $order $point $val))
    (is-deriv $a $fname $order $point) (!)
    (valid-icond-point $ivar $point) )

( (valid-icond-point $ivar $pt)
    (neq-t $ivar $pt) )

( (analyze-eq (($f $order) | $omap) $ivar $eq ($f $order $expr))
    (analyze-eq-1 ($f $ivar) $eq ($f $order $expr)) )

( (analyze-eq ($_          | $omap) $ivar $eq ($g $order $expr))
    (analyze-eq $omap $ivar $eq ($g $order $expr)) )

( (analyze-eq-1 ($fname $ivar) $eq ($fname $order $expr))
    (order ($fname $ivar) $eq $order)
    (> $order 0:)
    (make-deriv $fname $order $ivar $d)

    (solve $d $eq $expr)
    
    (!)
)
    
( (analyze-alg (op_eq $a $b) (op_sub $a $b)) )

( (make-ic-mat $iconds $alg-f (op_matrix (unboxed $r) (unboxed 1)
                                         (list | $icexpr)))
    (sort-lists-2 $iconds $ics)
    (move-to-end $alg-f $ics $ics1)
    (lists-nth 3: $ics1 $icexpr)
    (length $icexpr $r) )

( (mov-e-1 $f (($f $o $p $e) | $r)
           $res)
    (append ($r (($f $o $p $e))) $res) )

( (mov-e-1 $f (($g $o $p $e) | $r)
           (($g $o $p $e) | $r1))
    (mov-e-1 $f $r $r1) )

( (mov-e-1 $f ()
           ()) )

( (move-to-end ($f | $r) $ic
               $res)
    (mov-e-1 $f $ic $ic1)
    (move-to-end $r $ic1 $res) )

( (move-to-end () $ic
               $ic) )


; if there's only one initial condition, no need for
; a consistency check
( (make-ipoint $iconds $smap $new-dmat $alg-f
    $pt)
    (lists-nth 2: $iconds ($pt)) (!) )

( (make-ipoint $iconds $smap $ivar $new-dmat $alg-f
      (let* ((ic_triples    $ic-triples)
             (num_ic        (iv (length ic_triples)))
             (num_cols      $num-cols)
             (ic_points     $ic-points)
             (num_missing   $num-missing)
             (num_ic_points (iv (length ic_points))))
        (seq $ic-checks
          (if (op_eq num_ic_points 1)
              (tuple (head ic_points) $icmat)
            ;; num_ic_points must be 2 in this case
            (tuple (head ic_points)
                   $sbval-call)))))
    (make-ic-triples  $iconds $smap $ic-triples) (!)
    (make-num-cols    $new-dmat $num-cols) (!)
    (make-ic-points   $ic-points) (!)
    (make-num-missing $num-missing) (!)   
    (make-ic-checks   $ic-checks) (!)
    (make-ic-mat      $iconds $alg-f $icmat) (!)
    (make-sbval-call  (lambda ($ivar y) $new-dmat) $sbval-call) (!) )

; Helpers for make-ipoint...

( (make-ic-triples $iconds $smap
                   (list | $triples) )
    (sort-lists-2 $iconds $ics)
    (make-ic-triples-i $ics $smap $triples) )

( (make-ic-triples-i (($f $o $p $v) | $r) $smap
                     ((tuple $n $p $v) | $mr))
    (lookup-alist $f $smap ($m $_))
    (+ $m $o $n)
    (make-ic-triples-i $r $smap $mr) )

( (make-ic-triples-i () $smap ()) )


( (make-num-cols (op_matrix (unboxed $r) (unboxed 1) | $s) $r) )

( (make-num-missing
    (let ((f (lambda (i c)
               (if (op_eq i (iv (length ic_triples)))
                   c
                 (if (op_eq (tsnd (nth (as_i4 i) ic_triples))
                            (head ic_points))
                     (f (op_add i 1) c)
                   (f (op_add i 1) (op_add c 1)))))))
      (f 0 0))) )

( (make-ic-points (remove_duplicates 
                    (sort_list (lambda (x y) (as_bool (op_lt x y)))
                               (map tsnd ic_triples)))) )


( (make-ic-checks (seq (if (op_gt num_ic_points 2)
                           (error0 (string "ODEInconsistentInitCond"))
                           Null)
                  (seq (if (op_lt num_ic num_cols)
                           (error0 (string "ODETooFewInit"))
                           Null)
                  (seq (if (op_gt num_ic num_cols)
                           (error0 (string "ODETooManyInit"))
                           Null)
                       ;; Check to see if an initial condition has
                       ;; been specified more than once for a given
                       ;; function at a given point (e.g. y(0)=0, y(0)=1).
                       (let ((f (lambda (x ic_triples)
                                  (if (op_eq (iv (length ic_triples)) 0)
                                      Null
                                  (let ((y (head ic_triples)))
                                    (if (and-
                                          (op_eq (tfst x) (tfst y))
                                          (op_eq (tsnd x) (tsnd y)))
                                        (error0
                                           (string "ODEInconsistentInitCond"))
                                        (f y (tail ic_triples))))))))
                          (f (head ic_triples) (tail ic_triples))))))) )


( (make-sbval-call $dfunc
    (let* ((b0 (head ic_points))           
           (b1 (head (tail ic_points)))
           (load (lambda (x1 v)
                   (let* ((f1 (lambda (i)
                               (if (op_eq i (iv (length ic_triples)))
                                 (list)
                                (let ((trip (nth (as_i4 i) ic_triples)))
                                  (if (op_eq (tsnd trip) b0)
                                      (cons trip (f1 (op_add i 1)))
                                    (f1 (op_add i 1)))))))
                          (f2 (lambda (atb0 i c)
                               (if (op_eq i (iv (length ic_triples)))
                                   (list)
                                (if (or (op_eq (iv (length atb0)) 0)
                                        (op_lt i (tfst (head atb0))))
                                    (cons (subscript v (op_add c mc_ORIGIN))
                                      (f2 atb0 (op_add i 1) (op_add c 1)))
                                  (cons (ttrd (head atb0))
                                        (f2 (tail atb0) (op_add i 1) c)))))))
                       (list2vec (f2 (f1 0) 0 0)))))
           (score (lambda (x2 y)
                   (let ((f (lambda (i)
                             (if (op_eq i (iv (length ic_triples)))
                                 (list)
                              (let ((trip (nth (as_i4 i) ic_triples)))
                                (if (op_eq (tsnd trip) b1)
                                    (cons (op_sub 
                                             (subscript y (op_add (tfst trip)
                                                                  mc_ORIGIN))
                                             (ttrd trip))
                                          (f (op_add i 1)))
                                  (f (op_add i 1))))))))
                      (list2vec (f 0))))))
       (load 
          b0
          ((qualified MC_mc mc_sbval)
            (replicateM 0 (as_i4 num_missing)) b0 b1 $dfunc load score))))
)
    
;;@@ Chahid 11/10/04
;; this logic is bad and can lead to huge num_steps; I have seen a case with
;; endpt = 20000 and ipoint = 0; This logic would compute 200,000 solution points!
;; I think we should make the num-steps independent of the problem end points. 
;; A good pick is 1000 solution points. The user can always overwite the default.   

;;( (make-num-steps $endpt () 
;;                  $max ())
;;    (id $max (mc_max 100 (mc_trunc 
;;                           (op_mult 10 (op_abs (op_sub $endpt ipoint)))))) )

( (make-num-steps $endpt () 
                  1000 ()) )

( (make-num-steps $endpt ($num-steps | $rest)
                  $num-steps $rest) )


; Make a consistency check for the algebraic constraints,
; if any.

; always succeed if no alg. constraints
( (make-ic-check $icmat $ivar $ipoint ()
                 1:) )

( (make-ic-check $icmat $ivar $ipoint $alg
                 ((lambda (y $ivar) (or- (and- | $tests)
                                      (error0 
                                        (string "ODEAlgInconsistentAtIP"))))
                  $icmat $ipoint))
    (make-alg-tests $alg $tests) )

( (make-alg-tests ($c | $r)
                  ($tc | $tr) )
    (make-alg-test $c $tc)  (!)
    (make-alg-tests $r $tr) (!) )

( (make-alg-tests () ()) )

( (make-alg-test $expr
                 (op_lt (op_abs $expr) mc_CTOL)) )

; Make the matrix of derivatives and algebraic constraints.
; Also return an assoc-list mapping each function to
; its position in the solution vector.
; The function names are needed because there may be
; algebraic constraints.
( (make-deriv-mat $fnames $derivs $alg
                  (op_matrix (unboxed $r) (unboxed 1) 
                             (list | $all-expr)) $smap $alg-f)
    (sort-lists-2 $derivs $ds) (!)
    (divide-nth 0: $ds $blocks) (!)
    (fill-blocks 0: $blocks $blocks-filled) (!)
    (sort $fnames $fnames-sorted) (!)
    (make-smap 0: $fnames-sorted $blocks-filled $smap () $alg-f) (!)
    (append $blocks-filled $dsf) (!)
    (lists-nth 2: $dsf $dexpr) (!)
    (length $dexpr $ld) (!)
    (append ($dexpr $alg) $all-expr) (!)
    (length $all-expr $r) (!)
)


( (fill-blocks $offset ($b | $r) ($b1 | $r1))
    (fill-block $offset 1: $b $b1)
    (length $b1 $len)
    (+ $offset $len $new-offset)
    (fill-blocks $new-offset $r $r1) )

( (fill-blocks $offset () ()) )


( (fill-block $offset $n ()
              ()) )

( (fill-block $offset $n (($f $n $expr) | $derivs)
              (($f $n $expr) | $res))
    (+ 1: $n $m)
    (fill-block $offset $m $derivs $res) )

( (fill-block $offset $n (($f $n1 $e1) | $derivs)
              (($f $n $e) | $res))
    (> $n1 $n)
    (+ $offset $n $noff)
    (make-dmat-entry $f $noff $e)
    (+ 1: $n $m)
    (fill-block $offset $m (($f $n1 $e1) | $derivs) $res) )


( (make-smap $n ($f | $fnames) ($b | $blocks)
                (($f ($n $len)) | $res) () $alg-f)
    (length $b $len)
    (+ $n $len $m)
    (bfunc $b $f)
    (make-smap $m $fnames $blocks
               $res () $alg-f) )

( (make-smap $n ($g | $fnames) ($b | $blocks)
                $res () $alg-f)
    (append ($fnames ($g)) $nfnames)
    (make-smap $n $nfnames ($b | $blocks)
               $res () $alg-f) )

( (make-smap $n () ()
             () () ()) )

( (make-smap $n ($f | $fnames) ()
             $res () ($f | $fnames))
    (make-smap $n () ()
               $res ($f | $fnames) ()) )

; This clause handles algebraic constraints... they're
; all that should be left at this point
( (make-smap $n () ()
             (($f ($n 1:)) | $res) ($f | $alg) ())
    (+ $n 1: $m)
    (make-smap $m () ()
               $res $alg ()) )



( (bfunc (($f | $r) | $r1) $f) )

( (make-dmat-entry $f $n (subscript y (op_add $n mc_ORIGIN))) )


; If the highest-order derivative of a function being
; solved for appears on the right-hand side, we may
; be able to fix this.
( (fix-deriv-rhs $omap $ivar $derivs
                 $new-derivs)
    (length $derivs $n)
    (!)
    (try-fix $n $omap $ivar () $derivs
                      $new-derivs $new-rest)
    (!)
    (id $new-rest ()) )


( (try-fix 0: $omap $ivar $fixed $rest
                          $fixed $rest) )

( (try-fix $n $omap $ivar $fixed ()
                          $fixed ()) )

( (try-fix $n $omap $ivar $fixed $rest
           $new-fixed $new-rest)
    (fix-deriv-rhs-1 $omap $ivar $fixed $rest
                     $nrest) 
    (find-needs-fix $omap $ivar $fixed $nrest
                    $new-fixed-1 $new-rest-1)
    (+ $m 1: $n)
    (!)
    (try-fix $m $omap $ivar $new-fixed-1 $new-rest-1
                      $new-fixed $new-rest) (!) )

( (find-needs-fix $omap $ivar $accum (($f $o $e) | $needs-fix)
                  $new-accum (($f $o $e) | $new-needs-fix))
    (needs-fix $omap $ivar $e)
    (find-needs-fix $omap $ivar $accum $needs-fix
                    $new-accum $new-needs-fix) )

( (find-needs-fix $omap $ivar $accum (($f $o $e) | $needs-fix)
                  (($f $o $e) | $new-accum) $new-needs-fix)
    (find-needs-fix $omap $ivar $accum $needs-fix
                    $new-accum $new-needs-fix) )

( (find-needs-fix $omap $ivar $accum ()
                  $accum ()) )

( (needs-fix $omap $ivar $d)
    (is-deriv $d $fname $n $ivar)      (!)
    (> $n 0:)                          (!)
    (lookup-alist $fname $omap $n)     (!) )

( (needs-fix $omap $ivar ($a | $b))
    (needs-fix $omap $ivar $a) (!) )

( (needs-fix $omap $ivar ($a | $b))
    (needs-fix $omap $ivar $b) (!) )


( (fix-deriv-rhs-1 $omap $ivar $fixed (($f $o $e) | $needs-fix)
                   (($f $o $e1) | $rest))
    (fix-deriv-rhs-1-helper $omap $ivar $fixed ($f $o $e)
                            ($f $o $e1))
    (fix-deriv-rhs-1 $omap $ivar $fixed $needs-fix
                     $rest) )

( (fix-deriv-rhs-1 $omap $ivar $fixed () ()) )


( (fix-deriv-rhs-1-helper $omap $ivar $fixed ($fname $order $expr)
                          ($fname $order $new-expr))
    (map-rec &fix-deriv-do-subs-1-%-3 ($omap $ivar $fixed) $expr
                                      $new-expr) (!) )

( (fix-deriv-do-subs-1 ($omap $ivar $fixed) $d
                       $res)
    (is-deriv $d $fname $n $ivar) (!)
    (lookup-deriv ($fname $n) $fixed
                  $res) (!) )
    

( (lookup-deriv ($fname1 $order) (($fname2 $order $expr) | $r)  
                $expr) 
    (id-t $fname1 $fname2) )

( (lookup-deriv ($fname $order) (($g $o $expr) | $r)
                $res)
    (lookup-deriv ($fname $order) $r
                  $res) )


( (perform-substitutions $ivar $smap $d
                         $subscript)
    (is-deriv $d $fname $n $ivar)
    (lookup-alist $fname $smap ($o $bound)) (!)
    (make-subscript $bound $o $n $subscript) (!) )

( (make-subscript $bound $o $n 
                  (subscript y (op_add $m mc_ORIGIN)))
    (> $bound $n)
    (+ $o $n $m) )

( (make-subscript $bound $o $n 
                  -FAIL) )

( (perform-substitutions $ivar $smap (lambda $bvs $body)
                         (lambda $bvs $sbody))
    (perform-substitutions $ivar $smap $body
                           $sbody) (!) )

( (perform-substitutions $ivar $smap ($x | $r)
                         ($x1 | $r1))
    (perform-substitutions $ivar $smap $x $x1) (!)
    (perform-substitutions $ivar $smap $r $r1) (!) )
    

( (perform-substitutions $ivar $smap $x
                         $x) )


( (check-no-fail ($x | $r))
    (check-no-fail $x) (!)
    (check-no-fail $r) (!) )

( (check-no-fail ()) )

( (check-no-fail $x)
    (atom $x)
    (!= $x -FAIL) )

( (make-sol-matrix $fnames $smap $tm)
    (make-sol-entries $fnames $smap $s) (!)
    (single-or-mat $s $tm) (!) )

( (single-or-mat ($x) $x) )

( (single-or-mat ($x | $r) (op_matrix (unboxed $n) (unboxed 1) (list $x | $r)))
    (length ($x | $r) $n) )

( (make-sol-entries ($f | $fnames) $smap ($s | $r))
    (make-interp $f $smap $s) (!)
    (make-sol-entries $fnames $smap $r) (!) )

( (make-sol-entries () $smap ()) )

( (make-interp $f $smap
               (let* ((c0   (op_matcol sol mc_ORIGIN))
                      (c00  (if _reverse (vectorize_1 op_negate c0) c0))
                      (fr   (if _reverse op_negate id))
                      (cn   (op_matcol sol (op_add $n mc_ORIGIN)))
                      (imat (mc_lspline c00 cn)))
                 (lambda (x) 
				    (if  (and- (and- (op_leq x ipoint) (op_geq x epoint)) _reverse)
				       (mc_interp imat c00 cn (fr x))
				       (if  (and- (and- (op_leq x epoint) (op_geq x ipoint)) _notreverse)
				       (mc_interp imat c00 cn (fr x))
					    (error0 (string "ODECannotExtrapolate")))))))
    (lookup-alist $f $smap ($o $_)) (!)
    (+ $o 1: $n) 
	)


; For the -radau solver, we ignore the number of steps, but
; do permit the number of algebraic constraints to be nonzero
;( (make-solver-call mc__radau $callback $icmat $endpt $numsteps 
;                              $ivar $mat $nalg
;         (mc__radau $icmat
;                    ipoint
;                    $endpt
;                    0
;                    $nalg
;                    (lambda ($ivar y) $mat)
;                    mc_TOL
;                    $max
;                    (op_div (op_abs (op_sub $endpt ipoint)) 1000)))
;    (id $max (mc_max 1000
;                     (mc_trunc (op_mult 1000
;                                        (op_abs (op_sub $endpt ipoint)))))) )

;;@@ Chahid 11/10/04
;;the logic used with mc__radau above to ignore num-steps and control get_solution() with kmax and save 
;;(last two args) is flawed. Dpending on problem end points, it may cause the solution to be filtered  
;;out compeletely or filtered in inadequately causing the subsequent call to lspline to fail or produce
;;bad results. The logic used with the mc_Radau based on passing on num-steps is correct and I have applied
;;it to mc__radau. I set the default num-steps to 1000 (the user can always overwrite this optional value and 
;;he should. This have helped fix Bugs #: 040723-152637 and  #: 031105-092811.

( (make-solver-call mc__radau $callback $icmat $endpt $numsteps 
                              $ivar $mat $nalg
         (mc__radau $icmat
                    ipoint
                    $endpt
                    0
                    $nalg
                    (lambda ($ivar y) $mat)
                    mc_TOL
                    $numsteps)) )



; For any other solver, the number of algebraic constraints must
; be zero.
( (make-solver-call $soln-method $callback $icmat $endpt $numsteps 
                                 $ivar $mat 0:
                    ($soln-method $icmat
                                  ipoint
                                  $endpt
                                  $numsteps
                                  (lambda ($ivar y) $mat))) )

; If the number of algebraic constraints isn't zero, and we're
; not using the -radau method, we switch to the -radau method.
; This fixes bug 021106-094045.
( (make-solver-call 
                $soln-method $callback $icmat $endpt $numsteps $ivar $mat $nalg
                (seq ($callback (unboxed 2)) ; 2 for -radau
                     $res))
    (make-solver-call mc__radau $callback $icmat $endpt $numsteps       
                                $ivar $mat $nalg
                      $res) )

;( (make-max $exprs
;            (mc_max (clr_vec (unboxed $n) (list | $exprs))))
;    (length $exprs $n) )
    

( (strip-progn (progn $expr) 
               $expr) (!) )
( (strip-progn ($op (lambda $bvs (progn $body)) | $r)
               ($op (lambda $bvs $body) | $r)) (!) )

( (is-deriv ($op (lambda ($_) ($fname $_)) $point)
            $fname $order $point)
    (lookup-deriv $op $order) )

( (is-deriv ($fprime:$t $point)
            $fname:$t $order $point)
    (count-primes $fprime $order) 
    (strip-primes $fprime $fname) )

( (is-deriv (-deriv $fname $order $point)
            $fname $order $point) )

( (is-deriv $expr
            $fname $order $point)
    (strip-progn $expr $expr1)
    (is-deriv $expr1 $fname $order $point) )


( (make-deriv $fname $order $point
              (-deriv $fname $order $point)) )

( (lookup-deriv op_deriv_1 1:) )
( (lookup-deriv op_deriv_2 2:) )
( (lookup-deriv op_deriv_3 3:) )
( (lookup-deriv op_deriv_4 4:) )
( (lookup-deriv op_deriv_5 5:) )

( (count-primes $fprime $n)
    (strip-tag $fprime $fprime1) (!)
    (count-primes-1 $fprime1 $n) )

( (count-primes-1 $fprime $n)
    (strcat $f1 "_27_": $fprime) (!)
    (count-primes-1 $f1 $m)      (!)
    (+ $m 1: $n)                 (!)
)

( (count-primes-1 $f 0:) )

( (strip-primes $fprime $fname)
    (strip-tag $fprime $fprime1) (!)
    (strip-primes-1 $fprime1 $fname) )

( (strip-primes-1 $fprime $fname)
    (strcat $f1 "_27_": $fprime)
    (strip-primes-1 $f1 $fname) )

( (strip-primes-1 $f $f) )


( (order ($fname $ivar) $d $n)
    (order-i ($fname $ivar) $d $n)
    (!) )

( (order-i ($fname $ivar) $d $n)
    (is-deriv $d $fname $n $ivar) )

( (order-i ($fname $ivar) ($a | $b) $n)
    (order ($fname $ivar) $a $oa)
    (order ($fname $ivar) $b $ob)
    (max ($oa $ob) $n) )

( (order-i $e $x -1:) )


( (max ($a $b) $a)
    (> $a $b) )

( (max ($a $b) $b) )

; Solve for a subexpression, given an equality

( (solve $e (op_eq $a $b) $res)
    (solve $e $a $b $res) )

; Given that two expressions are equal, solve
; for a subexpression of one of them.

( (solve $v $v1 $rhs $rhs)
    (equiv $v $v1) )
( (solve $v $lhs $v1 $lhs)
    (equiv $v $v1) )

( (equiv $v1 $v2)
    (id-t $v1 $v2) )
( (equiv $v $w)
    (is-deriv $v $fname $order $pt)
    (is-deriv $w $fname $order $pt) )

( (equiv $v $w)
    (pderiv $f1 $var1 $order $args1 $v)
    (pderiv $f2 $var2 $order $args2 $w) 
    (id-t $f1 $f2)
    (id-t $var1 $var2)
    (id-t-lists $args1 $args2) )

( (solve $v (op_add $a $b) $rhs $res)
    (solve $v $a (op_sub $rhs $b) $res) )
( (solve $v (op_add $a $b) $rhs $res)
    (solve $v $b (op_sub $rhs $a) $res) )

( (solve $v (op_sub $a $b) $rhs $res)
    (solve $v $a (op_add $rhs $b) $res) )
( (solve $v (op_sub $a $b) $rhs $res)
    (solve $v $b (op_sub $a $rhs) $res) )

( (solve $v (op_mult $a $b) $rhs $res)
    (solve $v $a (op_div $rhs $b) $res) )
( (solve $v (op_mult $a $b) $rhs $res)
    (solve $v $b (op_div $rhs $a) $res) )

( (solve $v (op_div $a $b) $rhs $res)
    (solve $v $a (op_mult $rhs $b) $res) )
( (solve $v (op_div $a $b) $rhs $res)
    (solve $v $b (op_div $a $rhs) $res) )

( (solve $v (op_negate $a) $rhs $res)
    (solve $v $a (op_negate $rhs) $res) )

; Sorting

; New sort, now that the comparison predicate can be passed
; as an argument


( (nsort ($x | $r) $cmp
         $res)
    (nsplit $x ($x | $r) $cmp $less $equal $greater) (!)
    (nsort $less $cmp $a) (!)
    (nsort $greater $cmp $b) (!)
    (append ($a $equal $b) $res) (!) )

( (nsort () $cmp ()) )


( (nsplit $x ($y | $r) $cmp ($y | $less) $equal $greater)
    ($cmp $y $x)
    (nsplit $x $r $cmp $less $equal $greater) (!) )

( (nsplit $x ($y | $r) $cmp $less $equal ($y | $greater))
    ($cmp $x $y)
    (nsplit $x $r $cmp $less $equal $greater) (!) )

( (nsplit $x ($y | $r) $cmp $less ($y | $equal) $greater)
    (nsplit $x $r $cmp $less $equal $greater) (!) )

( (nsplit $x () $cmp () () ()) )

; Zip

( (zip $pred $pred-args ($x | $r) ($y | $s)
       ($z | $rest ))
    ($pred $pred-args $x $y
           $z)
    (zip $pred $pred-args $r $s
         $rest) )

( (zip $pred $pred-args () ()
       ()) )


           
; Sort a list of lists lexicographically based on
; the first two elements of each list

( (sort-lists-2 ($x | $r) $res)
    (split-lists-2 $x ($x | $r) $less $equal $greater)
    (sort-lists-2 $less $a)
    (sort-lists-2 $greater $b)
    (append ($a $equal $b) $res) )

( (sort-lists-2 () ()) )


( (split-lists-2 $x ($y | $r) ($y | $less) $equal $greater)
    (greater-lists-2 $x $y)
    (split-lists-2 $x $r $less $equal $greater) )

( (split-lists-2 $x ($y | $r) $less $equal ($y | $greater))
    (greater-lists-2 $y $x)
    (split-lists-2 $x $r $less $equal $greater) )

( (split-lists-2 $x ($y | $r) $less ($y | $equal) $greater)
    (split-lists-2 $x $r $less $equal $greater) )

( (split-lists-2 $x () () () ()) )

( (greater-lists-2 ($x $y1 | $r1) ($x $y2 | $r2) )
    (gt-nt $y1 $y2) )

( (greater-lists-2 ($x1 $y1 | $r1) ($x2 $y2 | $r2) )
    (gt-nt $x1 $x2) )

; Find the nth element of a list

( (nth 0: ($x1 | $r) $x2)
    (id-t $x1 $x2) )

( (nth $n ($x | $r) $y) 
    (+ $m 1: $n)
    (nth $m $r $y) )

; The "nth" predicate above isn't reversible -- given
; a list and an item, you can't find the item's index.
; So...

( (nth-rev 0: ($x1 | $r) $x2)
    (id-t $x1 $x2) )

( (nth-rev $n ($x | $r) $y)
    (nth-rev $m $r $y)
    (+ $m 1: $n) )

    
; Extract the $n-th element from each list in a list of lists
; and return the result
( (lists-nth $n ($l | $lists) ($x | $r))
    (nth $n $l $x)
    (lists-nth $n $lists $r) )
    
( (lists-nth $n () ()) )


( (lookup-alist $f1 (($f2 $o) | $r) $o)
    (id-t $f1 $f2) (!) )

( (lookup-alist $f ($pair | $r) $o)
    (lookup-alist $f $r $o) (!) ) 

( (zip ($x | $r) ($y | $s) (($x $y) | $rs))
    (zip $r $s $rs) )

( (zip () () ()) )


; Test for membership in a list
; Takes three arguments so as to be usable with map-collect

( (has ($x1 | $r) $x2 $x2)
    (id-t $x1 $x2) )

( (has ($y | $r) $x $x) 
    (has $r $x $x) )

; Another way to test for membership in a list
; Result is () if element is not found

( (member $x1 ($x2 | $r) $x1)
    (id-t $x1 $x2) )
( (member $y ($x | $r) $res)
    (member $y $r $res) )
( (member $x () ()) )


; Divide a list of lists according to the nth
; element of each list
( (divide-nth $n ($l | $s)
              $res)
    (nth $n $l $x)
    (divide-nth-i $x $n ($l | $s)
                  $res) )

( (divide-nth-i $x $n ($l | $s) 
                $res1)
    (nth $n $l $x)
    (divide-nth-i $x $n $s
                  $res)
    (push-into-1st-block $l $res
                         $res1) )

( (divide-nth-i $x $n ($l | $s) 
                $res1)
    (nth $n $l $y)
    (divide-nth-i $y $n ($l | $s)
                  $res)
    (push-empty-block $res
                      $res1) )

( (divide-nth-i $x $n ()
                (())) )                    

( (push-into-1st-block $l ($ll | $s)
                       (($l | $ll) | $s)) )

( (push-empty-block $s
                    (() | $s)) )


; Repeat a certain string

( (repeat $str $n $res)
    (> $n -1:)   ; important -- without this, backtracking into
                 ; the "repeat" predicate could lead to an
                 ; infinite loop
    (+ $m 1: $n)
    (repeat $str $m $r1)
    (strcat $r1 $str $res) )

( (repeat $str 0: "":) )


( (postprocess $x $y)
    (ppr $x $y) (!) )

( (ppr (let* ($b | $bindings) $body)
       (let ($b1) $expr) )
    (ppr $b $b1)
    (ppr (let* $bindings $body) $expr) )

( (ppr (let* () $body)
       $expr)
    (ppr $body $expr) )

( (ppr ($x | $r) $res)
    (ppr-each ($x | $r) $res) )

( (ppr $x $x) )

( (ppr-each ($x | $r) ($x1 | $r1))
    (ppr $x $x1)
    (ppr-each $r $r1) )

( (ppr-each () ()) )
