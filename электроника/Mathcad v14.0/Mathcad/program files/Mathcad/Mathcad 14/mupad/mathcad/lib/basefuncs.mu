//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/releases/Mathcad_14.0.1/efi/efisymbolics-umgd/mupad/mathcad/lib/basefuncs.mu $
//*   $Revision:: 226                                                                       $
//*     $Author:: kpitman                                                                   $
//*       $Date:: 2007-05-30 12:10:06-04:00                                                 $
//* $NoKeywords::                                                                           $
//*
//*  Purpose : Defines basic Mathcad symbolic operators and functions
//*            (op_add, etc.).
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

basefuncs := newDomain("basefuncs"):
basefuncs::Name := "basefuncs":
basefuncs::info := "Library 'basefuncs': ".
                    "basic Mathcad operators and functions.":

basefuncs::interface := 
   {
    hold(add_i4),
    hold(and_),
    hold(as_bool),
    hold(as_i4),
    hold(as_f8),
    hold(bv),
    hold(clr_vec),
    hold(max_subscript),
    hold(mc_integral_),
    hold(mc_root),
    hold(mc_root_bracket_),
    hold(mcad_Ai),
    hold(mcad_Ai_scaled),
    hold(mcad_Bi),
    hold(mcad_Bi_scaled),
    hold(mcad_Ceil),
    hold(mcad_Chi),
    hold(mcad_Ci),
    hold(mcad_DAi),
    hold(mcad_DAi_scaled),
    hold(mcad_DBi),
    hold(mcad_DBi_scaled),
    hold(mcad_Ei),
    hold(mcad_Ei_scalar),
    hold(mcad_EllipticCE),
    hold(mcad_EllipticCK),
    hold(mcad_EllipticCPi),
    hold(mcad_EllipticE),
    hold(mcad_EllipticF),
    hold(mcad_EllipticK),
    hold(mcad_EllipticPi),
    hold(mcad_Floor),
    hold(mcad_FresnelC),
    hold(mcad_FresnelS),
    hold(mcad_H1),
    hold(mcad_H1_scaled),
    hold(mcad_H2),
    hold(mcad_H2_scaled),
    hold(mcad_I0),
    hold(mcad_I0_scaled),
    hold(mcad_I1),
    hold(mcad_I1_scaled),
    hold(mcad_Im),
    hold(mcad_Im_scalar),
    hold(mcad_Im_mapper),
    hold(mcad_In),
    hold(mcad_In_scaled),
//  hold(mcad_IsInteger),
    hold(mcad_IsPrime),
//  hold(mcad_IsRational),
//  hold(mcad_IsReal),
//  hold(mcad_IsComplex),
    hold(mcad_J0),
    hold(mcad_J0_scaled),
    hold(mcad_J1),
    hold(mcad_J1_scaled),
    hold(mcad_Jn),
    hold(mcad_Jn_scaled),
    hold(mcad_K0),
    hold(mcad_K0_scaled),
    hold(mcad_K1),
    hold(mcad_K1_scaled),
    hold(mcad_Kn),
    hold(mcad_Kn_scaled),
    hold(mcad_LambertW),
    hold(mcad_Psi),
    hold(mcad_Re),
    hold(mcad_Re_scalar),
    hold(mcad_Re_mapper),
    hold(mcad_Round),
    hold(mcad_Shi),
    hold(mcad_Si),
    hold(mcad_Trunc),
    hold(mcad_Y0),
    hold(mcad_Y0_scaled),
    hold(mcad_Y1),
    hold(mcad_Y1_scaled),
    hold(mcad_Yn),
    hold(mcad_Yn_scaled),
    hold(mcad_Zeta),
    hold(mcad_abs),
    hold(mcad_arccos),
    hold(mcad_arccosh),
    hold(mcad_arccot),
    hold(mcad_arccoth),
    hold(mcad_arccsc),
    hold(mcad_arccsch),
    hold(mcad_arcsec),
    hold(mcad_arcsech),
    hold(mcad_arcsin),
    hold(mcad_arcsinh),
    hold(mcad_arctan),
    hold(mcad_arctanh),
    hold(mcad_arg),
    hold(mcad_arg_scalar),
    hold(mcad_atan2),
    hold(mcad_augment),
    hold(mcad_beta),
    hold(mcad_binomial),
    hold(mcad_ceil),
    hold(mcad_cholesky),
    hold(mcad_cols),
    hold(mcad_combin),
    hold(mcad_cos),
    hold(mcad_cosh),
    hold(mcad_cot),
    hold(mcad_coth),
    hold(mcad_csc),
    hold(mcad_csch),
    hold(mcad_csgn),
    hold(mcad_csgn_scalar),
    hold(mcad_csort),
    hold(mcad_denom),
    hold(mcad_diag),
    hold(mcad_dilog),
    hold(mcad_dirac),
    hold(mcad_eigenvals),
    hold(mcad_eigenvec),
    hold(mcad_eigenvec_float),
    hold(mcad_eigenvecs),
    hold(mcad_erf),
    hold(mcad_erfc),
    hold(mcad_error),
    hold(mcad_exp),
    hold(mcad_exp_scalar),
    hold(mcad_fact2),
    hold(mcad_floor),
    hold(mcad_gamma),
    hold(mcad_gcd_spreader),
    hold(mcad_gcd),
    hold(mcad_geninv),
    hold(mcad_hlookup),
    hold(mcad_hypergeom),
    hold(mcad_identity),
    hold(mcad_js),
    hold(mcad_kroneckerDelta),
    hold(mcad_last),
    hold(mcad_lcm_spreader),
    hold(mcad_lcm),
    hold(mcad_length),
    hold(mcad_ln),
    hold(mcad_ln0),
    hold(mcad_ln0_scalar),
    hold(mcad_ln_scalar),
    hold(mcad_log),
    hold(mcad_log_scalar),
    hold(mcad_lookup),
    hold(mcad_lsolve),
    hold(mcad_match),
    hold(mcad_matrix),
    hold(mcad_max_spreader),
    hold(mcad_max),
    hold(mcad_min_spreader),
    hold(mcad_min),
    hold(mcad_mod),
    hold(mcad_numer),
    hold(mcad_polylog),
    hold(mcad_rank),
    hold(mcad_reverse),
    hold(mcad_round),
    hold(mcad_rows),
    hold(mcad_rref),
    hold(mcad_rsort),
    hold(mcad_sec),
    hold(mcad_sech),
    hold(mcad_sign),
    hold(mcad_sign_scalar),
    hold(mcad_signum),
    hold(mcad_signum_scalar),
    hold(mcad_sin),
    hold(mcad_sinc),
    hold(mcad_sinh),
    hold(mcad_sort),
    hold(mcad_stack),
    hold(mcad_submatrix),
    hold(mcad_svd),
    hold(mcad_svd2),
    hold(mcad_svds),
    hold(mcad_tan),
    hold(mcad_tanh),
    hold(mcad_tensor_epsilon),
    hold(mcad_tr),
    hold(mcad_trunc),
    hold(mcad_vlookup),
    hold(mcad_ys),
    hold(op_abs),
    hold(op_add),
    hold(op_and),
    hold(op_cross),
    hold(op_deriv_1),
    hold(op_deriv_2),
    hold(op_deriv_3),
    hold(op_deriv_4),
    hold(op_deriv_5),
    hold(op_deriv_n),
    hold(op_det),
    hold(op_div),
    hold(op_eq),
    hold(op_element_of),
    hold(op_element_of_C),
    hold(op_element_of_Q),
    hold(op_element_of_R),
    hold(op_element_of_Z),
    hold(op_factorial),
    hold(op_geninv),
    hold(op_geq),
    hold(op_gt),
    hold(op_indef_integral),
    hold(op_leq),
    hold(op_limit),
    hold(op_limitleft),
    hold(op_limitright),
    hold(op_lt),
    hold(op_magnitude),
    hold(op_matcol),
    hold(op_mult),
    hold(op_negate),
    hold(op_neq),
    hold(op_norm),
    hold(op_not),
    hold(op_nthroot),
    hold(op_nthroot_scalar),
    hold(op_or),
    hold(op_power),
    hold(op_rangeproduct),
    hold(op_rangesum),
    hold(op_sigmasum),
    hold(op_solve),
    hold(op_solve_internal),
    hold(op_solve_internal2),
    hold(op_sqr),
    hold(op_sqrt),
    hold(op_sqrt_scalar),
    hold(op_sub),
    hold(op_transpose),
    hold(op_xor),
    hold(or_),
    hold(Really),
    hold(sub_i4),
    hold(symsubscript1),
    hold(symsubscript2),
    hold(symgetm_col),
    hold(xor_),
    ()}:

// ==================== Supporting Operations for the Translator ====================

// --- Booleans ---

basefuncs::Really:=id;

basefuncs::as_bool:=proc(x)
 begin
   maybeToBool(x);
 end_proc:

basefuncs::bv:=proc(x)
 begin
   if x = TRUE  then return(1); end_if;
   if x = FALSE then return(0); end_if;
   x;
 end_proc:

basefuncs::clr_vec:=proc(n,elts)
 begin
   if isList(elts) then
     // returning op(elts) instead of elts fixes Bug #: 060509-134019
     // For some things like min, max, gcd, and lcm which recursively distribute a scalar operation,
     // whether we return arguments or a list of arguments is not consequential.  But for operations
     // like stack and augment, it's quite important to return something that won't be confused with
     // a user-supplied vector, since there's a difference between the user passing a vector and the
     // user passing scalars.  By turning into op(elts), we make this operation entirely invisible,
     // as should be the case anyway. -kmp 22-May-2006
     op(elts);
   else
      internalError("clr_vec expected a list of elements as its second argument");
   end_if;
 end_proc:

basefuncs::and_:=proc(x,y)
 begin
   // if isBool(x) and isBool(y) then return(x and y); end_if;
   // hold(op_and)(x,y);
   op_and(x,y);
 end_proc:

basefuncs::or_:=proc(x,y)
 begin
   //if isBool(x) and isBool(y) then return(x or y); end_if;
   //hold(op_or)(x,y);
   op_or(x,y);
 end_proc:

basefuncs::xor_:=proc(x,y)
 begin
   //if isBool(x) and isBool(y) then return(x xor y); end_if;
   //hold(op_xor)(x,y);
   op_xor(x,y);
 end_proc:

// --- Low-Level Numeric Type Operations ---

// The matrix-subscript code in the translator sometimes
// generates calls to these, so we have to be prepared to
// deal with them.
basefuncs::as_i4:=proc(x)
 begin
   x;
 end_proc:

basefuncs::add_i4:=proc(x,y)
 begin
   op_add(x,y);
 end_proc:

basefuncs::sub_i4:=proc(x,y)
 begin
   op_sub(x,y);
 end_proc:

basefuncs::as_f8:=proc(x)
 begin
   x;
 end_proc:

// ==================== Simple Services ====================

basefuncs::mcad_error := proc(msg)
 begin
   checkArgs(procname, args(0), 1);
   error(msg);
 end_proc:

basefuncs::mcad_IsPrime := proc(n)
 local result;
 begin
   checkArgs(procname, args(0), 1);
   result := isprime(n);
   if result = UNKNOWN then
      hold(mcad_IsPrime)(n);
   elif result then
      1;
   else
      0;
   end_if;
 end_proc:

basefuncs::op_element_of := proc(x, s)
 local res;
 begin
   res := is(x in s);
   if res = UNKNOWN then
      procname(x, s);
   elif res then
      1;
   else
      0;
   end_if;
 end_proc:

basefuncs::op_element_of_Z := proc(n) // mcad_IsInteger
 local temp;
 begin
   checkArgs(procname, args(0), 1);
   temp := is(n, Type::Integer());
   if   temp = TRUE then 1;
   elif temp = FALSE then 0;
   else hold(op_element_of)(n, Z_);
   end_if;
 end_proc:

basefuncs::op_element_of_Q := proc(n) // mcad_IsRational
 local temp;
 begin
   checkArgs(procname, args(0), 1);
   temp := is(n, Type::Rational());
   if   temp = TRUE then 1;
   elif temp = FALSE then 0;
   else hold(op_element_of)(n, Q_);
   end_if;
 end_proc:

basefuncs::op_element_of_R := proc(n) // mcad_IsReal
 local temp;
 begin
   checkArgs(procname, args(0), 1);
   temp := is(n, Type::Real());   
   if   temp = TRUE then 1;
   elif temp = FALSE then 0;
   else hold(op_element_of)(n, R_);
   end_if;
 end_proc:

basefuncs::op_element_of_C := proc(n) // mcad_IsComplex
 local temp;
 begin
   checkArgs(procname, args(0), 1);
   temp := is(n, Type::Complex());   
   if   temp = TRUE then 1;
   elif temp = FALSE then 0;
   else hold(op_element_of)(n, C_);
   end_if;
 end_proc:

// ==================== Complex Numbers ====================

basefuncs::mcad_Im_scalar := proc(z)
 local res;
 begin
   checkArgs(procname, args(0), 1);   
   res := Im(z);
   if (op(res,0)=hold(Im)) then
      res := mcSimplifyFast2a(res);  // formerly simplify, changed per Bug # 060914-123737
   end_if;
   res;
 end_proc:

basefuncs::mcad_Re_scalar := proc(z)
 local res;
 begin
   checkArgs(procname, args(0), 1);
   res := Re(z);
   if (op(res,0)=hold(Re)) then
      res := mcSimplifyFast2a(res);  // formerly simplify, changed per Bug # 060914-123737
   end_if;
   res;
 end_proc:

basefuncs::mcad_sign_scalar := proc(z)
 local zIsZero, zIsPos;
 begin
   checkArgs(procname, args(0), 1);
   zIsZero := is(z = 0);
   if (zIsZero = TRUE) then return(0); end_if;
   zIsPos := is(z > 0);
   if (zIsPos = TRUE) then return(1); end_if;
   if ((zIsZero = FALSE) and (zIsPos = FALSE)) then return(-1); end_if;
   return(hold(mcad_sign)(z));
 end_proc:

basefuncs::mcad_signum_scalar := proc(z, z0 = Null)
 local result;
 begin
   z0 := defaultArgument(z0, 1);
   checkArgs(procname, args(0), 1, 2);
   if iszero(z) then
      z0;
   else
      // If not simplified, we get results that are not in fully reduced form.
      // e.g., signum(2+2i) returns (1/4+i/4)*8^(1/2) 
      //       rather than (1/2+i/2)*2^(1/2)
      // Simplify(z/abs(z));
      result := sign(z);
      if (op(result,0)=hold(sign)) then
         if (z0 = 1) then
            hold(mcad_signum)(z);
         else
            hold(mcad_signum)(z,z0);
         end_if;
      else
         result;
      end_if;
   end_if;
 end_proc:

basefuncs::mcad_csgn_scalar := proc(z)
 local zIsZero, zInRightQuadrant;
 begin
   checkArgs(procname, args(0), 1);
   zIsZero := is(z = 0);
   if zIsZero = TRUE then return(0); end_if;
   zInRightQuadrant := is( Re(z) > 0 or ( Re(z) = 0 and Im(z) > 0 ));
   if (zInRightQuadrant = TRUE) then return(1); end_if;
   if (zIsZero = FALSE) and (zInRightQuadrant = FALSE) then return(-1); end_if;
   if is(z,Type::Real)=TRUE then
      return(hold(mcad_sign)(z));
   else
      return(hold(mcad_csgn)(z));
   end_if;
 end_proc:

basefuncs::mcad_arg_scalar := proc(z)
 begin
   checkArgs(procname, args(0), 1);
   arg(z);
 end_proc:

// Things that map over any shape matrix

basefuncs::mcad_Im_mapper := matrixMapper(mcad_Im_scalar):
basefuncs::mcad_Im := proc(variable_args)
 begin
   mcad_Im_mapper(args());
 end_proc:

basefuncs::mcad_Re_mapper := matrixMapper(mcad_Re_scalar):
basefuncs::mcad_Re := proc(variable_args)
 begin
   mcad_Re_mapper(args());
 end_proc:

basefuncs::mcad_numer := proc(x)
 begin
   if isMatrix(x) then 
      formatError(errorSymbolic);
   else 
      // Note that MuPAD differs from MAPLE in that it defines its numer
      // to be an error for strings and functions.  I'm going to allow 
      // that to show through, with Beth's approval, so this is an 
      // change from MC13.0 in that numer("foo")=>"foo" and denom("foo")=>1
      // and maybe other non-number types will lose. -kmp 14-Jun-2006
      numer(x);
   end_if;
 end_proc:

basefuncs::mcad_denom := proc(x)
 begin
   if isMatrix(x) then
      formatError(errorSymbolic);
   else
      // See comment in numer above. -kmp 14-Jun-2006
      denom(x);
   end_if;
 end_proc:

// Things that map over only column-shaped vectors

  // !!! TO DO: rearrange this so that the function name is right.
basefuncs::mcad_signum := vectorMapper(mcad_signum_scalar):
basefuncs::mcad_sign   := vectorMapper(mcad_sign_scalar):
basefuncs::mcad_csgn   := vectorMapper(mcad_csgn_scalar):
basefuncs::mcad_arg    := vectorMapper(mcad_arg_scalar):

basefuncs::mcad_dirac  := proc (arg1, arg2=hold(Null))
 // The Mupad version takes a second arg, 
 // which says what derivative (default 0 meaning none).
 // In MAPLE, the optional arg was the first arg, though it had the same meaning.
 // The Mathcad version of dirac takes an optional first argument (like MAPLE).
 begin
   checkArgs(procname, args(0), 1, 2);
   if arg2 = hold(Null) then
      dirac(arg1);
   else
      if isScalar(arg1) then
         checkNonNegativeInteger(arg1);
      elif isNotInteger(arg1) then // tolerate mcad_dirac(x,y) but not mcad_dirac("x",y)
         formatError(errorNotNonNegativeInteger);
      end_if;
      dirac(arg2, arg1);
   end_if;
 end_proc:

basefuncs::mcad_kroneckerDelta  := proc (x0, x1)
 // The Mathcad version of kroneckerDelta takes 2 arguments only.
 // The Mupad version takes one or two, but canonicalizes results to two.
 // The Mupad version also accepts arbitrary reals, where the Mathcad version accepts only integers.
 // Restricting the MuPAD version to integers only would seem to defeat the purpose since you couldn't integrate.
 begin
   checkArgs(procname, args(0), 2);
   kroneckerDelta(x0, x1);
 end_proc:

basefuncs::mcad_gamma  := proc (x,y)
 // The Mathcad version of gamma takes an optional second argument.
 local res, res1;
 begin
   checkArgs(procname, args(0), 1, 2);
   if args(0)=1 or y = hold(Null) then 
      res := gamma(x);
      if (testtype(res,"gamma") and
          nops(res) = 1 and
          is(op(res,1),Type::PosInt)=TRUE) then
         res1 := rewrite(res,fact);
         if testtype(res1,"fact") then
            res1;
         else
            res;
         end_if;
      else
         res;
      end_if;
   else
      igamma(x,y);
   end_if
 end_proc:
  
// ==================== Comparison Operators ====================

basefuncs::op_eq  := proc(lhs,rhs)
 begin
   checkArgs(procname, args(0), 2);  
   truthValue(lhs, _equal, rhs, hold(op_eq));
 end_proc:

basefuncs::op_neq := proc(lhs,rhs)
 begin
   checkArgs(procname, args(0), 2);
   truthValue(lhs, _unequal, rhs, hold(op_neq));
 end_proc:

basefuncs::op_lt := proc(lhs,rhs)
 begin
   checkArgs(procname, args(0), 2);  
   truthValue(lhs, _less, rhs, hold(op_lt));  
 end_proc:

basefuncs::op_leq := proc(lhs,rhs)
 begin
   checkArgs(procname, args(0), 2);  
   truthValue(lhs, _leequal, rhs, hold(op_leq));      
 end_proc:

basefuncs::op_gt := proc(lhs,rhs)
 begin
   checkArgs(procname, args(0), 2);  
   truthValue(lhs, _great, rhs, hold(op_gt));      
 end_proc:

basefuncs::op_geq := proc(lhs,rhs)
 begin
   checkArgs(procname, args(0), 2);  
   truthValue(lhs, _geequal, rhs, hold(op_geq));      
 end_proc:

// ==================== Booleans ====================

basefuncs::op_and := proc(clause1,clause2)
 local b1,b2;
 begin
   checkArgs(procname, args(0), 2);  
   b1:=maybeToBool(clause1);
   b2:=maybeToBool(clause2);
   if   b1 = FALSE then
      bv(FALSE);
   elif b1 = TRUE then
      bv(b2);
   elif b2 = FALSE then
      bv(FALSE);
   elif b2 = TRUE then
      bv(b1);
   else 
      procname(args());
   end_if;
 end_proc:

basefuncs::op_or := proc(clause1,clause2)
 local b1,b2;
 begin
   checkArgs(procname, args(0), 2);  
   b1:=maybeToBool(clause1);
   b2:=maybeToBool(clause2);
   if   b1 = FALSE then 
      bv(b2);
   elif b1 = TRUE  then 
      bv(TRUE);
   elif b2 = FALSE then
      bv(b1);      
   elif b2 = TRUE then
      bv(TRUE);
   else
      procname(args());
   end_if;
 end_proc:

basefuncs::op_xor := proc(clause1,clause2)
 local b1,b2;
 begin
   checkArgs(procname, args(0), 2);  
   b1:=maybeToBool(clause1);
   b2:=maybeToBool(clause2);
   if   b1 = TRUE then
      op_not(b2);
   elif b2 = TRUE then
      op_not(b1);
   elif b1 = FALSE then
      bv(b2);
   elif b2 = FALSE then
      bv(b1);
   else
      procname(args());
   end_if;
 end_proc:

basefuncs::op_not := proc(clause)
 local b;
 begin
   checkArgs(procname, args(0), 1);  
   b:=maybeToBool(clause);
   if isBool(b) then
      bv(not b);
   else
      procname(args());
   end_if;
 end_proc:

// ==================== Arithmetic ====================

basefuncs::op_add := proc(x,y)
 begin
   checkArgs(procname, args(0), 2);
   matrixScalarDistribute((x,y)->mixedMath(((a,b)-> a+b),x,y),x,y);
 end_proc:
 
basefuncs::op_sub := proc(x,y)
 begin
   checkArgs(procname, args(0), 2);
   matrixScalarDistribute((x,y)->mixedMath(((a,b)-> a-b),x,y),x,y);
 end_proc:

basefuncs::op_mult := proc(x,y)
 begin
   checkArgs(procname, args(0), 2);
   if isVector(x,ANY) and isVector(y,COLUMN) then
      if isVector(x,COLUMN) then
         x := linalg::transpose(x);
         // In Mathcad, multiplication of two column vectors
         // is defined to be the dot product, so we need to
         // replace y with its conjugate.  (See bug 020516-100722.)
         y := map(y,conjugate);
      end_if;
      // In this case, we want to convert the result from
      // a 1x1 matrix into a scalar (see bug 060921-120745).
      return(maybeScalarize(mixedMath(((a,b)-> a*b),x,y)));
   end_if;
   mixedMath(((a,b)-> a*b),x,y);
 end_proc:

basefuncs::op_div := proc(x,y)
 local result;
 begin
   checkArgs(procname, args(0), 2);
   if traperror((result := mixedMath(((a,b)-> a/b),x,y))) = 0
   then result;
   else formatError(errorDivideByZero);
   end_if;
 end_proc:

basefuncs::op_power := proc(x,y)
 begin
   checkArgs(procname, args(0), 2);
   if x = E then
      mixedMath(((a)-> exp(a)),y);
   else 
      mixedMath(((a,b)-> a^fixupFloatInt(b)),x,y);
   end_if;
 end_proc:

basefuncs::op_negate := proc(x)
 begin
   checkArgs(procname, args(0), 1);
   mixedMath(((a)-> -a),x);
 end_proc:

basefuncs::mcad_mod := proc(n, m)
 local isfloating, mag, sgn, q, r;
 begin
   checkArgs(procname, args(0), 2);
   // The documentation specifies the following type restrictions,
   // although MC13.0 doesn't enforce them.  We might want to change
   // these later, but since MuPAD doesn't offer the primitive support
   // that MAPLE did, some implementation work would need to be done.
   // -kmp 06-Mar-2006
   if isConstantExp(n) and isConstantExp(m) then
      // For Bug # 061027-174824, let irrationals like sqrt(2) slip through without testing.
      if not isScalarExp(n) then
         // Per Bug # 060906-160615, only do these checks when args are constant.
         checkReal(n); 
      end_if;
      if not isScalarExp(m) then
         checkReal(m);
      end_if;
   else
      return(hold(mcad_mod)(args()));
   end_if;
   // If we got this far, args are real
   isfloating := FALSE;
   if isFloating(n) then 
      n := numeric::rationalize(n);
      isfloating := TRUE;
   end_if;
   if isFloating(m) then
      m := numeric::rationalize(m);
      isfloating := TRUE;
   end_if;
   // At this point, args are rational
   sgn := sign(n);
   n := abs(n);
   m := abs(m);
   q := trunc(n/m);
   r := n-m*q;
   mag := r;
   if isfloating then
      mag := evalFloat(mag);
   end_if;
   sgn * mag;
 end_proc:

basefuncs::op_sqr := proc(x)
 begin
   checkArgs(procname, args(0), 1);
   op_power(x,2);
 end_proc:

basefuncs::op_factorial:=proc(n)
 begin
   if isConstantExp(n) then
      // Make sure we do the right check.
      checkNonNegativeInteger(n);
   end_if;
   n!;
 end_proc:

basefuncs::op_magnitude := proc(x) 
   // This function, shown to users of Mathcad only as |x|,
   // is referred to in documentation as the "magnitude" operator.
   // It is used as the unified implementation of op_det, op_norm, and op_abs.
   // It's too bad it can't really do those things in isolation,
   // but Mathcad defines it this way.
 begin
   checkArgs(procname, args(0), 1);
   if isVector(x) then 
     norm(x,Frobenius);
   elif isMatrix(x) then 
      // Lists are matrices (treated as having 1 column)
      if isMatrixSquare(x) then
         linalg::det(x);
      else
         formatError(errorMatrixNotSquare);
      end_if;
   else
      abs(x);
   end_if;
 end_proc:

basefuncs::mcad_abs := proc(x)  // mcad_abs(x) implements abs(x)
 begin
   op_magnitude(x);
 end_proc:

basefuncs::op_abs := mcad_abs;  // op_abs(x) implements |x|

basefuncs::mcad_gcd_spreader := matrixSpreader(gcd):
basefuncs::mcad_gcd := proc(variable_args)
 begin
   mcad_gcd_spreader(args());
 end_proc:

basefuncs::mcad_lcm_spreader := matrixSpreader(lcm):
basefuncs::mcad_lcm := proc(variable_args)
 begin
   mcad_lcm_spreader(args());
 end_proc:

basefuncs::mcad_max_spreader := matrixSpreader(max):
basefuncs::mcad_max := proc(variable_args)
 begin
   mcad_max_spreader(args());
 end_proc:

basefuncs::mcad_min_spreader := matrixSpreader(min):
basefuncs::mcad_min := proc(variable_args)
 begin
   mcad_min_spreader(args());
 end_proc:

// ==================== Tensors ====================

basefuncs::mcad_tensor_epsilon := proc(ORIGIN,i,j,k)
 begin
   checkArgs(procname, args(0)-1, 3);
   if isNotInteger(i) or isNotInteger(j) or isNotInteger(k) then
      formatError(errorNotInteger);
   elif isInteger(i) and isInteger(j) and isInteger(k) then
      i := i-ORIGIN;
      j := j-ORIGIN;
      k := k-ORIGIN;
      if i < 0 or j < 0 or k < 0 or 
         i > 2 or j > 2 or k > 2 then
         formatError(errorMustBeBetween,ORIGIN,ORIGIN+2);
      end_if;
      if      ( i=0 and j=1 and k=2 ) or
              ( i=1 and j=2 and k=0 ) or
              ( i=2 and j=0 and k=1 )
      then  
         1
      elif    ( i=0 and j=2 and k=1 ) or
              ( i=1 and j=0 and k=2 ) or
              ( i=2 and j=1 and k=0 )
      then
         -1
      else
         0
      end_if;
   else
      hold(mcad_tensor_epsilon)(ORIGIN,i,j,k);
   end_if;
 end_proc:

// ==================== Rounding ====================

basefuncs::mcad_ceil := proc(thing)
 local fthing;
 begin
   checkArgs(procname, args(0), 1);
   if isConstant(thing) then
      if isComplex(thing) then
         // MAPLE V would have done this:
         //
         //   -mcad_floor(-thing);
         //
         // However, we defined this to be a bug.
         // We're preferring to be compatible with our numerics,
         // which just distributes the operation.
         // See Bug # 051219-174130
         // -kmp 29-Jun-2006
         ceil(Re(thing))+ceil(Im(thing))*I;
      else
         ceil(thing);
      end_if;
   else
      fthing := float(thing);
      if isConstant(fthing) then
         mcad_ceil(fthing);
      elif isMatrix(thing) then
         map(thing, mcad_ceil);
      else
         procname(thing);
      end_if;
   end_if;
 end_proc:

basefuncs::mcad_floor := proc(thing)
 local fthing; // a, b, x;
 begin
   checkArgs(procname, args(0), 1);
   if isConstant(thing) then
      if isComplex(thing) then
         // This odd-looking algorithm is what MAPLE V would have done.
         // a := Re(thing) - floor(Re(thing));
         // b := Im(thing) - floor(Im(thing));
         // x := if (a+b) < 1 then
         //         0;
         //      else
         //         if a >= b then
         //            1;
         //         else
         //            I;
         //         end_if;
         //      end_if;
         // floor(Re(thing))+floor(Im(thing))*I+x;
         //
         // However, we defined this to be a bug.
         // We're preferring to be compatible with our numerics,
         // which just distributes the operation.
         // See Bug # 051219-174130
         // -kmp 29-Jun-2006
         floor(Re(thing))+floor(Im(thing))*I;
      else
         floor(thing);
      end_if;
   else
      fthing := float(thing);
      if isConstant(fthing) then
         mcad_floor(fthing);
      elif isMatrix(thing) then
         map(thing, mcad_floor);
      else
         procname(thing);
      end_if;
   end_if;
 end_proc:

basefuncs::mcad_trunc := proc(thing)
 local fthing;
 begin
   checkArgs(procname, args(0), 1);
   if isConstant(thing) then
      if isComplex(thing) then
         trunc(Re(thing))+trunc(Im(thing))*I;
      else
         trunc(thing);
      end_if;
   else
      fthing := float(thing);
      if isConstant(fthing) then
         mcad_trunc(fthing);
      elif isMatrix(thing) then
         map(thing, mcad_trunc);
      else
         procname(thing);
      end_if;
   end_if;
 end_proc:

basefuncs::mcad_round := proc(thing,fracdigits=Null)
 local divisor, scalar_round, fthing;
 begin
   fracdigits := defaultArgument(fracdigits, 0);
   checkArgs(procname, args(0), 1, 2);
   if isConstant(thing) then
      divisor := 10^-fracdigits;
      scalar_round := (x->mcad_Round(x,divisor));
      if isComplex(thing) then
         scalar_round(Re(thing))+scalar_round(Im(thing))*I;
      else
         scalar_round(thing);
      end_if;
   else
      fthing := float(thing);
      if isConstant(fthing) then
         mcad_round(fthing, fracdigits);
      elif isMatrix(thing) then
         map(thing, mcad_round);
      else
         procname(thing);
      end_if;
   end_if;
 end_proc:

basefuncs::mcad_Round := proc(thing,divisor)
 local fthing;
 begin
   checkArgs(procname, args(0), 2);
   if isConstant(divisor) then
      if isConstant(thing) then
         if isComplex(thing) then
            mcad_Round(Re(thing), divisor)+mcad_Round(Im(thing), divisor)*I;
         else
            divisor*(round(thing/divisor));
         end_if;
      else
         fthing := float(thing);
         if isConstant(fthing) then
            mcad_Round(fthing, divisor);
         elif isMatrix(thing) then
            map(thing, x->mcad_Round(x, divisor));
         else
            procname(thing,divisor);
         end_if;
      end_if;
   else
      procname(thing,divisor);
   end_if;
 end_proc:

basefuncs::mcad_Ceil := proc(thing,divisor)
 local fthing;
 begin
   checkArgs(procname, args(0), 2);
   if isConstant(divisor) then
      if isConstant(thing) then
         if isComplex(thing) then
            mcad_Ceil(Re(thing), divisor)+mcad_Ceil(Im(thing), divisor)*I;
         else
            divisor*(ceil(thing/divisor));
         end_if;
      else
         fthing := float(thing);
         if isConstant(fthing) then
            mcad_Ceil(fthing, divisor);
         elif isMatrix(thing) then
            map(thing, x->mcad_Ceil(x, divisor));
         else
            procname(thing,divisor);
         end_if;
      end_if;
   else
      procname(thing,divisor);
   end_if;
 end_proc:

basefuncs::mcad_Floor := proc(thing,divisor)
 local fthing;
 begin
   checkArgs(procname, args(0), 2);
   if isConstant(divisor) then
      if isConstant(thing) then
         if isComplex(thing) then
            mcad_Floor(Re(thing), divisor)+mcad_Floor(Im(thing), divisor)*I;
         else
            divisor*(floor(thing/divisor)):
         end_if;
      else
         fthing := float(thing);
         if isConstant(fthing) then
            mcad_Floor(fthing, divisor);
         elif isMatrix(thing) then
            map(thing, x->mcad_Floor(x, divisor));
         else
            procname(thing,divisor);
         end_if;
      end_if;
   else
      procname(thing,divisor);
   end_if;
 end_proc:

basefuncs::mcad_Trunc := proc(thing,divisor)
 local fthing;
 begin
   checkArgs(procname, args(0), 2);
   if isConstant(divisor) then
      if isConstant(thing) then
         if isComplex(thing) then
            mcad_Trunc(Re(thing), divisor)+mcad_Trunc(Im(thing), divisor)*I;
         else
            divisor*(trunc(thing/divisor)):
         end_if;
      else
         fthing := float(thing);
         if isConstant(fthing) then
            mcad_Trunc(fthing, divisor);
         elif isMatrix(thing) then
            map(thing, x->mcad_Trunc(x,divisor));
         else
            procname(thing,divisor);
         end_if;
      end_if;
   else
      procname(thing,divisor);      
   end_if;
 end_proc:

// ==================== Roots ====================

basefuncs::op_sqrt_scalar := proc(x)
 begin
   checkArgs(procname, args(0), 1);
   sqrt(x);
 end_proc:

basefuncs::op_sqrt := vectorMapper(op_sqrt_scalar):

basefuncs::op_nthroot_scalar:=proc(expr,n)
 begin
   checkArgs(procname, args(0), 2):
   if optionUseSurd then
      surd(expr,n);
   else
      op_power(expr,1/n);
   end_if;
 end_proc:

basefuncs::op_nthroot := vectorMapper(op_nthroot_scalar):

// ==================== Matrix Operators ====================

basefuncs::op_cross := proc(u, v)
 local uv3, vv3, mu, mv;
 begin
   checkArgs(procname, args(0), 2);
   uv3:=isVector(u,COLUMN,3);
   vv3:=isVector(v,COLUMN,3);
   if uv3 and vv3 then
      return(linalg::crossProduct(u,v));
   elif ((not uv3) and (isMatrix(u) or isNotMatrix(u))) or
        ((not vv3) and (isMatrix(v) or isNotMatrix(v)))
   then
      // If it's definitively either a matrix or not (but not still variable)
      // then signal an error.  Note that isMatrix() and isNotMatrix() are not
      // exhaustive. There is a gray middle ground. -kmp 06-Sep-2006
      formatError(errorNot3Vec);
   else
      hold(op_cross)(u,v);
   end_if;
 end_proc:

basefuncs::mcad_tr := proc(M)
 local result, i;
 begin
   checkArgs(procname, args(0), 1);
   checkMatrix(M);
   checkMatrixSquare(M);
   result := 0;
   for i from 1 to linalg::ncols(M) do
      result := result + M[i,i];
   end_for;
   result;
 end_proc:

basefuncs::op_matcol := proc(M,col,ORIGIN=0)
 local raw_col, raw_ncols;
 begin
   // Repaired to do explicit bounds checking for Bug # 070220-190353 -kmp 24-Mar-2007
   if isMatrix(M) and isInteger(col) then
      raw_ncols := linalg::ncols(M);
      raw_col   := col-ORIGIN+1;
      if (raw_col < 1 or raw_col > raw_ncols) then
         formatError(errorArrayIndexOutOfBounds,col);            
      end_if;
      linalg::col(M, raw_col);
   elif isNotInteger(col) then
      formatError(errorNotInteger);
   else
      procname(args());
   end_if;
 end_proc:

basefuncs::op_det := basefuncs::op_magnitude:

basefuncs::op_transpose := proc(x)
 local result;
 begin
   checkArgs(procname, args(0), 1);
   result := linalg::transpose(x);
   if (result<> FAIL) then
      result;
   else
      procname(args(1..args(0)));
   end_if;
 end_proc:

basefuncs::mcad_augment := proc()
 begin
   linalg::concatMatrix(map(args(),toMatrix));
 end_proc:

basefuncs::mcad_stack := proc()
 begin
   linalg::stackMatrix(map(args(),toMatrix));
 end_proc:

basefuncs::mcad_cols := proc(m)
 begin
   checkArgs(procname, args(0), 1);
   if isMatrix(m) then
      linalg::ncols(m);
   else
      0; // MC13.0 used to return 0 for numbers, strings, ranges,
         // but not functions [where it erred].  I didn't feel
         // like making functions get a special case. -kmp 02-Mar-2006
   end_if;
 end_proc:

basefuncs::mcad_rows := proc(m)
 begin
   checkArgs(procname, args(0), 1);
   if isMatrix(m) then
      linalg::nrows(m);
   else
      0; // MC13.0 used to return 0 for numbers, strings, ranges,
         // but not functions [where it erred].  I didn't feel
         // like making functions get a special case. -kmp 02-Mar-2006
   end_if;
 end_proc:

basefuncs::mcad_diag := proc(Q)
 local size, result, i;
 begin
   checkArgs(procname, args(0), 1);
   if isVector(Q) then
      size := linalg::vecdim(Q);
      result := matrix(size,size,0);
      for i from 1 to size do
         result[i,i]:=Q[i];
      end_for;
   elif isMatrix(Q) then
      checkMatrixSquare(Q);
      size := linalg::ncols(Q);
      result := matrix(size, 1);
      for i from 1 to size do
         result[i,1]:=Q[i,i];
      end_for;
   else
      result := procname(Q);
   end_if;
   result;
 end_proc:

basefuncs::mcad_matrix := proc(n, m, f, ORIGIN=0)
 local result, i, j;
 begin
   checkArgs(procname, args(0), 3); // N.B.: Can't pass ORIGIN for now. Maybe allow as hidden arg some day.
   result := matrix(n, m);
   for i from 1 to n do
      for j from 1 to m do
         result[i,j]:=f(i-1+ORIGIN,j-1+ORIGIN);
      end_for;
   end_for;
   validateMatrix(result);
 end_proc:

basefuncs::mcad_identity := proc(size)  // identity matrix, NOT identity fn!!
 begin
   checkArgs(procname, args(0), 1);
   checkInteger(size);
   validateMatrix(matrix::identity(size));
 end_proc:

basefuncs::mcad_submatrix := proc(ORIGIN,M,r1,r2,c1,c2)
 begin
	if isMatrix(M)  and 
      isScalar(r1) and
      isScalar(r2) and
      isScalar(c1) and
      isScalar(c2) then
      checkInteger(r1);
      checkInteger(r2);
      checkInteger(c1);
      checkInteger(c2);
      validateMatrix(linalg::submatrix(M, r1-ORIGIN+1 .. r2-ORIGIN+1,
                                       c1-ORIGIN+1 .. c2-ORIGIN+1));
	else
		procname(args());
	end_if;
 end_proc:

basefuncs::mcad_lookup := proc(ORIGIN, TOL, z, A, B)
 local i, j, nr, nc, res, win;
 begin
   if isNotMatrix(A) then
      formatError(errorNotMatrix, A);
   elif isNotMatrix(B) then
      formatError(errorNotMatrix, B);
   end_if;
   if isMatrix(A) and isMatrix(B) then
      nr := linalg::nrows(A);
      nc := linalg::ncols(A);
      if linalg::ncols(B) <> nc or
         linalg::nrows(B) <> nr then
         formatError(errorArrayDimensionMismatch);
      end_if;
      win := FALSE;
      res := _exprseq();
      for i from 1 to nr do
         for j from 1 to nc do
            // print("mcad_lookup testing",i,j,A[i,j],z,TOL);
            if heuristicEqual(A[i,j], z, TOL) then
               // print("win");
               win := TRUE;
               res := res,[B[i,j]];
            else
               // print("lose");
            end_if;
         end_for;
      end_for;
      if not win then
         formatError(errorNoMatch);
      end_if;
      matrix([res]);
   else
      hold(mcad_lookup)(ORIGIN, TOL, z, A, B);
   end_if;
 end_proc:

basefuncs::mcad_hlookup := proc(ORIGIN, TOL, z, A, r)
 local col, offset, nr, nc, res, win;
 begin
   checkArgs(procname, args(0)-2, 3);
   // print("hlookup: checking scalar");
   if isScalar(r) then
      checkNonNegativeInteger(r);
   end_if;
   // print("vlookup: checking matrix");
   if isNotMatrix(A) then
      formatError(errorNotMatrix, A);
   end_if;
   // print("hlookup: done error checking. triaging...");
   if isMatrix(A) and isScalar(r) then
      // print("going ahead");
      nr := linalg::nrows(A);
      nc := linalg::ncols(A);
      win := FALSE;
      res := _exprseq();
      offset := ORIGIN-1;
      // print("testing","r=",r,"offset=",offset,"nr=",nr);
      if r < 1+offset or r > nr+offset then
         formatError(errorArrayIndexOutOfBounds);
      end_if;
      for col from 1 to nc do
         // print("testing","r"=1,"col"=col,_equal(A[1,col],z),TOL);
         if heuristicEqual(A[1,col], z, TOL) then
            // print("winning...");
            win := TRUE;
            res := res,[A[r-offset,col]];
         else
            // print("losing...");
         end_if;
      end_for;
      // print("win=",win);
      if not win then
         formatError(errorNoMatch);
      end_if;
      matrix([res]);
   else
      hold(mcad_hlookup)(ORIGIN, TOL, z, A, r);
   end_if;
 end_proc:

basefuncs::mcad_vlookup := proc(ORIGIN, TOL, z, A, c)
 local row, offset, nr, nc, res, win;
 begin
   checkArgs(procname, args(0)-2, 3);
   // print("vlookup: checking scalar");
   if isScalar(c) then
      checkNonNegativeInteger(c);
   end_if;
   // print("vlookup: checking matrix");
   if isNotMatrix(A) then
      formatError(errorNotMatrix, A);
   end_if;
   // print("vlookup: done error checking. triaging...");
   if isMatrix(A) and isScalar(c) then
      // print("going ahead");
      nr := linalg::nrows(A);
      nc := linalg::ncols(A);
      win := FALSE;
      res := _exprseq();
      offset := ORIGIN-1;
      // print("testing","c=",c,"offset=",offset,"nc=",nc);
      if c < 1+offset or c > nc+offset then
         formatError(errorArrayIndexOutOfBounds);
      end_if;
      for row from 1 to nr do
         // print("row=",row);
         // print("testing","row"=row,"c"=1,_equal(A[row,1],z),"to",TOL);
         if heuristicEqual(A[row,1], z, TOL) then
            // print("winning...");
            win := TRUE;
            res := res,[A[row,c-offset]];
         else
            // print("losing...");
         end_if;
      end_for;
      // print("win=",win);
      if not win then
         formatError(errorNoMatch);
      end_if;
      matrix([res]);
   else
      hold(mcad_vlookup)(ORIGIN, TOL, z, A, c);
   end_if;
 end_proc:

basefuncs::mcad_match := proc(ORIGIN, TOL, z, A)
 local row, col, nr, nc, res, win, datum, is_vec;
 begin
   if isNotMatrix(A) then
      formatError(errorNotMatrix, A);
   end_if;
   if isMatrix(A) then
      is_vec := isVector(A,COLUMN); // row vector is treated like matrix
      nr := linalg::nrows(A);
      nc := linalg::ncols(A);
      win := FALSE;
      res := _exprseq();
      offset := ORIGIN-1;
      // Note: If Bug # 060906-231229 is addressed by making this search be
      //       row-major, the order of the next two lines should be swapped.
      for col from 1 to nc do
         for row from 1 to nr do
            // print("mcad_lookup testing",row,col,A[row,col],z,TOL);
            if heuristicEqual(A[row,col], z, TOL) then
               // print("win");
               win := TRUE;
               if is_vec then
                  datum := row+offset;
               else
                  datum := matrix([[row+offset],[col+offset]]);
               end_if;
               res := res,[datum];
            else
               // print("lose");
            end_if;
         end_for;
      end_for;
      if not win then
         formatError(errorNoMatch);
      end_if;
      matrix([res]);
   else
      hold(mcad_match)(ORIGIN, TOL, z, A);
   end_if;
 end_proc:

basefuncs::mcad_cholesky := proc(a)
 local M, i, j;
 begin
   checkArgs(procname, args(0), 1);
   // Mathcad defines the Cholesky factorization for non-symmetric
   // matrices by reflecting the upper triangular about the main
   // diagonal.
   M:=a;  // does this do a copy? paranoid.  maybe check later.
	if isMatrix(M) then
		for i from 1 to linalg::nrows(M) do
			for j from 1 to (i-1) do
				M[i,j]:=M[j,i];
			end_for;
		end_for;
		linalg::factorCholesky(M,NoCheck):
	else
		procname(args()):
	end_if;
 end_proc:

basefuncs::mcad_eigenvals := proc(M)
 local predicate, result, sorted_result, entry;
 begin
   checkArgs(procname, args(0), 1);   
   result := _exprseq();
   for entry in linalg::eigenvalues(M,Multiple) do
      result := result, entry[1]$entry[2];
   end_for;
   result := [result];
   predicate := realPartGreater;
   linalg::transpose(matrix([if traperror((sorted_result := sort(result, predicate))) = 0
                             then sorted_result;
                             else result;
                             end_if]));
 end_proc:

basefuncs::mcad_eigenvec := proc(M, z)
 local result, entry;
 begin
   result := FAIL;
   for entry in linalg::eigenvectors(M) do
      if iszero(z - entry[1])
      then
         result := entry[3];
         break;
      end_if;
   end_for;
   if not isList(result) then
      formatError(errorNoEigenvecs);
   else
      result[1]; // if there are multiplicities, just use the first? -kmp 07-Mar-2006
   end_if;
 end_proc:

basefuncs::mcad_eigenvec_float := proc(M, z, precision=1.0e-12)
 local result, zf, ef, entry;
 begin
   result := FAIL;
   zf := evalFloat(z);
   for entry in linalg::eigenvectors(M) do
      ef := float(entry[1]);
      // print("considering entry for",ef);
      // print("fuzzyEqual(",zf,ef,precision,")=",fuzzyEqual(zf,ef,precision));
      if fuzzyEqual(zf,ef,precision)
      then
         result := entry[3];
         break;
      end_if;
   end_for;
   if not isList(result) then
      formatError(errorNoEigenvecs);
   else
      result[1]; // if there are multiplicities, just use the first? -kmp 07-Mar-2006
   end_if;
 end_proc:

basefuncs::mcad_eigenvecs := proc(M, side=Null)
 local rowvecs, eigenvecs, item, eigenvec, result, L, temp;
 begin
   checkArgs(procname, args(0), 1, 2);   
   // Select right or left eigenvector; right is the default.
   if (side=Null or side="R") then // omitting arg is same as passing "R"
      L:=FALSE;
   elif (side="L") then
      // lefteigenvectors(M) = righteigenvectors(M^T)^T
      // and we return the Hermitian transpose of that ((M^T)^T)^H
      // the ((...)^T)^H cancels and becomes just the conjugate(...),
      // which we do conditionally at the end below (if L is TRUE).
      L:=TRUE;
      M := linalg::transpose(M);
   else
      formatError(errorInvalidArgument); // "invalid eigenvecs side"
   end_if;
   if optionUseMcFloats and hastype(M, mcfloat) then
      M := unmcfloat(M);
   end_if;
   rowvecs := _exprseq();
   // print("in mcad_eigenvectors","M"=M);
   temp := linalg::eigenvectors(M);
   // print("in mcad_eigenvectors","temp"=temp);
   for item in temp do
      // print("item"=item);
      eigenvecs := item[3];
      if isList(eigenvecs) then
         for eigenvec in eigenvecs do
            rowvecs := rowvecs, [op(eigenvec)];
         end_for;
      end_if;
   end_for;
   result := linalg::transpose(matrix([rowvecs]));
   if L then conjugate(result) else result end_if;
 end_proc:

basefuncs::mcad_rank := proc(M)
 begin
   checkArgs(procname, args(0), 1);
   if isScalar(M) then
      formatError(errorInvalidArgument);
   elif isMatrix(M) then
      linalg::rank(M);
   else
      procname(M);
   end_if;
 end_proc:

basefuncs::mcad_rref := proc(M)
 begin
   checkArgs(procname, args(0), 1);
   if isMatrix(M) and isEvery(M,isScalar) then
      linalg::gaussJordan(M);
   else
      procname(M);
   end_if;
 end_proc:

basefuncs::mcad_geninv := proc(TOL,M)
 local res, MT;
 begin
   checkArgs(procname, args(0)-1 /* TOL is a hidden arg */, 1);
   if isMatrix(M) then
      MT := linalg::transpose(M);
		if traperror((res := ( MT * M )^-1 * MT ))=0 then
			res;
      else
			formatError(errorSymbolic);
		end_if;
	else
		procname(M);
	end_if;
 end_proc:

basefuncs::mcad_lsolve := proc(M,v)
 begin
   checkArgs(procname, args(0), 2);
   checkMatrix(M);
   checkVector(v);
   linalg::matlinsolve(M,v);
 end_proc:

basefuncs::mcad_svds := proc(M)
 begin
   checkArgs(procname, args(0), 1);
   if isMatrix(M) and isEvery(M,isScalar) then
      mcad_svd2(M)[1];
   else
      procname(M);
   end_if;
 end_proc:

basefuncs::mcad_svd := proc(M)
 local temp;
 begin
   checkArgs(procname, args(0), 1);
   if isMatrix(M) and isEvery(M,isScalar) then
      temp := mcad_svd2(M);
      mcad_stack(temp[2], linalg::transpose(temp[3]));
   else
      procname(M);
   end_if;
 end_proc:

basefuncs::mcad_svd2 := proc(M)
 local temp;
 begin
   checkArgs(procname, args(0), 1);
   if isMatrix(M) and isEvery(M,isScalar) then
      temp := numeric::singularvectors(M, Soft, NoErrors, ReturnType = Dom::Matrix());
      matrix([[linalg::transpose(matrix([temp[2]]))],
              [temp[1]],
              [linalg::transpose(temp[3])]]);
   else
      procname(M);
   end_if;
 end_proc:

  
// ==================== Vector Operators ====================

basefuncs::op_norm := basefuncs::op_magnitude:

basefuncs::mcad_length := proc(v)
 begin
   checkArgs(procname, args(0), 1);
   checkVector(v, COLUMN); // it's what MC13 wanted
   linalg::vecdim(v);      // no need to take origin into account
 end_proc:

basefuncs::mcad_last := proc (ORIGIN, v)
 begin
   if (isVector(v,ANY)) then // it's what MC13.0 looked for
                             // (though inconsistent with mcad_length,
                             //  AND not able to actually be used as
                             //  a lone subscript in MC13.0!)
      linalg::vecdim(v) + ORIGIN - 1;
   else
      procname(v);        // it's what MC13.0 did
   end_if;
 end_proc:

basefuncs::mcad_sort := proc(v)
 begin
   checkArgs(procname, args(0), 1):
   if isVector(v,COLUMN) then
      matrix(sortByScalarColumn(coerce(v,DOM_LIST),1));
   elif isScalar(v) or isString(v) or isMatrix(v) then
      error(errorNotVector);
   else
      hold(mcad_sort)(args());
   end_if;
 end_proc:

basefuncs::mcad_reverse := proc(a)
 local i, res;
 begin
   checkArgs(procname, args(0), 1):
   if isMatrix(a) then
      data := coerce(a,DOM_LIST); // list of rows as lists
      matrix(reverseList(data));
   elif isScalar(a) or isString(a) then
      error(errorNotMatrix);
   else
      hold(mcad_reverse)(args());
   end_if;
 end_proc:

basefuncs::mcad_csort := proc(ORIGIN, a, colnum)
 local c, maxc;
 begin
   checkArgs(procname, args(0)-1, 2):
   if isMatrix(a) and isInteger(colnum) then
      checkMatrix(a);
      data := coerce(a,DOM_LIST); // list of rows as lists
      n := colnum - ORIGIN + 1;
      if colnum < ORIGIN then
         error(errorArrayIndexOutOfBounds);
      end_if;
      if n > linalg::ncols(a) then
         error(errorArrayIndexOutOfBounds);
      end_if;
      matrix(sortByScalarColumn(data,n));
   elif isScalar(a) or
        isString(a) then
      error(errorNotMatrix);
   elif isMatrix(colnum) or
        isString(colnum) then
      error(errorNotInteger);
   else
      hold(mcad_csort)(args());
   end_if;
 end_proc:

basefuncs::mcad_rsort := proc(ORIGIN, a, rownum)
 begin
   checkArgs(procname, args(0)-1, 2):
   if isMatrix(a) and isScalar(rownum) then
      linalg::transpose(mcad_csort(ORIGIN,linalg::transpose(a),rownum));
   elif isScalar(a) or
        isString(a) then
      error(errorNotMatrix);
   elif isMatrix(rownum) or
        isString(rownum) then
      error(errorNotInteger);
   else
      hold(mcad_rsort)(args());
   end_if;
 end_proc:

// ==================== Summations and Products ====================

basefuncs::op_sigmasum := proc(vector)
 local result, i, j;
 begin
   if not isMatrix(vector) then 
      formatError(errorNotMatrix);
   elif (not optionVectorSumAllowsMatrices and
         not isVector(vector,ANY)) then
      formatError(errorNotVector);
   else
      result := 0;
      for i from 1 to linalg::nrows(vector) do
         for j from 1 to linalg::ncols(vector) do
            result := result + vector[i,j];
         end_for;
      end_for;
      result;
   end_if;
 end_proc:

basefuncs::op_rangesum := proc(f,range)
 local var, lo, hi, res, i;
 begin
   checkArgs(procname, args(0), 2):
   var:=functionArgs(f); // op(f,1):
   if (nops(var) <> 1) then internalError("Ill-formed function."); end_if;
   if testtype(range,"_range") then
      range := fixupRange(range);
      lo := op(range,1);
      hi := op(range,2);
      if isScalar(lo) and isScalar(hi) then
         // This branch to force it use a normal iteration is due to 
         // Bug # 061201-172412. -kmp 20-Apr-2007
         checkInteger(lo);
         checkInteger(hi);
         res := 0;
         for i from lo to hi do
            res := res + f(i);
         end_for;
      else
         res := sum(f(var),var=lo..hi);
         res := adjustPiecewises(res);
      end_if;
   elif isSymbol(range) or isScalar(range) then
      res := op_rangesum(f,1..range);
   else
      formatError(errorInappropriateExpression);
   end_if;
   res;
 end_proc:

basefuncs::op_rangeproduct := proc(f,range)
 local var, lo, hi, res, i;
 begin
   checkArgs(procname, args(0), 2);
   var:=functionArgs(f); // op(f,1);
   if testtype(range,"_range") then
      if (nops(var) <> 1) then internalError("Ill-formed function."); end_if;
      range := fixupRange(range);
      lo := op(range,1);
      hi := op(range,2);
      if isScalar(lo) and isScalar(hi) then
         // This branch to force it use a normal iteration is due to 
         // Bug # 061201-172412, which was for sums, but I wanted to
         // make work symmetrically for products. -kmp 20-Apr-2007
         checkInteger(lo);
         checkInteger(hi);
         res := 1;
         for i from lo to hi do
            res := res * f(i);
         end_for;
      else
         res := product(f(var),var=lo..hi);
         res := adjustPiecewises(res);
      end_if;
   elif isSymbol(range) or isScalar(range) then
      res := op_rangeproduct(f,1..range);
   else
      formatError(errorInappropriateExpression);
   end_if;
   res;
 end_proc:

// ==================== Limits ====================

basefuncs::op_limit := proc(f,val)
 local var;
 begin
   checkArgs(procname, args(0), 2);
   var:=functionArgs(f); // op(f,1);
   if (nops(var) <> 1) then internalError("Ill-formed function."); end_if;
   fixupLimit(limit(f(var),var=val,Real));
 end_proc:

basefuncs::op_limitleft := proc(f,val)
 local var;
 begin
   checkArgs(procname, args(0), 2):
   var:=functionArgs(f): // op(f,1):
   if (nops(var) <> 1) then internalError("Ill-formed function."); end_if;
   fixupLimit(limit(f(var),var=val,Left)):
 end_proc:

basefuncs::op_limitright := proc(f,val)
 local var, result;
 begin
   checkArgs(procname, args(0), 2):
   var:=functionArgs(f); // op(f,1):
   if (nops(var) <> 1) then internalError("Ill-formed function."); end_if;
   fixupLimit(limit(f(var),var=val,Right));
 end_proc:

// ==================== Derivatives ====================

basefuncs::op_deriv_1 := proc(f,p)
 local res;
 begin
   checkArgs(procname, args(0), 2);
   // res:=D(f)(p);
   // if has(res,hold(D)) then
   //   procname(args());
   // else
   //   res;
   // end_if;
   op_deriv_n(f,1,p);
 end_proc:

basefuncs::op_deriv_2 := proc(f,p)
 local res;
 begin
   checkArgs(procname, args(0), 2);
   op_deriv_n(f,2,p);
 end_proc:

basefuncs::op_deriv_3 := proc(f,p)
 local res;
 begin
   checkArgs(procname, args(0), 2);
   op_deriv_n(f,3,p);
 end_proc:

basefuncs::op_deriv_4 := proc(f,p)
 local res;
 begin
   checkArgs(procname, args(0), 2);
   op_deriv_n(f,4,p);
 end_proc:

basefuncs::op_deriv_5 := proc(f,p)
 local res;
 begin
   checkArgs(procname, args(0), 2);
   op_deriv_n(f,5,p);
 end_proc:

basefuncs::op_deriv_n := proc(f,n,p)
 local res, vars, var, e;
 begin
   checkArgs(procname, args(0), 3);
   if isInteger(n) then                  // only do slow test in non-integer case
      checkNonNegativeInteger(n);
   else
      if isConstantExp(n) then             // make sure there are no unknowns left, since d^n/dx^n is ok
         checkNonNegativeInteger(n);     // ok, NOW complain if it's not a positive integer
      end_if;
   end_if;
   res := (D@@n)(f)(p);
   if has(res,hold(D(_plus))) then // Workaround for Bug # 070315-231532
                                   // This code would probably work generally,
                                   // but at this late date I'll use it only in the
                                   // failing case for code stability reasons. -kmp 25-Apr-2007
      vars := [functionArgs(f)];
      if nops(vars)<>1 then
         internalError("wrong number of vars to op_deriv_n");
      end_if;
      var := op(vars,1);
      res := evalAt(diff(f(var),var$n),var=p);
   end_if;
   res := misc::maprec(res,isExtendedD=fixupExtendedD,Unsimplified);
   // print("op_deriv_n(",f,n,p,") returning",res);
   res := adjustPiecewises(res);
   res;
 end_proc:

// ==================== Integrals ====================

basefuncs::mc_integral_:=proc(ignored_tol,ignored_callback,func,lower,upper,ignored_tag)
 save evalFloatNow;
 local main, var, action, raw_action, result, opts, mcfloating, alt;
 begin
   checkArgs(procname, args(0), 5, 6):
   opts := _exprseq();
   if not (optionIntegrateChecksDiscontinuities in {TRUE, hold(DEFINITE)}) then
      opts := opts,hold(Continuous);
   end_if;
   if optionIntegrateUsesCauchyPrincipalValue then
      opts := opts,hold(PrincipalValue);
   end_if;
   // print("mc_integral_ opts=",opts);
   var:=functionArgs(func); //op(func,1);
   lower:=fixupProcs(lower);
   upper:=fixupProcs(upper);
   // No point in fixing up var or func prior to calling eval,
   // so just fixup main and var after.
   main:= func(var);
   // print("Going to evaluate ",main);
   main := eval(main);
   // print("Result of evaluation= ",main);
   main:=fixupProcs(main);
   var:=fixupProcs(var);
   // print("optionUseMcFloats"=optionUseMcFloats,"evalFloatNow"=evalFloatNow);
   mcfloating := FALSE;
   if not evalFloatNow then
      // This test helps bugs like #070305-162734, 
      // which were not using numerical methods
      // even though floats were involved.
      // Also added tests for mcfloat as both "more of same" 
      // and in partial service of Bug # 060511-143551.
      if stdlib::hasfloat(main)  or hastype(main,mcfloat)  or
         stdlib::hasfloat(lower) or hastype(lower,mcfloat) or
         stdlib::hasfloat(upper) or hastype(upper,mcfloat)
      then
         evalFloatNow := TRUE;
      end_if;
   end_if;
   // print("integrating",main,"lower"=lower,"upper"=upper);
   if optionUseMcFloats and evalFloatNow then
      mcfloating := TRUE;
      // mcfloats may trip up this algorithm, so use regular ones when doing evalFloat
      // print("mcfloating","lower"=lower,"upper"=upper,"main"=main);
      lower := unmcfloat(lower);
      upper := unmcfloat(upper);
      main  := unmcfloat(main);
      // print("mcfloated",main,"lower"=lower,"upper"=upper);
   end_if;
   // print("mc_integral_ going to integrate",main,"wrt",var,"from",lower,"to",upper, "options=",opts);
   if isNotReal(lower) or isNotReal(upper) then
      formatError(errorNotReal);
   end_if;
   if evalFloatNow 
      and (numeric::indets(main) minus {var}) = {} // e.g., for Bug # 070227-145542 and 060615-171547
   then
      action := hold(numeric::int)(main, var=lower..upper);
   else
	   action := hold(int)(main, var=lower..upper, opts):
   end_if;
   raw_action := action;
   action := attachAssumptions(raw_action,realityCheck(lower,upper));
   // print("action is",action);
   if traperror(( result := eval(action) ))<>0 then
      // print("failed with",action,"trying",raw_action);
      result := eval(raw_action);
   end_if;
   // print("result=",result);

   traperror(
      if not optionFully and not optionRaw then 
         if op(result,0) = hold(int) then
            if iszero(op(result,1) - main) then
               if op(result,2) = (var=lower..upper) then
                  alt := int(main,var);
                  if not has(alt,hold(int)) then
                     result := evalAt(alt,{var=upper})-evalAt(alt,{var=lower});
                  end_if;
               end_if;
            end_if;
         end_if;
      end_if
   );

   // print("mc_integral_ got",result);
   result := 
// // Removed per Bug # 060817-112744, e.g., consider diff( int( dg(x,y), x=0..y), y )
//
//   if has(result,hold(int)) then
//      procname(args()); // no need to fixupProcs here, since we're returning orig args
//   else
//      unfixupProcs(result);
//   end_if;
   unfixupProcs(result);
   result := adjustPiecewises(result, raw_action);
   if mcfloating then
      result := mcfloat(result);
   end_if;
   // print("mc_integral_ returning",result);
   result;
 end_proc:

basefuncs::op_indef_integral := proc(func,pt)
 local var, main, result, opts, floating, raw_action;
 begin
   checkArgs(procname, args(0), 2):
   opts := _exprseq();
   if not (optionIntegrateChecksDiscontinuities in {TRUE, hold(INDEFINITE)}) then
      opts := opts,hold(Continuous);
   end_if;
   var:=functionArgs(func); // op(func,1);
   // print("op_indef_integral (raw)","func"=func,"var"=var);
   main:=func(var);
   // print("Going to evaluate ",main);
   main:=eval(main); // added an eval here to make it symmetric with definite integral procedure above. -kmp 11-Aug-2006
   // print("op_indef_integral (raw)","main"=main,"var"=var);
   main:=fixupProcs(main);
   var:=fixupProcs(var);
   floating := FALSE;
   if optionUseMcFloats and evalFloatNow and 
      hastype(main,mcfloat) then
      floating := TRUE;
      // mcfloats may trip up this algorithm, so use regular ones when doing evalFloat
      // print("mcfloating","main"=main);
      main  := unmcfloat(main);
      // print("mcfloated","main"=main);
   end_if;

   raw_action:=hold(int)(main,var);
   // print("op_indef_integral (fixedup)","main"=main,"var"=var, "options=", opts);
   result:=int(main, var, opts); // checkNotOp(..., {procname,int}); // check removed per Bug # 060816-142529
   // print("op_indef_integral (result)","result"=result);
   result:=unfixupProcs(result);
   // Per Bug # 060720-182318, filter the results to remove overly detailed
   // cases in the non-fully case.
   result:=adjustPiecewises(result, raw_action);
   // Leopold 2007-01-04
   // Fix for bug 070104-151356 which also serves as an alternate
   // fix for bug 060908-153528.
   if var <> pt then
      result:=subs(result,var=pt);
   end_if;
   // print("op_indef_integral (result unfixedup)","result"=result);
   if floating then
      result := mcfloat(result);
   end_if;
   result;
 end_proc:

 // Specific integral patterns

 // From bug 001031-104119
 FI1_ := proc(x,k) begin sqrt((x-k)/x)*x + arctanh(sqrt((x-k)/x))*k end_proc:
 int::addpattern((1-1/x*k)^(-1/2),x=a..b,FI1_(b,k)-FI1_(a,k),[k,a,b]):

// ==================== Trig and HyperGeometric ====================

basefuncs::mcad_sin := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(sin(x)); end_proc:
basefuncs::mcad_cos := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(cos(x)); end_proc:
basefuncs::mcad_tan := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(tan(x)); end_proc:
basefuncs::mcad_sec := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(sec(x)); end_proc:
basefuncs::mcad_csc := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(csc(x)); end_proc:
basefuncs::mcad_cot := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(cot(x)); end_proc:
basefuncs::mcad_arcsin := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arcsin(x)); end_proc:
basefuncs::mcad_arccos := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arccos(x)); end_proc:
basefuncs::mcad_arctan := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arctan(x)); end_proc:
basefuncs::mcad_arccsc := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arccsc(x)); end_proc:
basefuncs::mcad_arcsec := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arcsec(x)); end_proc:
basefuncs::mcad_arccot := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arccot(x)); end_proc:
basefuncs::mcad_sinh := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(sinh(x)); end_proc:
basefuncs::mcad_cosh := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(cosh(x)); end_proc:
basefuncs::mcad_tanh := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(tanh(x)); end_proc:
basefuncs::mcad_sech := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(sech(x)); end_proc:
basefuncs::mcad_csch :=proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(csch(x)); end_proc:
basefuncs::mcad_coth :=proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(coth(x)); end_proc:
basefuncs::mcad_arcsinh := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arcsinh(x)); end_proc:
basefuncs::mcad_arccosh := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arccosh(x)); end_proc:
basefuncs::mcad_arctanh := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arctanh(x)); end_proc:
basefuncs::mcad_arccsch := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arccsch(x)); end_proc:
basefuncs::mcad_arcsech := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arcsech(x)); end_proc:
basefuncs::mcad_arccoth := proc(x) begin checkArgs(procname, args(0), 1); mcSimplifyFast(arccoth(x)); end_proc:

basefuncs::mcad_atan2 := proc(x, y)
 begin
   checkArgs(procname, args(0), 2);
   // Mathcad wants results in the lower-exclusive interval (-PI, PI].
   // MuPAD's arctan(y/x) would return results in the range (-PI/2, PI/2).
   // So we won't use that.  MuPAD's arg documents that it will exactly
   // do the right range.
   mcSimplifyFast2(arg(x,y)); // formerly Simplify, changed per Bug # 060914-123737
 end_proc:

basefuncs::mcad_sinc := proc(x) 
 begin
   // Fix to zero checking per Bug # 070322-212116
   if iszero(x) or is(x=0)=TRUE 
   then 1
      
   else mcSimplifyFast2(sin(x)/x); // formerly Simplify, changed per Bug # 060914-123737

// Possible alternate code that might later be used to address Bug # 070322-222621
//   elif isScalarExp(x) or is(x=0)=FALSE 
//   then mcSimplifyFast2(sin(x)/x);
//   else hold(mcad_sinc)(x);
   end_if;
 end_proc:

// ====================

basefuncs::mcad_erf     := proc(x) begin checkArgs(procname, args(0), 1); erf(x);      end_proc:
basefuncs::mcad_erfc    := proc(x) begin checkArgs(procname, args(0), 1); erfc(x);     end_proc:
basefuncs::mcad_Zeta    := proc(x) begin checkArgs(procname, args(0), 1); zeta(x);     end_proc:
basefuncs::mcad_dilog   := proc(x) begin checkArgs(procname, args(0), 1); dilog(x);    end_proc:

basefuncs::mcad_polylog := proc(n, x) begin checkArgs(procname, args(0), 2); polylog(n, x); end_proc:

basefuncs::mcad_Psi    := proc(arg1, arg2=hold(Null))
 begin
   checkArgs(procname, args(0), 1, 2);
   if arg2 = hold(Null) then
      psi(arg1);
   else
      psi(arg2, arg1);
   end_if;
 end_proc:

basefuncs::mcad_beta := proc(x,y)
 begin
   checkArgs(procname, args(0), 2);
   beta(x,y);
 end_proc:

basefuncs::mcad_hypergeom := proc(upper,lower,z)
 begin
   checkArgs(procname, args(0), 3);
   // We require this as part of the primitive syntax.
   if isMatrix(upper) and
      isMatrix(lower) then
      if linalg::ncols(upper) <> 1 or
         linalg::ncols(lower) <> 1 then
         formatError(errorBadSyntax);
      end_if;
      hypergeom(matrixElements(upper), matrixElements(lower), z);
    else
      // Hands off if we don't get the precise structure we want.
      // We must wait for a Mathcad data structure to come in,
      // we can't translate to a hypergeom(...) here or else we'll
      // lose the fact that we expect a matrix, not a list.
      hold(mcad_hypergeom)(upper, lower, z);
   end_if;
 end_proc:

basefuncs::mcad_combin := proc(x, y) begin checkArgs(procname, args(0), 2); binomial(x, y); end_proc:

// ==================== Logs and Exponentials ====================

basefuncs::mcad_fact2 := proc(z)
 begin
   checkArgs(procname, args(0), 1):
   fact2(z);
 end_proc:

basefuncs::mcad_exp_scalar := proc(z)
 begin
   checkArgs(procname, args(0), 1):
   exp(z);
 end_proc:

basefuncs::mcad_log_scalar := proc(log_expr, log_base = Null)
   // N.B.: Args for this function and args for MuPAD's function are reversed
   //       from one another:  Mathcad takes base last, NOT first.
 begin
   log_base := defaultArgument(log_base, 10);
   checkArgs(procname, args(0), 1, 2):
   // MuPAD doesn't match log very well, so re-express in terms of ln
   // And anyway, this treatment of log is compatible with previous versions of Mathcad.
   // Refer to Bug # 060828-135035
   ln(log_expr)/ln(log_base); // i.e., log(log_base, log_expr); // MuPAD uses reversed args
 end_proc:

basefuncs::mcad_ln_scalar := proc(z)
 begin
   checkArgs(procname, args(0), 1):
   ln(z);
 end_proc:

basefuncs::mcad_ln0_scalar := proc(z)
 begin
   checkArgs(procname, args(0), 1):
   // Fix to zero checking per Bug # 070322-212116
   if iszero(z) or is(z=0)=TRUE 
   then -infinity
   else  mcSimplifyFast2(ln(z)); // formerly Simplify, changed per Bug # 060914-123737

// Possible alternate code that might later be used to address Bug # 070322-222621
//   elif isScalarExp(z) or is(x=0)=FALSE
//   then mcSimplifyFast2(ln(z))
//   else hold(mcad_ln0)(z);

   end_if;

 end_proc:

basefuncs::mcad_exp := vectorMapper(mcad_exp_scalar):
basefuncs::mcad_log := vectorMapper(mcad_log_scalar):
basefuncs::mcad_ln  := vectorMapper(mcad_ln_scalar):
basefuncs::mcad_ln0 := vectorMapper(mcad_ln0_scalar):

// ==================== Bessel Functions ====================

// NOTE: In MAPLE, we said exp(xxx) for the scaled versions instead of E^(xxx), 
//       but MuPAD seems to not simplify exp(n)/exp(m) into a single exp(n-m)
//       while it DOES simplify E^n/E^m into E^(n-m), so it seems better
//       to use the E^(xxx) form here to get simpler results, since one
//       of the reasons JLawrence mentioned to me that people would use
//       scaled functions is to compare ratios like J0.sc(x)/J0.sc(y),
//       which is going to produce a result with exponentials above and
//       below the line that should be canceling, but that won't cancel
//       if exp(n)/exp(m) doesn't reduce. -kmp 21-Feb-2006

basefuncs::mcad_I0 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselI(0, z))(z); end_proc:
basefuncs::mcad_I1 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselI(1, z))(z); end_proc:
basefuncs::mcad_In := proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselI(preferInteger(m), z))(z); end_proc:

basefuncs::mcad_J0 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselJ(0, z))(z); end_proc:
basefuncs::mcad_J1 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselJ(1, z))(z); end_proc:
basefuncs::mcad_Jn := proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselJ(preferInteger(m), z))(z); end_proc:

basefuncs::mcad_K0 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselK(0, z))(z); end_proc:
basefuncs::mcad_K1 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselK(1, z))(z); end_proc:
basefuncs::mcad_Kn := proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselK(preferInteger(m), z))(z); end_proc:

basefuncs::mcad_Y0 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselY(0, z))(z); end_proc:
basefuncs::mcad_Y1 := proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselY(1, z))(z); end_proc:
basefuncs::mcad_Yn := proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselY(preferInteger(m), z))(z); end_proc:

// --- Scaled Bessel Functions ---

basefuncs::mcad_J0_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselJ(0,z)               *E^(-abs(Im(z))))(z); end_proc:
basefuncs::mcad_J1_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselJ(1,z)               *E^(-abs(Im(z))))(z); end_proc:
basefuncs::mcad_Jn_scaled:=proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselJ(preferInteger(m),z)*E^(-abs(Im(z))))(z); end_proc:

basefuncs::mcad_Y0_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselY(0,z)               *E^(-abs(Im(z))))(z); end_proc:
basefuncs::mcad_Y1_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselY(1,z)               *E^(-abs(Im(z))))(z); end_proc:
basefuncs::mcad_Yn_scaled:=proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselY(preferInteger(m),z)*E^(-abs(Im(z))))(z); end_proc:

basefuncs::mcad_I0_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselI(0,z)               *E^(-abs(Re(z))))(z); end_proc:
basefuncs::mcad_I1_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselI(1,z)               *E^(-abs(Re(z))))(z); end_proc:
basefuncs::mcad_In_scaled:=proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselI(preferInteger(m),z)*E^(-abs(Re(z))))(z); end_proc:

basefuncs::mcad_K0_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselK(0,z)               *E^(z))(z); end_proc:
basefuncs::mcad_K1_scaled:=proc(z)   begin checkArgs(procname, args(0), 1); vectorMapper(z->besselK(1,z)               *E^(z))(z); end_proc:
basefuncs::mcad_Kn_scaled:=proc(m,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselK(preferInteger(m),z)*E^(z))(z); end_proc:

// --- Spherical Bessel Functions ---
// Note that these have no scaled form.

basefuncs::mcad_js:=proc(n,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->sqrt(PI/(2*z))*besselJ(n+(1/2),z))(z); end_proc:
basefuncs::mcad_ys:=proc(n,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->sqrt(PI/(2*z))*besselY(n+(1/2),z))(z); end_proc:

// ==================== Hankel Functions ====================

// NOTE WELL:
//  The MC13.0 documentation offers the formulas for scale factors for H1.sc and H2.sc,
//  the scaled variants of H1 and H2, as:
//    exp( (3-2*m)*z*I) for H1 [which is just wrong] and
//    exp(-(3-2*m)*z*I) for H2 [which is the formula for H2, except that the m is not the first argument].
//  Really these functions are H[m](n,z) where the right formula for both H1 and H2,
//  that is, for H[1] and H[2] is exp(-(3-2*m)*z*I) where m is the subscript, not the arg.
//  That reduces to exp(-(3-2*1)*z*I) = exp(-z*I) for H1 and exp(-(3-2*2)*z*I) = exp(z*I) for H2.
//  The following definitions reflect that, and seem to yield results consistent with
//  the numerics versions of these functions.  Mail has been sent to documentation folks asking for a fix to the doc.
//  -kmp 22-Feb-2006

basefuncs::mcad_H1:=proc(n,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselJ(n,z) + I*besselY(n,z))(z); end_proc:
basefuncs::mcad_H2:=proc(n,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->besselJ(n,z) - I*besselY(n,z))(z); end_proc:

basefuncs::mcad_H1_scaled:=proc(n,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->mcad_H1(n,z)*E^(-z*I))(z); end_proc:
basefuncs::mcad_H2_scaled:=proc(n,z) begin checkArgs(procname, args(0), 2); vectorMapper(z->mcad_H2(n,z)*E^( z*I))(z); end_proc:

// ==================== Airy Functions ====================

basefuncs::mcad_Ai         := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyAi(z, 0))(z); end_proc:
basefuncs::mcad_Bi         := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyBi(z, 0))(z); end_proc:

basefuncs::mcad_Ai_scaled  := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyAi(z, 0)*E^(        2/3*z^(3/2)  ))(z); end_proc:
basefuncs::mcad_Bi_scaled  := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyBi(z, 0)*E^(-abs(Re(2/3*z^(3/2)))))(z); end_proc:

basefuncs::mcad_DAi        := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyAi(z, 1))(z); end_proc:
basefuncs::mcad_DBi        := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyBi(z, 1))(z); end_proc:

basefuncs::mcad_DAi_scaled := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyAi(z, 1)*E^(        2/3*z^(3/2)  ))(z); end_proc:
basefuncs::mcad_DBi_scaled := proc(z) begin checkArgs(procname, args(0), 1); vectorMapper(z->airyBi(z, 1)*E^(-abs(Re(2/3*z^(3/2)))))(z); end_proc:

// Wrong scale factor documented. Sigh.
// basefuncs::mcad_Ai_scaled:=proc(z) begin checkArgs(procname, args(0), 1); airyAi(z, 0)*E^(-abs(Im(z))); end_proc:
// basefuncs::mcad_Bi_scaled:=proc(z) begin checkArgs(procname, args(0), 1); airyBi(z, 0)*E^(-abs(Im(z))); end_proc:

// ==================== Other Functions (Most Relating to Special Integrals) ====================

basefuncs::mcad_FresnelC := proc(z)             begin checkArgs(procname, args(0), 1); vectorMapper(z->   fresnelC(z))(z);      end_proc:
basefuncs::mcad_FresnelS := proc(z)             begin checkArgs(procname, args(0), 1); vectorMapper(z->   fresnelS(z))(z);      end_proc:

// cosine integral
basefuncs::mcad_Ci       := proc(z)             begin checkArgs(procname, args(0), 1); vectorMapper(z->   Ci(z))(z);            end_proc:

// sine integral
basefuncs::mcad_Si       := proc(z)             begin checkArgs(procname, args(0), 1); vectorMapper(z->   Si(z))(z);            end_proc:

// hyperbolic cosine integral
basefuncs::mcad_Chi      := proc(z)             begin checkArgs(procname, args(0), 1); vectorMapper(z->   Chi(z))(z);           end_proc:

// hyperbolic sine integral
basefuncs::mcad_Shi      := proc(z)             begin checkArgs(procname, args(0), 1); vectorMapper(z->   Shi(z))(z);           end_proc:

// exponential integral

basefuncs::mcad_Ei_scalar := proc(optional_k, required_z)
 local k, z;
 begin
   // These formulas were given by the MuPAD documentation.
   if args(0) = 1 then
      z := args(1);
      // 
      if isNotReal(z) then
         // Check added per Bug # 060616-124954
         error(errorNotReal);
      end_if;
      // In the one-arg case, compute the Cauchy Principal Value (for real z)
      -Re(Ei(-z));
   else
      k := args(1);
      z := args(2);
      // In the two-arg case, compute int(e^(-z*t)/t^k,t=1..infinity)
      // using this formula:
      z^(k-1)*igamma(1-k,z);
   end_if;
 end_proc:

basefuncs::mcad_Ei := proc(optional_k, z)
 begin
   checkArgs(procname, args(0), 1, 2);
   vectorMapper(mcad_Ei_scalar)(args());
 end_proc:

basefuncs::mcad_LambertW := proc(optional_k, z)
 begin
   checkArgs(procname, args(0), 1, 2);
   vectorMapper(lambertW)(args());
 end_proc:

// Elliptic Integrals
// Args:
//   m is the "parameter"
//   phi is the "amplitude"
//   n is the "characteristic"

basefuncs::mcad_EllipticK   := proc(m)
 begin
   checkArgs(procname, args(0), 1);
   vectorMapper(ellipticK)(args());
 end_proc:

basefuncs::mcad_EllipticCK  := proc(m) 
 begin
   checkArgs(procname, args(0), 1);
   vectorMapper(ellipticCK)(args());
 end_proc:

basefuncs::mcad_EllipticF   := proc(phi, m) 
 begin
   checkArgs(procname, args(0), 2);
   vectorMapper(ellipticF)(args());
 end_proc:

basefuncs::mcad_EllipticE   := proc(optional_phi, required_m)
 begin
   // Default phi, if omitted, is PI/2
   checkArgs(procname, args(0), 1, 2);
   vectorMapper(ellipticE)(args());
 end_proc:

basefuncs::mcad_EllipticCE  := proc(m)
 begin
   checkArgs(procname, args(0), 1);
   vectorMapper(ellipticCE)(args());
 end_proc:

basefuncs::mcad_EllipticPi  := proc(required_n, optional_phi, required_m)
 begin
   // Default phi, if omitted, is PI/2
   checkArgs(procname, args(0), 2, 3);
   vectorMapper(ellipticPi)(args());
 end_proc:

basefuncs::mcad_EllipticCPi := proc(n, m)
 begin
   checkArgs(procname, args(0), 2);
   vectorMapper(ellipticCPi)(args());
 end_proc:

// ==================== Equation Solving ====================

// This is the function used by symbolic solve blocks.
basefuncs::op_solve := proc(IGNORED_opts,IGNORED_tol,IGNORED_ctol,is_minerr,IGNORED_objective,IGNORED_num_guess,IGNORED_iguess,
                            IGNORED_num_constraints,constraints,senses,
                            IGNORED_mip,IGNORED_fmt,IGNORED_callback,IGNORED_is_max)
 local unknowns,res,subsin,subsout,eqns,unk,rawres,nC,sense_fns,sense,sense_fn;
 begin
   unknowns := [functionArgs(constraints[1])];
   nC := nops(constraints);
   if nC <> nops(senses) then
      internalError("mismatched constraints");
   end_if;
   sense_fns := _exprseq();
   for sense in senses do
      // Per fixes to Bug # 040825-123613, we now expect 5 of the 6 senses.
      // In fact, "N" won't be sent to us unless there's more work on the
      // front end, but there's no reason not to support it if it does get sent.
      if   sense = "E" then 
         sense_fn := v->( v=0 );
      elif sense = "G" then
         sense_fn := v->( v>=0 );
      elif sense = "g" then
         sense_fn := v->( v>0 );
      elif sense = "L" then
         sense_fn := v->( v<=0 );
      elif sense = "l" then
         sense_fn := v->( v<0 );
      elif sense = "N" then
         sense_fn := v->( v<>0 );
      else
         error(errorInvalidSolveConstraint);
      end_if;
      sense_fns := sense_fns, sense_fn;
   end_for;
   sense_fns := [sense_fns];
   eqns := 
   proc(unknowns)
    local i, eqns, sense_fn, constraint_fn;
    begin
      eqns := _exprseq();
      for i from 1 to nC do
         sense_fn := op(sense_fns,i);
         constraint_fn := op(constraints,i);
         eqns := eqns, sense_fn(constraint_fn(op(unknowns)));
      end_for;
      [eqns];
    end_proc;

   res := op_solve_internal(eqns, unknowns, bool(is_minerr=1));

   res := maybeTransposeSolveBlockResult(res); // yuck
   
   res;
 end_proc:

basefuncs::op_solve_internal := proc(eqns_func, unknowns, is_minerr = FALSE)
 local subsin, subsout, u, v, res, errcode, temp, assumptions;
 begin

   // print("op_solve_internal","eqns_func=",eqns_func,"unknowns=",unknowns, "retry_on_failure"=retry_on_failure);
   // print("is_minerr=",is_minerr);
   
   subsin   := _exprseq();
   subsout  := _exprseq();
   
   for u in unknowns do
      
      if isSymbol(u) and ((eval(u)<>u) or (float(u)<>u)) then
         v       := UNKNOWN_.u;
         subsin  := subsin,u=v;
         subsout := subsout,v=u;
      end_if;
      
   end_for;
   
   subsin   := [subsin];
   subsout  := [subsout];
   
   unknowns := fixupProcs(subs(unknowns,subsin));
   eqns     := fixupProcs(eqns_func(unknowns));

   // print("trying(1)");
   errcode  := traperror((res := op_solve_internal2(eqns, unknowns, is_minerr, subsout, [])));

   // print("errcode(1)"=errcode);

   if errcode = 0 then
      // print("using good result 1",res);
      return(res);
   end_if;
     
   // print("separating eqns",expr2text(eqns));
   
   temp := separateAssumptions(eqns);
   
   // print("separated",temp);
   
   eqns        := op(temp,1);
   assumptions := op(temp,2);
   
   // print("new eqns",eqns,"assumptions",assumptions);
   
   // Rather than prematurely signal an error if nops(assumptions)=0,
   // causing Bug # 070430-214121, instead just skip this step and go
   // to step 3 below, which some users rely on ... i.e., just falls through
   // to a numeric attempt.
   if nops(assumptions) > 0 then
     
      // print("retrying(2)");
      errcode  := traperror((res := op_solve_internal2(eqns, unknowns, is_minerr, subsout, assumptions)));

      // print("errcode(2)"=errcode);

      if errcode = 0 then
         // print("using good result 2");
         return(res);
      end_if;

   else

      // print("no assumptions, so no retry(2)");

   end_if;

   // print("retrying(3)");
   errcode  := traperror((res := op_solve_internal2(eqns, unknowns, is_minerr, subsout, assumptions, TRUE)));

   // print("errcode(3)"=errcode);

   if errcode = 0 then
      // print("using good result 3");
      return(res);
   end_if;

   processLastMuPADError(errorNoSolveSolution);

 end_proc:

basefuncs::op_solve_internal2 := proc(eqns, unknowns, is_minerr, subsout, assumptions, numerically = FALSE)
 local solver, rawres, res;
 begin
   // print("op_solve_internal2 got",eqns,unknowns,is_minerr,subsout,assumptions);

   if is_minerr then
      if numerically then
         return(FAIL); // we don't have a numeric method for minerr set up right now.  
                       // don't waste time repeating a solve we probably already tried.
      else
         solver := hold(mcMinerr)(eqns,unknowns);
      end_if;
   else
      if numerically then
         solver := hold(numeric::solve)(eqns,unknowns);
      else
         solver := hold(mcSolve)(eqns,unknowns);
      end_if;
   end_if;

   if nops(assumptions) > 0 then
      solver := attachAssumptions(solver,assumptions);
   end_if;

   // print("op_solve_internal2 trying",solver);

   rawres := eval(solver);

   if (rawres = FAIL) or op(rawres,0) = hold(solve) then
//    if optionSolveTryNumeric then
//       rawres := evalFloat(hold(solve)(eqns,unknowns));
//    end_if;
//    if (rawres = FAIL or op(rawres,0) =hold(solve)) then
         formatError(errorNoSolveSolution);
//    end_if;
   end_if;
   // print("solve rawres",rawres);
   // print("op_solve_internal raw result",rawres);
   res := FAIL;
   if isInequality(eqns) then
      // print("trying to process result as inequality");
      // This might return FAIL if it can't come up with 
      // a good inequality answer.
      res := processSolveInequality(unknowns,rawres);
      // print("processed inequalty",res);
   end_if;
   if res = FAIL then
      // print("trying to process result normally",res);
      res := processSolveResults(rawres);
      // print("processed normally",res);
   end_if;
   // print("op_solve_internal cooked result",res);
   res:=subs(unfixupProcs(res),subsout);
   // print("op_solve_internal returning fixed up result",res);
   res;
 end_proc:

basefuncs::mc_root := proc() // 2-arg form of mc_root
 begin
   formatError(errorRootNotSymbolic);
 end_proc:

basefuncs::mc_root_bracket_ := proc(ignored_TOL, func, lo, hi)
 local var, expr, temp, res;
 begin
   checkArgs(procname, args(0), 4);
   var:=functionArgs(func,1); 
   expr:=func(var);
   if isEquation(expr) then formatError(errorBadSyntax); end_if;
   if isProc(expr) then
      temp := procName(expr);
      if testtype(temp,DOM_NULL) then
         // truly anonymous procedure - no name
         formatError(errorBadSyntax);
      elif testtype(temp,DOM_IDENT) then
         temp := expr2text(temp);
         if stringlib::pos(temp,"_")=FAIL then
            // mostly anonymous procedure - name is not qualified nor mangled
            // since all mangled symbols have at least one "_"
            formatError(errorBadSyntax);               
         end_if;
      end_if;
   end_if;
   // Per bug # 060928-114921, make sure that bounds can occur backwards, 
   // since the numerics root function tolerates this.
   temp := fixupRange(lo..hi);
   lo := op(temp,1);
   hi := op(temp,2);
   //Solve changed to take args as a func, not expr+var,
   //but this function wasn't updated, causing Bug # 060224-123838.
   temp := attachAssumptions(hold(keyword_solve)(func),
                             // Bug fix for #060925-220008
                             [op_geq(var,lo),op_leq(var,hi)]);
   res:=eval(temp);
   res;
 end_proc:

// ==================== Subscripts ====================
// Note: In most situations, subscripts are handled by
// the MPL functions symsubscript1 and symsubscript2.
// Sometimes, however, they do make their way down to
// the symbolic processor.

basefuncs::symsubscript1 := proc(M,i,origin)
 begin
   checkArgs(procname, args(0), 3):
   // Check for DOM_PROC separately; if we let isMatrix
   // do it, MuPAD may crash.
   if domtype(M) = DOM_PROC then
      formatError(invalid_subscript);
   elif isMatrix(M) and isInteger(i) then 
      M[i-origin+1];
   elif isScalar(M) or isString(M) then
      error(errorNotMatrix);
   elif isNotInteger(i) then
      error(errorNotInteger);
   else
      hold(symsubscript1)(args());
   end_if;
 end_proc:

basefuncs::symsubscript2 := proc(M,i,j,origin)
 begin
   checkArgs(procname, args(0), 4):
   // Check for DOM_PROC separately; if we let isMatrix
   // do it, MuPAD may crash.
   if domtype(M) = DOM_PROC then
      formatError(invalid_subscript);
   elif isMatrix(M) and isInteger(i) and isInteger(j) then 
      M[i-origin+1,j-origin+1];
   elif isScalar(M) or isString(M) then
      error(errorNotMatrix);
   elif isNotInteger(i) or isNotInteger(j) then
      error(errorNotInteger);
   else
      hold(symsubscript2)(args());
   end_if;
 end_proc:

// Helper for vectorization of symbolic derivatives.
// Descends through an expression looking for
// subscripted occurrences of the given variable.
// Returns the greatest integer subscript found.
basefuncs::max_subscript := proc(expr,var)
 begin
   checkArgs(procname, args(0), 2, 2):
 
   if op(expr,0) = hold(symsubscript1) then
      if op(expr,1) = var and domtype(op(expr,2)) = DOM_INT then
         return(op(expr,2) - op(expr,3));
      end_if;
   end_if;

   if op(expr) = expr then 
      -1;
   elif nops(expr) = 1 then
      max_subscript(op(expr,1),var);
   else
      max(map(op(expr),max_subscript,var));
   end_if;

 end_proc:


// return value of loading this file
null():

// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
