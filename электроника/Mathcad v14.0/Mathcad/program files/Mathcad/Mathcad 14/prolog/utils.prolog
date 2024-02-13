;;********* Copyright © Parametric Technology Corporation. All rights reserved
;;*
;;*
;;*  Version : $Header: /MathcadClient/releases/Mathcad_14.0.1/eng/mctranslator/prolog/utils.prolog   42   2007-05-24 18:34:13-04:00   ltravis $
;;*
;;*
;;*  Purpose : Implements various generally useful supporting predicates.
;;*
;;*
;;*  Comments: This file uses a tab size of 3 spaces.
;;*
;;*
;;****************************************************************************

;;****************************************************************************
;;* NOT predicate x
;;*
;;* Succeed if applying the given predicate on 'x' fails.

( (not $pred $x) 
	
	($pred $x) (!)
	(fail 0)
	)

( (not $pred $x) )

;;****************************************************************************
;;* NOT2 predicate x y
;;*
;;* Succeed if applying the given predicate on 'x' and 'y' fails.

( (not2 $pred $x $y) 
	
	($pred $x $y) (!)
	(fail 0)
	)

( (not2 $pred $x $y) )

;;****************************************************************************
;;* ID x y
;;* = x y
;;*
;;* Succeed if 'x' and 'y' are identical. Consider renaming to '='.

( (id $x $x) )
( (= $x $x) )

;;****************************************************************************
;;* NEQ x y
;;* != x y
;;*
;;* Succeed if 'x' and 'y' are different. Consider renaming to '!='.

( (neq $x $y) (not2 &id-%-2 $x $y) )
( (!= $x $y) (not2 &=-%-2 $x $y) )

;;****************************************************************************
;;* < x y
;;*
;;* Succeed if 'x' is less than 'y'.

( (< $x $y) (> $y $x) )

;;****************************************************************************
;;* >= x y
;;*
;;* Succeed if 'x' is greater than or equal to 'y'.

( (>= $x $x) )
( (>= $x $y) (> $x $y) )

;;****************************************************************************
;;* <= x y
;;*
;;* Succeed if 'x' is less than or equal to 'y'.

( (<= $x $x) )
( (<= $x $y) (> $y $x) )

;;****************************************************************************
;;* LENGTH list length
;;*
;;* Succeed if 'list' is a list of the given length.

( (length ($x | $xs) $length)

   (length $xs $n) (!)                                   ; Length of the tail
   (+ $n 1: $length)                                     ; Then add one to it
   )

( (length () 0:) )                                       ; The empty list = 0

;;****************************************************************************
;;* MEMBER element list
;;*
;;* Succeed if 'element' is an element of the given list.

( (member $x $list) (member-p &id-%-2 $x $list) )

;;****************************************************************************
;;* MEMBER-P predicate element list
;;*
;;* Succeed if 'element' is an element of the given list as determined by 
;;* the given predicate.

( (member-p $eq $x ($h | $_)) 
 
	($eq $x $h) 
	)

( (member-p $eq $x ($_ | $t)) 
	
	(member-p $eq $x $t) 
	)

;;****************************************************************************
;;* LOOKUP key key-list value-list result
;;*
;;* Succeeds if result is the value in 'value-list' corresponding to 
;;* the first occurrance of 'key' in 'key-list'

( (lookup $k $ks $vs $res) 
 
	(lookup-p &id-%-2 $k $ks $vs $res) 
	)

;;****************************************************************************
;;* LOOKUP-P predicate key key-list value-list result
;;*
;;* Succeeds if result is the value in 'value-list' corresponding to 
;;* the first occurrance of key in 'key-list' for which 'predicate' 
;;* applied to that key succeeds

( (lookup-p $eq $k ($h | $_) ($res | $__) $res) 
	
	($eq $k $h) 
	)

( (lookup-p $eq $k ($_ | $ks) ($__ | $vs) $res)
	
	(lookup-p $eq $k $ks $vs $res) 
	)

;;****************************************************************************
;;* ASSOC-P predicate args map result
;;*
;;* The 'map' is a list of (key value) pairs.  Succeed if result is the value
;;* associated to the first key for which 'predicate' applied to 'args' and
;;* that key succeeds.

( (assoc-p $pred $args (($key $res) | $t) $res)
	
	($pred $args $key) 
	)

( (assoc-p $pred $args ($_ | $t) $res)

	(assoc-p $pred $args $t $res) 
	)
	
;;****************************************************************************
;;* CONCAT list-1 list-2 result
;;*
;;* Succeed if 'result' is the concatenation of lists 'list-1' and 'list-2'.

( (concat ($x | $xs) $y
          ($x | $z))

   (concat $xs $y $z) (!)
   )

( (concat () $y $y) )

;;****************************************************************************
;;* APPEND lists result
;;*
;;* Succeed if 'result' is the concatenation of the lists in 'lists'.

( (append ($l | $r) $result)

   (append $r $s) (!)
   (concat $l $s $result) (!)
   )

( (append () ()) )

;;****************************************************************************
;;* LAST list element
;;*
;;* Succeed if 'element' is the final element of the given list.

( (last ($x) $x) )

( (last ($x | $xs) $y)

   (last $xs $y)
   )

;;****************************************************************************
;;* RM-LAST list result
;;*
;;* Succeed if 'result' is the list obtained by removing the final element of
;;* the given list.

( (rm-last ($x) ()) )

( (rm-last ($x | $xs)
           ($x | $z))

   (rm-last $xs $z)
   )

;;****************************************************************************
;;* REMOVE-DUPLICATES
;;*
;;* Succeed if 'result' is the same as 'list' with repeated elements removed.

( (remove-duplicates ($x | $xs) $ys)

   (member $x $xs)
   (remove-duplicates $xs $ys)
   )

( (remove-duplicates ($x | $xs) $res)

   (remove-duplicates $xs $ys)
   (id $res ($x | $ys))
   )

( (remove-duplicates () () ) )

;;****************************************************************************
;;* REMOVE
;;*
;;* Succeed if 'result' is the same as 'list' with the given element removed.

( (remove $x ($x | $xs) $ys)

   (remove $x $xs $ys) (!)
   )

( (remove $x ($y | $xs) ($y | $ys))

   (remove $x $xs $ys)  (!)
   )

( (remove $x () () ) )

;;****************************************************************************
;;* REVERSE list result
;;*
;;* Succeed if 'result' is the reverse of 'list.

( (reverse $x $y)

   (reverse- $x $x () $y $y ())
   )

( (reverse- $a ($x | $r) $t1 $b ($y | $s) $t2)

   (reverse- $a $r ($x | $t1) $b $s ($y | $t2))
   )

( (reverse- $a () $b $b () $a) )

;;****************************************************************************
;;* COLLECT predicate accumulator x result
;;*
;;*

( (collect $pred $accum $x
           ($x | $accum) )

   ($pred $x) (!)
   (id 1: 1:)                                            ; workaround WAM bug
   )

( (collect $pred $accum ($x | $r)
                 $accum2)

   (collect $pred $accum  $r $accum1) (!)
   (collect $pred $accum1 $x $accum2) (!)
   )

( (collect $pred $accum $x $accum) )

;;****************************************************************************
;;* MAP-ACCUM
;;*
;;*

( (map-accum $pred $pred-args ($x | $r) $accum
             $res)

   (map-accum $pred $pred-args $r $accum $res1) (!)
   ($pred $pred-args $x $res1 $res) (!)
   (id 1: 1:)                                            ; workaround WAM bug
   )

( (map-accum $pred $pred-args () $accum $accum) )

;;****************************************************************************
;;* COMPARE-FIRST list1 list 2
;;*
;;* Succeed if the first element of 'list' compares less than the of 'list2'.

( (compare-first ($x | $xs) ($y | $ys))

   (lt-nt $x $y)                                         ; Compare elements
   )

;;****************************************************************************
;;* SORT list result
;;*
;;* Succeed if the list 'result' is a sorted version of the given list.

( (sort ($x | $r) $res)

   (split $x ($x | $r) $less $equal $greater) (!)
   (sort $less $a) (!)
   (sort $greater $b) (!)
   (append ($a $equal $b) $res) (!)
   )

( (sort () ()) )


( (split $x ($y | $r) ($y | $less) $equal $greater)

   (gt-nt $x $y)
   (split $x $r $less $equal $greater) (!)
   )

( (split $x ($y | $r) $less $equal ($y | $greater))

   (gt-nt $y $x)
   (split $x $r $less $equal $greater) (!)
   )

( (split $x ($y | $r) $less ($y | $equal) $greater)

   (split $x $r $less $equal $greater) (!)
   )

( (split $x () () () ()) )

;;****************************************************************************
;;* tag-aware variants of some of the above predicates.

( (neq-t $x $y) (not2 &id-t-%-2 $x $y) )

( (not-string-t $x) (not &is-string-%-1 $x) )

( (id-t $x $y)
   (id $x $y) (!))
( (id-t $x $y)
   (strip-tag $x $x1) (!)
   (strip-tag $y $y1) (!)
   (id $x1 $y1))

( (id-t-lists ($x | $r) ($y | $s))
   (id-t $x $y) (!)
   (id-t-lists $r $s) (!))
( (id-t-lists () ()) )

;; greater-than, ignores tags
( (gt-nt $xt $yt)
    (strip-tag $xt $x) (!)
    (strip-tag $yt $y) (!)
    (> $x $y) )

;; less-than, ignore tags
( (lt-nt $xt $yt)
   (strip-tag $xt $x) (!)
   (strip-tag $yt $y) (!)
   (< $x $y) )

; strip tag(s) off something
( (strip-tag $x:$t $y)
    (strcat "-": $y $x) )
( (strip-tag $x:$t $x)
    (bound $x) (!) )
( (strip-tag $x $y)
    (strcat "-": $y $x) )
( (strip-tag $x $x) )

; strip off tags, constant, number, etc.
( (strip-to-num (constant $x) $y)
    (strip-to-num $x $y) )
( (strip-to-num (number $x) $y)
    (strip-to-num $x $y) )
( (strip-to-num (unboxed $x) $y)
    (strip-to-num $x $y) )
( (strip-to-num $x $y)
    (strip-tag $x $y) )

;;****************************************************************************

; strip "mc_" prefix
( (strip-mc-prefix $x $y)
    (strcat "mc_": $y $x) )
( (strip-mc-prefix $x $x) )

; strip tag and "mc_" prefix
( (strip-tag-and-prefix $x $y)
    (strip-tag $x $y1) (!)
    (strip-mc-prefix $y1 $y) (!) )

( (is-symbolic-var $x:$t)
   (strprefix $x "sym_") )

;;****************************************************************************
;;* STRIP-LOCAL 
;;*
;;* Strip the leading '-' indicating a local variable.

( (strip-local $x $y)

    (strcat "-": $y $x) )

( (strip-local $x $x) )



;;****************************************************************************
;;* TAG maybe-tagged atom tag
;;*
;;* Split the tagged atom 'maybe-tag' into its components, or bind 'tag' to 0:
;;* if 'maybe-tagged' is not in fact a tagged atom.

( (tag $atom:$tag $atom $tag) )                          ; A tagged atom
( (tag $tagless $tagless $tag) (int-to-tag 0: $tag) )		; Anything else

( (set-tag $atom $tag $atom:$tag) (atom $atom) )
( (set-tag $x $tag $x) )

( (find-tag $atom:$tag $tag) )
( (find-tag () $tag) (int-to-tag 0: $tag) )
( (find-tag ($h | $t) $tag)
	(find-tag $h $tag) )


;;****************************************************************************
;;* LOOKUP-TYPE 
;;*
;;* Binary version of lookup-type which gets the environment
;;* from a global.

( (lookup-type $name $type)

    (get-global EXT_ENV $env)
    (lookup-type $env $name $type) )


;;****************************************************************************
;;* SYM-MANGLE
;;*
;;* Mangle name if in symbolic mode.

( (sym-mangle $name $sname)

    (get-global SYMBOLIC-MODE true:) (!)
    (strcat "sym_": $name $sname) )

( (sym-mangle $name $name) )

;;****************************************************************************

;;****************************************************************************
;;* TRANSPOSE
;;*
;;* Given a list of the elements in a matrix, return
;;* the list of elements in transposed order.

( (transpose $nrows $elem
             $res)

    (partition $nrows $elem $cols)
    (thelp-cols $cols () $res) )

;; Helper for TRANSPOSE
( (thelp-cols $cols $accum
              $res)

    (rest-each  $cols $cols-rest)
    (thelp-cols $cols-rest $accum $acc1)
    (first-each $cols $acc1 $res) )

( (thelp-cols $cols $accum $accum) )

;; Helper for TRANSPOSE
( (rest-each (($x1 | $r1) | $rlists) $res)

    (rest-each $rlists $res1)
    (id $res ($r1 | $res1)) )

( (rest-each () ()) )

;; Helper for TRANSPOSE
( (first-each (($x1 | $r1) | $rlists) $accum $res)

    (first-each $rlists $accum $acc1)
    (id $res ($x1 | $acc1)) )

( (first-each $_ $accum $accum) )

;; Helper for TRANSPOSE
( (partition $n $list
             $res)

    (take-first $n $list $lf $lr)
    (partition  $n $lr $rlist)
    (id $res ($lf | $rlist)) )

( (partition $n () ()) )

;; Helper for TRANSPOSE
( (take-first 0: $list () $list) )

( (take-first $n ($x | $r)
              ($x | $f) $lr)

    (+ $m 1: $n)
    (take-first $m $r $f $lr) )
