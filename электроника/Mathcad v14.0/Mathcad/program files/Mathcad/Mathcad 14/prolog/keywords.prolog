;********** Copyright © Parametric Technology Corporation. All rights reserved
;**
;**
;**  Version : $Header: /MathcadClient/Trunk/eng/mctranslator/prolog/keywords.prolog   9   2006-10-31 01:29:53-05:00   kpitman $
;**
;**
;**  Purpose : Defines the IS-KEYWORD predicate.
;**
;**
;**  Comments: This file uses a tab size of 3 spaces.
;**
;**
;****************************************************************************



;;****************************************************************************
;;* IS-KEYWORD
;;*
;;* Tests whether an identifier is a keyword in
;;* the sense of Mathcad symbolics.

; The following were something experimental that I implemented, but
; that isn't something Leslie wants to go with at this time.  I left
; the implementation in place in case that changes in the future.
;
; The justification for this is, in part, that the visual cues for the
; matrix operations are not to my taste.  But these are also useful
; post-processing steps to do on a result matrix, and I think it's easier
; to do blah()-> det-> than to do |blah()|-> which hides the result matrix.
;
; -kmp 16-Jun-2006.

;( (is-keyword mc_det:) )
;( (is-keyword mc_inverse:) )
;( (is-keyword mc_transpose:) )

; The rest of these are enabled...

( (is-keyword mc_assume:) )
( (is-keyword mc_cauchy:) )
( (is-keyword mc_coeffs:) )
( (is-keyword mc_collect:) )
( (is-keyword mc_combine:) )
( (is-keyword mc_complex:) )
( (is-keyword mc_confrac:) )
( (is-keyword mc_convert:) )
( (is-keyword mc_expand:) )
( (is-keyword mc_experimentally:) )
( (is-keyword mc_explicit:) )
( (is-keyword mc_factor:) )
( (is-keyword mc_float:) )
( (is-keyword mc_fourier:) )
( (is-keyword mc_fully:) )
( (is-keyword mc_invfourier:) )
( (is-keyword mc_invlaplace:) )
( (is-keyword mc_invztrans:) )
( (is-keyword mc_laplace:) )
( (is-keyword mc_parfrac:) )
( (is-keyword mc_raw:) )
( (is-keyword mc_rewrite:) )
( (is-keyword mc_rectangular:) )
( (is-keyword mc_series:) )
( (is-keyword mc_simplify:) )
( (is-keyword mc_solve:) )
( (is-keyword mc_substitute:) )
( (is-keyword mc_using:) )
( (is-keyword mc_ztrans:) )

;;****************************************************************************
;;* KEY-WRAPS-ALL
;;*
;;* Tests whether a keyword is one of those which wraps all others
;;* (which don't have this property).

;; mc_explicit is here for documentation purposes; it's even
;; more special than the run-of-the-mill KEY-WRAPS-ALL keywords.
( (key-wraps-all mc_explicit:) )
( (key-wraps-all mc_assume:) )
( (key-wraps-all mc_rectangular:) )
( (key-wraps-all mc_complex:) )
( (key-wraps-all mc_fully:) )
( (key-wraps-all mc_experimentally:) )
( (key-wraps-all mc_raw:) )
( (key-wraps-all mc_cauchy:) )
