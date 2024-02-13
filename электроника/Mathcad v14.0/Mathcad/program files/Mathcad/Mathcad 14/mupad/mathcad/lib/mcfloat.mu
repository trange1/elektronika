//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/releases/Mathcad_14.0.1/efi/efisymbolics-umgd/mupad/mathcad/lib/mcfloat.mu $
//*   $Revision:: 40                                                                      $
//*     $Author:: kpitman                                                                 $
//*       $Date:: 2007-05-02 15:27:57-04:00                                               $
//* $NoKeywords::                                                                         $
//*
//*  Purpose : Support for Mathcad floats ("mcfloats"), which are
//*            MAPLE-like floats that remember their own precision.
//*            That is, they manifestly represent the prevailing value
//*            of DIGITS at the time the floating point value was
//*            computed.
//*
//*  Notes:    This implementation began as a result of a phone 
//*            between Mathsoft and SciFace about how to make MuPAD more
//*            MAPLE-like in its treatment of floats.  In mail after the
//*            meeting, Kent Pitman sketched out the shape of an 
//*            implementation that he thought should generically work 
//*            in any object-oriented system, and SciFace responded later
//*            with this specific implementation based on his suggestion.
//*            The original implementation came from SciFace and then we've
//*            maintained and modified it at Mathsoft since then.
//*
//*            This code also extended by Kent Pitman to try to 
//*            handle complexes.
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//*
//****************************************************************************

mcfloat := newDomain("mcfloat"):
mcfloat::create_dom := hold(mcfloat):
mcfloat::info := "Library 'mcfloat': Domain support for Mathcad-style floats.":
mcfloat::interface := {}:

mcfloat::permit_fuzzy_zero := FALSE:

mcfloat::new := proc(rex, n=COMPUTED, iex=0.0)
 local result, x, r, i, p, z, ar, ai;
 save DIGITS, mcfloat;
 begin
   // print("enter mcfloat::new",domtype(rex),rex,n,domtype(iex),iex);
   if n = COMPUTED then
      n := DIGITS;
   end_if;
   DIGITS := n;
   if (testtype(rex,"function") and op(rex,0)=hold(mcfloat)) then
      // In some situations, we receive mcfloat(<float>, <prec>) unevaluated
      // as the argument to this function.  For Mathcad purposes, this will
      // always be a constant float and a constant precision, so we go ahead
      // and do the evaluation here in order to make sure we're dealing with
      // actual mcfloats. -kmp 09-Jun-2006
      if iszero(iex) then  // rather than (iex = 0 or iex = 0.0)
         return(eval(rex));
      else
         error("bad mcfloat"):
      end_if;
   elif rex::dom = dom then
      return(new(dom,dom::exprR(rex),dom::prec(rex),dom::exprI(rex)));
   end_if;
   // print("removing floats from rex within new","domtype(rex)"=domtype(rex));
   rex := misc::maprec(rex,{mcfloat}=((x)->mcfloat::mcfloat_to_float(x,n)),Unsimplified);
   // print("removing floats from iex within new","domtype(iex)"=domtype(iex));
   iex := misc::maprec(iex,{mcfloat}=((x)->mcfloat::mcfloat_to_float(x,n)),Unsimplified);
   // print("done removing floats within new");
   // coerce constants to their value and change integers to floats
   rex := float(rex);
   iex := float(iex);
   if rex::dom = DOM_COMPLEX then
      if (iex = 0.0) then
         iex := Im(rex);
         rex := Re(rex);
         n := DIGITS;
      else
         error("bad mcfloat");
      end_if;
   end_if;
   // These were here in the original implementation we got from SciFace,
   // but I think they belong at toplevel.  -kmp
   // mcfloat::domtype := () -> mcfloat;
   // mcfloat::type    := () -> mcfloat;
   // print("foo","domtype(rex)"=domtype(rex),"rex"=rex,"domtype(iex)"=domtype(iex),"iex"=iex);
   result := if (rex::dom = DOM_FLOAT) and (iex::dom = DOM_FLOAT) then
                if mcfloat::permit_fuzzy_zero then
                   ar := abs(rex);
                   ai := abs(iex);
                   if (ar < ai) then
                      if (ar > 0) then
                         if ar < ai/(10.0^n) then
                            rex := 0.0;
                         end_if;
                      end_if;
                   elif (ai < ar) then
                      if (ai > 0) then
                         if ai < ar/(10.0^n) then
                            iex := 0.0;
                         end_if;
                      end_if;
                   end_if;
                end_if;
                new(dom,rex,n,iex);
             elif iex=0 or iex=0.0 then
                misc::maprec(rex, {DOM_COMPLEX, DOM_FLOAT} = ((x) -> new(dom, Re(x), n, Im(x))), PostMap, Unsimplified);
             else
                error("bad mcfloat");
             end_if;
   // print("leave mcfloat::new",domtype(result),result);
   result;
 end_proc:

mcfloat::exprR := x -> extop(x, 1):
mcfloat::prec  := x -> extop(x, 2):
mcfloat::exprI := x -> extop(x, 3):

mcfloat::expr  := proc(x)
 local res;
 save DIGITS;
 begin
   DIGITS := mcfloat::prec(x);
   // print("in mcfloat::expr, bound digits to ",mcfloat::prec(x));
   res := DOM_COMPLEX(mcfloat::exprR(x),mcfloat::exprI(x));
   // print("value=",res);
   res;
 end_proc:

mcfloat::setprec := proc(x: mcfloat, prec: Type::PosInt)
 local oldexprR, oldprec, oldexprI, rxs, ixs, ret;
 save DIGITS;
 begin
   // print("enter mcfloat::setprec",domtype(x),x,prec);
   oldexprR  := dom::exprR(x);
   oldprec  := dom::prec(x);
   oldexprI := dom::exprI(x);
   if oldprec = prec then
      ret := x;
   elif oldprec >= prec then
      ret := new(dom, oldexprR, prec, oldexprI);
   else
      DIGITS := oldprec;
      // print("in mcfloat::setprec, bound digits to (oldprec) ",oldprec,"to save parts");
      rxs := expr2text(oldexprR);
      ixs := expr2text(oldexprI);
      DIGITS := prec;
      // print("in mcfloat::setprec, bound digits to (prec) ",prec," to construct number from saved parts");
      ret := new(dom, text2expr(rxs), prec, text2expr(ixs));
   end_if;
   // print("leave mcfloat::setprec",domtype(ret),ret);
   ret;
 end_proc:

mcfloat::print := proc(x: mcfloat)
 save DIGITS;
 local rex, iex;
 begin
   DIGITS := dom::prec(x);
   rex := mcfloat::exprR(x);
   iex := mcfloat::exprI(x);
   // print("in mcfloat::print, bound digits to (prec) ",dom::prec(x),"for display");
   stdlib::Exposed(expr2text(DOM_COMPLEX(rex,iex)));
 end_proc:

// ====================
// DISPLAY OF MCFLOATS

// Choice #1:
// Use this choice to make mcfloats print as floats.

// mcfloat::expr2text := FAIL;

// Choice #2:
// Use this choice to make mcfloats print as mcfloat(float, precision);

// mcfloat::expr2text := x -> "mcfloat(".expr2text(extop(x)).")":

mcfloat::expr2text := proc (x)
 save DIGITS;
 begin
   DIGITS := dom::prec(x);
   // print("in mcfloat::expr2text, bound digits to (prec) ",dom::prec(x),"for formatting");
   "mcfloat(".expr2text(extop(x)).")":
 end_proc:

// ====================

mcfloat::mcfloat_to_float := proc(m, p=COMPUTED)
 save DIGITS;
 local mp, mr, mi, msr, msi;
 begin
   if p = COMPUTED then
      p := DIGITS;
   end_if;
   if not testtype(m, mcfloat) then
      return(misc::maprec(m,{mcfloat}=((x)->mcfloat::mcfloat_to_float(x,p)),Unsimplified));
   end_if;
   mp := dom::prec(m);
   mr := dom::exprR(m);
   mi := dom::exprI(m);
   if mp < p then
      DIGITS := mp;
      // print("in mcfloat::expr2text, bound digits to mp=",mp,"for saving");
      msr := expr2text(mr);
      msi := expr2text(mi);
      DIGITS := p;
      // print("in mcfloat::expr2text, restored digits to p=",mp,"for float construction");
      DOM_COMPLEX(text2expr(msr),text2expr(msi));
   else
      DIGITS := p;
      // print("in mcfloat::expr2text, bound digits to p=",p,"for float construction");
      DOM_COMPLEX(mr,mi);
   end_if;
 end_proc:

mcfloat::func_call := x -> x:

// fake being DOM_FLOAT?
// mcfloat::domtype := () -> DOM_FLOAT:
// mcfloat::type := () -> DOM_COMPLEX: // formerly DOM_FLOAT, but now we implement complexes.

// These came from inside the "new" method above. -kmp
mcfloat::domtype := () -> mcfloat:
mcfloat::type    := () -> mcfloat:

mcfloat::testtype := proc (x, T)
 local res;
 begin
   res :=
   if x::dom = dom then 
      temp := dom::expr(x);
      if temp::dom = dom then
         // print("failed to convert ",x," to other type in testtype");
         FAIL;
      else
         testtype(temp, T)
      end_if;
	else
      FAIL
   end_if;
   res;
 end_proc:

// define some methods to avoid creation via make_slot 
mcfloat::evaluate:= FAIL:
mcfloat::posteval:= FAIL:
mcfloat::undefinedEntries := FAIL:
mcfloat::allEntries := FAIL:
mcfloat::whichEntry := FAIL:
mcfloat::new_extelement := FAIL:
mcfloat::create_dom_elem := FAIL:
mcfloat::Content:=FAIL:
mcfloat::MMLContent := FAIL:
mcfloat::Name := "mcfloat":
mcfloat::eval := FAIL:
mcfloat::slot:= FAIL:
mcfloat::indets:= FAIL:
mcfloat::bool := FAIL:
mcfloat::length := 1:
mcfloat::expose := FAIL:
mcfloat::hastype := FAIL:
mcfloat::maprec := FAIL:
mcfloat::Simplify := FAIL:
mcfloat::simplify := FAIL:
mcfloat::sortSums := FAIL:
mcfloat::enableMaprec := FALSE:
mcfloat::unfreeze := FAIL: // per Christopher Creutzig to fix Bug # 070307-111851
// again next 3 per CCR to at least partially address Bug # 060615-171547
mcfloat::_float_mult  := FAIL:
mcfloat::_float_plus  := FAIL:
mcfloat::_float_power := FAIL:

// ccr suggested this first fix for Bug # 070301-090520, 
// but I added the next two for consistency.
// This patch is later overridden, though, toward end of file by an experimental improvement.
mcfloat::laplace := FAIL:
mcfloat::fourier := FAIL:
mcfloat::ztrans := FAIL:

// ccr suggested this as a good idea.  There's no per se bug associated
// with this, but discussion was lumped in with email on Bug # 021107-111410.
mcfloat::maprec  := FAIL:

// Is this really right?? We got this from SciFace with it set to 1 when there were 2 ops.
mcfloat::nops := 1:

// This is what I'd prefer to do but I'm not sure it's right.
// I've sent email to SciFace inquiring.
//
// mcfloat::nops := 3:
// mcfloat::op := proc(/* computed */)
//  begin
//   extop(args())
//  end_proc:

// ---------- added by Kent ----------

// isNeg added per test case in bug # 021027-190338.
mcfloat::isNeg := generate::isNeg@mcfloat::expr:  

// numeric_rationalize added per test case in bug # 021027-190338.
// Note that additional support in mcutils was also needed,
// but that may be due to an unrelated bug.
mcfloat::numeric_rationalize := proc(x)
 save DIGITS;
 local res;
 begin
   DIGITS := mcfloat::prec(x);
   // print("mcfloat::numeric_rationalize bound digits to",DIGITS);
   res := numeric::rationalize(mcfloat::expr(x));
   res;
 end_proc:

mcfloat::_negate := proc(e: mcfloat) 
 begin
   extsubsop(e, 1=-extop(e,1), 3=-extop(e,3));
 end_proc:

mcfloat::complexity := proc(e: mcfloat)
 begin
   Simplify::complexity(expr(e));
 end_proc:

mcfloat::Re := proc(e: mcfloat)
 begin
   extsubsop(e, 3=0.0);
 end_proc:

mcfloat::Im := proc(e: mcfloat)
 begin
   extsubsop(e, 1=extop(e,3), 3=0.0);
 end_proc:

mcfloat::has := proc(e0: mcfloat, e1)
 begin
   case domtype(e1)
   of mcfloat     do if iszero(Im(e1)) then
                        bool(dom::exprR(e0)=dom::exprR(e1) or     // has(mcfloat(3.0+4.0*I),mcfloat(3.0))
                             dom::exprI(e0)=dom::exprR(e1))       // has(mcfloat(3.0+4.0*I),mcfloat(4.0))
                     else
                        bool((dom::exprR(e0) = dom::exprR(e1) or  // has(mcfloat(3.0+4.0*I),mcfloat(3.0+4.0*I))
                              iszero(Re(e1))) and       // has(mcfloat(3.0+4.0*I),mcfloat(4.0*I))
                             (dom::exprI(e0) = dom::exprI(e1)));
                     end_if;
      break;
   of DOM_COMPLEX do if e1 = I then                     // has(mcfloat(3.0,4.0),I)
                        bool(not iszero(Im(e1)));
                     elif iszero(Im(e1)) then         
                        // can Im part of DOM_COMPLEX be zero?
                        bool(dom::exprR(e0)=Re(e1) or        // has(mcfloat(3.0,4.0),DOM_COMPLEX(3.0,0.0)) // 3.0
                             dom::exprI(e0)=Re(e1))          // has(mcfloat(3.0,4.0),DOM_COMPLEX(4.0,0.0)) // 4.0
                     else 
                        // real part must match unless e1 is pure imaginary
                        bool((dom::exprR(e0) = Re(e1) or     // has(mcfloat(3.0,4.0),DOM_COMPLEX(3.0,4.0)) // 3.0+4.0*I
                              iszero(Re(e1))) and       // has(mcfloat(3.0,4.0),DOM_COMPLEX(0.0,4.0)) //     4.0*I
                             (dom::exprI(e0) = Im(e1)));
                     end_if;
      break;
   of DOM_FLOAT do bool(dom::exprR(e0) = e1 or              // has(mcfloat(3.0,4.0),3.0)
                        dom::exprI(e0) = e1);               // has(mcfloat(3.0,4.0),4.0)
      break;
   of DOM_IDENT do // NOTE WELL: domtype(I) is DOM_COMPLEX, not DOM_IDENT
                   FALSE;  
      break;
   of DOM_EXPR  do FALSE;                              // has(mcfloat(3.0,4.0),x+y) = FALSE
      break;
   of DOM_INT   do FALSE;                              // has(mcfloat(3.0,4.0),3) = FALSE
      break;
   otherwise has(expr(e0), e1);                        // less commonly occurring cases just handle generally
      break;
   end_case;
 end_proc:

mcfloat::hasProp := FAIL:

mcfloat::float := proc(x: mcfloat)
 begin
   expr(x);
 end_proc:

mcfloat::subs := proc(e: mcfloat, substitutions)
 local s;
 begin
   if domtype(substitutions) <> DOM_LIST then
      substitutions := [substitutions];
   end_if;
   // print("substitutions",substitutions,"args=",args());
   for s in substitutions do
      if domtype(lhs(s)) in {DOM_FLOAT, DOM_COMPLEX, mcfloat} then
         return(mcfloat(subs(expr(e),substitutions)));
      end_if;
   end_for;
   // For many kinds of substitutions, especially the common cases of
   // DOM_IDENT or DOM_EXPR, we have nothing to do.
   e;
 end_proc:

// This is what I wish I could write, but I'm not sure floats actually print this way.
//
//mcfloat::isNeg := proc(e: mcfloat)
// begin
//   bool(extop(e,1) < 0 or ( iszero(extop(e,1)) and extop(e,3) < 0));
// end_proc:

mcfloat::iszero := proc(e: mcfloat)
 begin
   bool(iszero(extop(e,1)) and iszero(extop(e,3)));
 end_proc:

mcfloat::_less := proc(e1, e2)
 begin
   bool(float(e1) < float(e2));
 end_proc:

mcfloat::_leequal := proc(e1, e2)
 begin
   bool(float(e1) <= float(e2));
 end_proc:

// ---------- end of "added by Kent" ----------

// ---- Content renderer setup ----
// This fixes Bug # 060928-154145 and should improve the situation for
// Bugs # 060929-120649 and 060926-143607

unprotect(Content):
Content::set("mcfloat", FAIL, mcfloat,
              proc(ex)
                save DIGITS;
              begin
                DIGITS := Content::expr(op(ex, 2));
                mcfloat(text2expr(Content::expr(op(ex, 1))),
                        Content::expr(op(ex, 2)),
                        text2expr(Content::expr(op(ex, 3))));
              end_proc):
Content::Cmcfloat := () -> dom::create("mcfloat", "", "", args()):
protect(Content, ProtectLevelError):

mcfloat::Content :=
proc(Out, x : mcfloat)
   save DIGITS;
   local rex, iex;
begin
   DIGITS := dom::prec(x);
   rex := expr2text(mcfloat::exprR(x));
   iex := expr2text(mcfloat::exprI(x));
   Out::Cmcfloat(rex, DIGITS, iex);
end_proc:

// ---- end of Content renderer setup ----

/*

 THIS SHOULD BE DEFINED LAST...

 make_slot -- default method creation
 
 */

mcfloat::make_slot := proc(thisdom: DOM_DOMAIN, slotname: DOM_STRING)
 option escape;
 local new_slot;
 begin
   // slotname is received as a string. convert it to an identifier.
   // e.g., "sin" -> sin
   slotname := text2expr(slotname);
   // print("enter make_slot",slotname);
   new_slot:=
   proc()
    local Args, tmp, ret, prec;
    save DIGITS;
    begin
      // print("enter (manufactured)",slotname);
      prec := 0;
      Args := [args()];
      // print("enter (manufactured)",slotname,"args(raw)=",Args);
      // convert any constants to regular floats
      Args := misc::maprec(Args, {DOM_IDENT}=float);
      // print("enter (manufactured)",slotname,"args(floated)=",Args);
      // for effect, walk the expression and make sure
      // computation is to largest precision.
      misc::maprec(Args, 
                   {mcfloat} = 
                   proc(x)
		              begin
		                if mcfloat::prec(x) > prec then
                         // Accumulate the maximum prec value
		                   prec := mcfloat::prec(x);
		                end_if;
		                x; // This is for side-effect, so just return the node we're at.
		              end_proc,
                    Unsimplified);
      // adjust precision of floats present
      DIGITS := prec;
      // print("making slot, DIGITS=",DIGITS);
      Args := misc::maprec(Args,
			                  {mcfloat} = 
                           proc(x) 
                            begin
                              mcfloat::expr(mcfloat::setprec(x, prec));
                            end_proc,
                           Unsimplified);
      // construct and apply the slotname
      tmp := slotname(op(Args));
      ret := eval(tmp);
      // post-process the result converting things back to mcfloats
      ret := misc::maprec(ret,
		                    {DOM_FLOAT, DOM_COMPLEX} = (x -> mcfloat(x, prec)),
                          Unsimplified);
      // print("leave (manufactured)",slotname,"with",domtype(ret),ret);
      ret;
    end_proc;
   // print("leave make_slot, returning manufactured definition of ",slotname);
   new_slot;
 end_proc:

// Experimental fix for Bug # 070301-090520, overrides other possible fix above.
mcfloat::laplace := mcfloat::make_slot(mcfloat, "transform::laplace");
mcfloat::fourier := mcfloat::make_slot(mcfloat, "transform::fourier");
mcfloat::ztrans  := mcfloat::make_slot(mcfloat, "transform::ztrans");
mcfloat::hasmsign := mcfloat::make_slot(mcfloat, "stdlib::hasmsign");

// return value of loading this file
null():

// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
