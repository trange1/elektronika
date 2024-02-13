//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/Trunk/efi/efisymbolics-umgd/mupad/mathcad/lib/mcmenu.mu $
//*   $Revision:: 14                                                                     $
//*     $Author:: ltravis                                                                $
//*       $Date:: 2006-12-18 19:34:16-05:00                                              $
//* $NoKeywords::                                                                        $
//*
//*  Purpose : Defines functions to be used as utilities when implementing
//*            Mathcad's interfaces.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

mcmenu := newDomain("mcmenu"):
mcmenu::Name := "mcmenu":
mcmenu::info := "Library 'mcmenu': ".
                  "Support for the 'dead symbolics' menu functionality.":

mcmenu::interface :=
 {
  hold(mcmenu_coeffs),
  hold(mcmenu_collect),
  hold(mcmenu_deriv_1),           // formerly mcad_diff_at_pt
  hold(mcmenu_det),
  hold(mcmenu_eval),              // formerly mcad_menu_eval
  hold(mcmenu_evalc),             // formerly mcad_menu_evalc
  hold(mcmenu_evalf),             // formerly mcad_menu_evalf
  hold(mcmenu_expand),
  hold(mcmenu_fourier),
  hold(mcmenu_factor),            // formerly mcad_mfactor
  hold(mcmenu_indef_integral),    // formerly mcad_menu_int
  hold(mcmenu_inverse),
  hold(mcmenu_invfourier),        // formerly mcad_ifourier
  hold(mcmenu_invlaplace),        // formerly mcad_ilaplace
  hold(mcmenu_invztrans),         // formerly mcad_iztrans
  hold(mcmenu_laplace),
  hold(mcmenu_parfrac),           // formerly mcad_menu_convert(expression, parfrac, var)
  hold(mcmenu_series),            // formerly handled by special case using dead_series
  hold(mcmenu_simplify),
  hold(mcmenu_solve),             // formerly mcad_menu_solve
  hold(mcmenu_substitute),        // formerly mcad_subs
  hold(mcmenu_transpose),         // formerly menu_mcad_transpose
  hold(mcmenu_ztrans),
  ()}:

mcmenu::mcmenu_coeffs := proc(expression, var)
 begin
    keyword_coeffs(expression, var);
 end_proc:

mcmenu::mcmenu_collect := proc(expression, var)
 begin
    keyword_collect(expression, var);
 end_proc:

mcmenu::mcmenu_deriv_1 := proc(fn, pt)
 begin
    op_deriv_1(fn, pt);
 end_proc:

mcmenu::mcmenu_det := proc(expression)
 begin
    keyword_det(expression);
 end_proc:

mcmenu::mcmenu_expand := proc(expression)
 begin
    keyword_expand(expression);
 end_proc:

mcmenu::mcmenu_factor := proc(expression)
 begin
    keyword_factor(expression);
 end_proc:

mcmenu::mcmenu_fourier := proc(expression, var)
 begin
    keyword_fourier(expression, var);
 end_proc:

mcmenu::mcmenu_inverse := proc(expression)
 begin
    keyword_inverse(expression);
 end_proc:

mcmenu::mcmenu_invfourier := proc(expression, var)
 begin
    keyword_invfourier(expression, var);
 end_proc:

mcmenu::mcmenu_invlaplace := proc(expression, var)
 begin
    keyword_invlaplace(expression, var);
 end_proc:

mcmenu::mcmenu_invztrans := proc(expression, var)
 begin
    keyword_invztrans(expression, var);
 end_proc:

mcmenu::mcmenu_laplace := proc(expression, var)
 begin
    keyword_laplace(expression, var);
 end_proc:

mcmenu::mcmenu_eval := proc(expression)
 begin
    eval(expression); // Force evaluation just in case not already evaluated.
 end_proc:

mcmenu::mcmenu_evalc := proc(expression)
 //
 // evalc is the old name, corresponding to "Complex", a name for an evaluation
 // style that just confuses users, who all think it's weird that a "complex" 
 // keyword should declare its arguments all "real".  We've changed it to rectangular
 // to emphasize the cartesian separation of real/imaginary in the result.
 // (One day there may be a "polar", too.) -kmp 25-Apr-2006
 //
 option hold; // N.B.: DOES NOT EVALUATE ITS ARGUMENTS
 begin
    keyword_rectangular_function(expression);       // Force special type of evaluation instead.
 end_proc:

mcmenu::mcmenu_evalf := proc(expression, precision)
 option hold; // N.B.: DOES NOT EVALUATE ITS ARGUMENTS
 begin
    keyword_float_function(expression, precision);  // Force special type of evaluation instead.
 end_proc:

mcmenu::mcmenu_indef_integral := proc(expression, var)
 begin
    int(expression,var);
 end_proc:

mcmenu::mcmenu_solve := proc(expression, var)
 begin
    keyword_solve(x->expression, var);
 end_proc:

mcmenu::mcmenu_parfrac := proc(expression, var)
 begin
    keyword_parfrac(expression, var);
 end_proc:

mcmenu::mcmenu_series := proc(expression, var, degree)
 begin
    keyword_series(expression, var, degree);
 end_proc:
 
mcmenu::mcmenu_simplify := proc(expression)
 begin
    keyword_simplify(expression);
 end_proc:

mcmenu::mcmenu_substitute := proc(var, val, expression)
 begin
    keyword_substitute_function(expression, [var=val]);
 end_proc:

mcmenu::mcmenu_transpose := proc(expression) 
 begin
    keyword_transpose(expression);
 end_proc:

mcmenu::mcmenu_ztrans := proc(expression, var)
 begin
    keyword_ztrans(expression, var);
 end_proc:

// return value of loading this file
null():
	
// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
