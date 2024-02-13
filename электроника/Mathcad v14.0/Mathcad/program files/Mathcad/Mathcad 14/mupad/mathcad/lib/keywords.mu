//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/releases/Mathcad_14.0.1/efi/efisymbolics-umgd/mupad/mathcad/lib/keywords.mu $
//*   $Revision:: 139                                                                      $
//*     $Author:: kpitman                                                                  $
//*       $Date:: 2007-05-09 17:24:38-04:00                                                $
//* $NoKeywords::                                                                          $
//*
//*  Purpose : Defines functions which implement Mathcad's symbolic
//*            keywords (expand, simplify, etc.).
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

keywords := newDomain("keywords"):
keywords::Name := "keywords":
keywords::info := "Library 'keywords': ".
                  "Mathcad keyword functions.":

keywords::interface :=
   {

    hold(keyword_assume),       // holds its args
    hold(keyword_assume_function),
    hold(keyword_cauchy),
    hold(keyword_coeffs),
    hold(keyword_coeffs_function),
    hold(keyword_collect),
    hold(keyword_combine),      // exprimental
    hold(keyword_complex),      // holds its args
    hold(keyword_complex_function),
    hold(keyword_confrac),
    hold(keyword_convert),
    hold(keyword_det),          // exprimental
    hold(keyword_expand),
    hold(keyword_explicit),
    hold(keyword_experimentally),
    hold(keyword_factor),
    hold(keyword_float),        // holds its args
    hold(keyword_float_function),
    hold(keyword_fourier),
    hold(keyword_fully),
    hold(keyword_inverse),      // experimental
    hold(keyword_invfourier),
    hold(keyword_invlaplace),
    hold(keyword_invztrans),
    hold(keyword_laplace),
    hold(keyword_parfrac),
    hold(keyword_raw),          // experimental
    hold(keyword_rectangular),  // holds its args
    hold(keyword_rectangular_function),
    hold(keyword_rewrite),      // experimental
    hold(keyword_series),
    hold(keyword_simplify),
    hold(keyword_solve),
    hold(keyword_substitute),   // holds its args
    hold(keyword_substitute_function),
    hold(keyword_transpose),    // experimental
    hold(keyword_using),
    hold(keyword_ztrans),
    ()}:

// ==================== Specialized Evaluation ====================

keywords::keyword_complex := proc(expression)
 option hold; // N.B.: DOES NOT EVALUATE ITS ARGUMENTS
 begin
   checkKeywordArgs("complex", args(0), 1);
   keyword_complex_function(expression);
 end_proc:

keywords::keyword_complex_function := evalRectangular:

keywords::keyword_rectangular := proc(expression)
 option hold; // N.B.: DOES NOT EVALUATE ITS ARGUMENTS
 begin
   checkKeywordArgs("rectangular", args(0), 1);
   keyword_rectangular_function(expression);
 end_proc:

keywords::keyword_rectangular_function := evalRectangular:

keywords::keyword_float := proc(expression, precision=hold(COMPUTED))
 option hold; // N.B.: DOES NOT EVALUATE ITS ARGUMENTS
 begin
   checkKeywordArgs("float", args(0), 1, 2);
   keyword_float_function(expression, precision);
 end_proc:

keywords::keyword_float_function := proc(expression, precision=hold(COMPUTED))
 begin
   if (testtype(precision,"op_negate") or testtype(precision,"_negate")) and
      isInteger(op(precision,1))
   then
      // Arguments have not been evaluated, so treat op_negate(3) like -3
      // See Bug # 070411-174041
      precision := eval(precision);
   end_if;
   if not (precision = COMPUTED) then
      if not(isInteger(precision)) then
         formatError(errorBadDigits);
      elif (precision <= 0) or (precision > 250) then
         formatError(errorBadDigits);
      end_if;
   end_if;
   evalFloat(expression,precision);
 end_proc:

keywords::keyword_assume := proc(expression) // any number of args
 option hold; // N.B.: DOES NOT EVALUATE ITS ARGUMENTS
 local assumptions;
 begin
   assumptions:=[args(2..args(0))];
   keyword_assume_function(expression, assumptions);
 end_proc:

keywords::keyword_assume_function := proc(expression, assumptions_list)
 begin
   // assumptions should be given as a MuPAD list
   eval(attachAssumptions(expression,assumptions_list));
 end_proc:

// Note: keyword_explicit will only be sent to MuPAD
// when one or more non-explicit keywords are also
// present in the expression.
keywords::keyword_explicit := proc(expression)
 begin
   expression;
 end_proc:


// ==================== Simple (Identity-Preserving) Syntactic Transformation ====================

// I think this might be possible to generalize to multiple vars,
// but I went for the simple definition first, especially because
// representing results for n variables requires n-dimensional arrays
// and we don't have those right now. -kmp 17-Jan-2006

keywords::keyword_coeffs := proc(expression,
                                 var=COMPUTED,
                                 resultFormat=DEFAULT)
 begin
   checkKeywordArgs("coeffs", args(0), 1, 3);
   if isMatrix(expression) then
      matrixMap(expression, x->keyword_coeffs_function(x,var,resultFormat));
   else
      keyword_coeffs_function(expression,var,resultFormat);
   end_if;
 end_proc:


keywords::keyword_coeffs_function := proc(e, v= COMPUTED , resultFormat = DEFAULT)
 local terms, var, temp, ratfn, others, n, d, maxnegdeg, maxdeg, x, xdeg, xcoeff, norme, norml, res, nterms, unk, i, orige, origv, tempvar;
 begin
   orige := e;
   e := fixupProcs(e);
   v := fixupProcs(v);
   unk:=unknowns(e);
   if resultFormat=DEFAULT and v=hold(mc_degree) and not (v in unk) then
      // help out users who omit the v without thinking of the consequences
      resultFormat := v;
      v := COMPUTED;
   end_if;
   if resultFormat<>DEFAULT and resultFormat<>hold(mc_degree) then
      formatError(errorCoeffsBadResultFormat);
   end_if;
   if nops(unk) = 0 then
      // The coeffs of a constant expression is the constant itself 
      return(if resultFormat = DEFAULT then 
                orige
             else
                matrix([[orige, 0]]);
             end_if);
   end_if;
   if (v = COMPUTED) then
      v := theOnlyIndepVar(unk);
   end_if;
   if isScalar(v) then
      error(errorBadSyntax);
   end_if;
   origv := v;
   tempvar := _COEFFS_TEMP_;
   if not isSymbol(v) then
      e := mcSubs(e, [v=tempvar]);
      v := tempvar;
   end_if;
   temp := rationalize(expand(mcExpr(eval(e))));
   ratfn :=  temp[1];
   others := temp[2];
   maxdeg := 0;
   if testtype(ratfn,"_plus") then
      terms := [op(ratfn)];
   else
      terms  := [ratfn];
   end_if;
   for x in terms do
      // MuPAD oddity: degree(x,v) will sometimes fail
      // where degree(x,[v]) succeeds.  This was part
      // of the cause of bug 051220-105324.
      xdeg := degree(x,[v]);
      if xdeg <> FAIL then
         maxdeg := max(maxdeg,xdeg);
      end_if;
   end_for;
   maxnegdeg := 0;
   // print("terms=",terms);
   for x in terms do
      xdeg := degree(denom(x),v);
      maxnegdeg := max(xdeg, maxnegdeg);
   end_for;
   temp := [op(terms)];
   // print("terms temp",temp,"v",v,"maxdeg",maxdeg,"maxnegdeg",maxnegdeg);
   norme := _plus(op(map(temp,x->v^maxnegdeg*x)));
   // print("norme",domtype(norme),norme);
   norml := poly2list(norme,[v]);
   // print("norml",domtype(norml),norml);
   nterms := maxnegdeg+maxdeg+1;
   // print("maxnegdeg",maxnegdeg,"maxdeg",maxdeg,"nterms",nterms);
   if resultFormat = DEFAULT then
      // print("res",nterms,1);
      res := matrix(nterms,1);
   else
      // print("res",nterms,2);
      res := matrix(nterms,2);
   end_if;
   // print("res",res);
   for i from 1 to nterms do
      res[i,1]:=0;
      // print("storing",0,"at",i,1);
   end_for;
   for x in norml do
      // Polynomial x^3+17 will have list [[1, 3], [17, 0]]
      xcoeff := x[1];
      xdeg   := x[2];
      temp   := xdeg+1;
      // print("storing",xcoeff,"at",temp,1);
      res[temp,1]:=xcoeff;
   end_for;
   temp := -maxnegdeg;
   if resultFormat <> DEFAULT then
      for i from 1 to nterms do
         res[i,2]:=temp;
         temp := temp+1;
      end_for;
   end_if;
   unfixupProcs(subs(subs(res,tempvar=origv),others));
 end_proc:

// test case: keyword_coeffs(op_add(op_sub(op_add(op_sqr(mc_x),3),op_mult(7,op_power(mc_x,op_negate(2)))),op_mult(5,op_power(mc_x,op_negate(3)))));

keywords::keyword_collect := proc(expression,
                                  var=COMPUTED)
 local vars;
 begin
   vars := [args(2..args(0))];
   collectCoefficients(mcExpr(eval(expression)),vars);
 end_proc:

keywords::keyword_expand := proc()
 begin
   expand(args());
 end_proc:

keywords::keyword_factor := proc(expression, radicals=NONE)
 begin
   if mixedInvolved(expression) then
      expression := mixedExpressionToRational(expression);
   end_if;
   if radicals=NONE then 
      if isMatrix(expression) then
         matrixMap(expression, x->factor(x));
      else
         factor(expression):
      end_if;
   else
      radicals := [args(2..args(0))];      
      if isMatrix(expression) then
         matrixMap(expression, x->factorWith(x,radicals));
      else
         factorWith(expression,radicals):
      end_if;
   end_if:
 end_proc:

keywords::keyword_parfrac := proc(expression, var=COMPUTED)
 local temp, nargs, ivars, radicals;
 begin
   nargs := args(0);
   temp := parseVarAndRadicals([args(2..args(0))]);
   var      := op(temp,1);
   radicals := op(temp,2);
   // print("parsed:",temp);
   if var = COMPUTED then
      var := theOnlyIndepVar(unknowns(expression));
   end_if;
   // print("keyword_parfrac var=",var,"radicals=",radicals);
   if radicals=NONE then
      if isMatrix(expression) then
         matrixMap(expression, x->mcPartFrac(x,var));
      else
         mcPartFrac(expression,var);
      end_if;
   else
      if isMatrix(expression) then
         matrixMap(expression, x->mcPartFrac(x,var,radicals));
      else
         mcPartFrac(expression,var,radicals);
      end_if;
   end_if;
 end_proc:

keywords::keyword_confrac := proc(expression)
 option hold;
 save DIGITS;
 local r, cf, n, m, fmt, x, x0, k, a, i, keyargs;
 begin
   nargs := args(0);
   checkKeywordArgs("confrac", nargs, 1, 4);
   n := 10;
   m := 6;
   expression := eval(expression);
   if mixedInvolved(expression) then
      expression := mixedExpressionToRational(expression);
   end_if;
   r := float(expression); // just to find out if it's floatable
   k := 2;
   x := NONE;
   x0 := 0;
   fmt := DEFAULT;
   for i from 2 to nargs do 
      a := args(i);
      if a = hold(mc_vector)   or 
         a = hold(mc_matrix) or
         a = hold(mc_fraction) 
      then
         fmt := a;
      else
         a := eval(a);
         if isEquation(a) or isSymbol(a) then
            if x = NONE then
               if isSymbol(a) then
                  // print("setting x to",a);
                  x := a;
               else
                  // print("setting x=x0 to",a);
                  x  := lhs(a);
                  x0 := rhs(a);
               end_if;
            else
               formatError(errorBadSyntax);
            end_if;
         elif isPositiveInteger(a) then
            if a>250 then
               formatError(errorBadDigits);
            end_if;
            // print("setting n and m to",a);
            n := a;
            m := a;
         else
            formatError(errorBadSyntax);
         end_if;
      end_if;
   end_for;
   if x = NONE and not isFloating(r) then
      // print("defaulting x");
      x := theOnlyIndepVar(unknowns(expression));
   end_if;
   if isFloating(r) then
      // print("real case");
      DIGITS := n;
      cf := contfrac(expression, n); // don't use R here.
      if not testtype(cf, numlib::contfrac) then
         formatError(errorSymbolic);
      else
         cf := map(op(cf,1),((x)->[x,1]));
         if fmt = DEFAULT or fmt = hold(mc_vector) then 
            cf := matrix(cf);
          //Not needed because it will be discarded.
          //cf[linalg::nrows(cf),2]:=0;
            op_matcol(cf,0);
         elif fmt = hold(mc_matrix) then 
            cf := matrix(cf);
            cf[linalg::nrows(cf),2]:=0;
            cf; 
         elif fmt = hold(mc_fraction) then
            makeContinuedFraction(cf);
         else
            formatError(errorInappropriateModifier); // "Must be one of 'vector', 'matrix', or 'fraction'."
         end_if;
      end_if;
   else      
      cf := contfrac(expression, x = x0, m);
      if not testtype(cf, contfrac) then
         formatError(errorSymbolic);
      else
         cf := op(cf,1);
         if fmt = DEFAULT or fmt = hold(mc_matrix) then 
            cf := matrix(cf);
            cf[linalg::nrows(cf),2]:=0;
            cf;
         elif fmt = hold(mc_fraction) then
            makeContinuedFraction(cf);
         else
            formatError(errorInappropriateModifier); // "Must be one of 'matrix' or 'fraction'."
         end_if;
      end_if;
   end_if;
 end_proc:

keywords::keyword_simplify := proc(expression, MODIFIERS)
 local modifier, kwd, val, nargs, trigsimp, amount;
 begin
   // checkKeywordArgs("simplify", args(0), 1, 2);
   trigsimp := FALSE;
   amount := DEFAULT; 
   for modifier in [args(2..args(0))] do
      if modifier = hold(mc_trig) then
         trigsimp := TRUE;
      elif  modifier = hold(mc_max) then
         if amount <> DEFAULT then
            formatError(errorBadSyntax);
         end_if;
         amount := MAX;
      elif  modifier = hold(mc_min) then
         if amount <> DEFAULT then
            formatError(errorBadSyntax);
         end_if;
         amount := MIN;
      elif  modifier = hold(mc_none) then // undocumented, just for debugging
         if amount <> DEFAULT then
            formatError(errorBadSyntax);
         end_if;
         amount := NONE;
      else
         // print("Modifier is unexpected:", modifier);
         formatError(errorInappropriateModifier, modifier);
      end_if;
   end_for;
   if trigsimp then
      expression := rewrite(expression,sincos);
   end_if;
   case amount
   // simplify,none is useful for debugging to turn off simplification briefly.
   // ALSO: simplify,none,trig is the same as rewrite,sincos
   // simplify,min calls only the minimal simplifier, as in  simplify(x)
   // simplify     calls the standard simplifier, as in Simplify(simplify(x))
   // simplify,max calls standard simplifier with lots more steps
   of NONE    do expression;                                           break;
   of MIN     do maybeSimplify(expression, TRUE);                      break;
   of DEFAULT do mcSimplify(expression);                               break;
   of MAX     do mcSimplify(expression, Steps=optionSimplifyMaxSteps); break;
   otherwise     formatError(errorBadSyntax);                          break;
   end_case;
 end_proc:

// ==================== Non-Identity-Preserving Syntactic Transformation ====================

keywords::keyword_series := proc(expression,
                                 vars=COMPUTED,
                                 degree=COMPUTED)
 local nargs, var, atpoint, atpoints, degrees, spec, nextint, i, j, k, specs;
 begin
   nspecs := args(0)-1;
   specs := [args(2..nspecs+1)];
   if involvesBooleans(expression) then
      formatError(errorInappropriateExpression);
   end_if;
   atpoint := 0; // default
   degree  := 6; // default
   vars     := _exprseq();
   atpoints := _exprseq();
   degrees  := _exprseq();
   i := 1;
   for j from 1 to nspecs do
      k := specs[j];
      if isInteger(k) then
         degree := k;
         break;
      end_if;
   end_for;
   while i <= nspecs do 
      spec     := specs[i];
      // print("i"=i,"spec"=spec,"degree"=degree);
      if isInteger(spec) then
         // print("case: int", spec, i);
         for j from i+1 to nspecs do
            k := specs[j];
            if isInteger(k) then
               degree := k;
               break;
            end_if;
         end_for;
         // if none found, that's ok.  we'll just keep using the last one
      elif isSymbol(spec) then
         // print("case: sym", spec, i);
         vars     := vars,     spec;
         atpoints := atpoints, 0;       //  use 0 as default unless overridden
         degrees  := degrees,  degree;  //  use previously computed value
      elif isEquation(spec) then
         // print("case: eqn", spec, i);
         var     := mcLHS(spec);
         atpoint := mcRHS(spec);
         vars     := vars,     var;
         atpoints := atpoints, atpoint;
         degrees  := degrees,  degree;  // use previously computed value
      else
         // print("case: bad", spec, i);
         formatError(errorBadSyntax);
      end_if;
      i := i + 1;
   end_while;
   mcSeries(expression, [vars], [atpoints], [degrees], atpoint, degree);
 end_proc:

keywords::keyword_using := proc(expression, MAPPINGS)
 option hold;
 local orig_unknowns, mappings, new_unknowns, unmappings, mapping, results;
 begin
   orig_unknowns := unknowns(expression);
   mappings := map([args(2..args(0))],toEquation);
   for mapping in mappings do
      if mcLHS(mapping) in orig_unknowns then
         formatError(errorUsingVarExists,mcLHS(mapping));
      end_if;
   end_for;
   results := eval(expression);
   new_unknowns := unknowns(results) minus orig_unknowns;
   unmappings := _exprseq();
   for mapping in mappings do
      if mcLHS(mapping) in new_unknowns then
         unmappings := unmappings,mapping;
      else
         formatError(errorUsingVarNotGenerated,mcLHS(mapping));
      end_if;
   end_for;
   unmappings := [unmappings];
   if optionRaw then
      results := subs(results,unmappings);
   else
      // Don't do it this way:
      //  results := subs(results,unmappings);
      // but instead this way for Bug # 060725-161007
      // to get each point of substitution re-simplified.
      results := misc::maprec(results, {DOM_IDENT}=(x->subs(x,unmappings)));
      results := adjustPiecewisesRecursively(results);
   end_if;
   results;
 end_proc:

keywords::keyword_solve := proc(expression_func, VARSPECS)
 local var, varspec, varspecs, vars, results, eqn, maxdeg, newvarspecs,
       eqn_func;
 save optionSolveDefaultMaxDegree;
 begin
   varspecs := [args(2..args(0))];
   varspecs   := fixupProcs(varspecs);
   newvarspecs := _exprseq();
   for item in varspecs do
     if isEquation(item) then
        if mcLHS(item) = hold(mc_maxdegree) then
           maxdeg := mcRHS(item);
           if (isInteger(maxdeg) and maxdeg >= 0) then
              optionSolveDefaultMaxDegree := maxdeg;
           else
              formatError(errorBadMaxDegree, maxdeg);
           end_if;
        else
           checkSolveVar(item);
        end_if;
     else
        checkSolveVar(item);
        // accumulate any vars except a maxdegree spec
        newvarspecs := newvarspecs, item;
     end_if;
   end_for;
   varspecs := [newvarspecs];
   vars:=_exprseq();
   for varspec in varspecs do
      if isMatrix(varspec) then 
         vars:=vars,op(varspec);
      else
         vars:=vars,varspec;
      end_if;
   end_for: 
   vars:=[vars];

   expression_func := toLogical(expression_func,NATIVE);

   // If no variables are specified, take the parameters
   // of the procedure the translator has given us
   // as the variable list.
   if vars=[] then vars:=[functionArgs(expression_func)]; end_if;

   // This should never happen -- the translator should have
   // made sure there's at least one variable.
   if vars=[] then formatError(errorNeedVarsToSolveFor); end_if;
   
   //print("expression_func=",expression_func,"vars=",vars);
   for item in vars do 
      if isScalar(item) then // formerly checked not isSymbol(item),
                             // but that was too conservative in Bug # 060602-153622.
                             // -kmp 01-Sep-2006
         formatError(errorBadSolveVar, item);
      end_if;
   end_for;

   // The check of list syntax is to avoid things like:  x^2=4,x>0 solve->
   // as illustrated in Bug # 060524-154957 
   eqn_func := unknowns -> checkNotListSyntax(expression_func(op(unknowns)));
   results := op_solve_internal(eqn_func,vars);

//   subsin   :=  [i=UNKNOWN_.i $ i in vars]; 
//   subsout  :=  [op(i,2)=op(i,1) $ i in subsin];
//   eqn  := subs(eqn,  subsin);
//   vars := subs(vars, subsin);
//   results:=mcSolve(eqn,vars);
//   if (results = FAIL) then
//      if optionSolveTryNumeric then
//         results := evalFloat(hold(solve)(eqn,vars));
//      end_if;
//      if (results = FAIL or op(results,0) =hold(solve)) then
//         formatError(errorNoSolveSolution);
//      end_if;
//   end_if;
//   results:=processSolveResults(results);
//   results:=subs(results,subsout);
//   results:=unfixupProcs(results);

   results:=unfixupProcs(results); // stack discipline: we did fixupProcs here, so undo it, too

   results := checkPiecewisesRecursively(results);

   results;
 end_proc:

keywords::keyword_substitute := proc(expression)
 option hold;
 local substitutions, e, s, s0;
 begin
   substitutions := [args(2..args(0))];
   e := context(expression);
   keyword_substitute_function(e,
                               // This is work Kent has been playing with that hasn't yet been
                               // released.  See Bug # 070223-143132 or other bugs with
                               // the EqualSign attribute in their subject line.
                               if FALSE then
                                  keyword_substitute_function(ce, map(substitutions,toEquation));
                               else
                                  s := _exprseq();
                                  for s0 in substitutions do
                                     s0 := toEquation(s0);
                                     s := s, (context(lhs(s0))=context(rhs(s0)));
                                  end_for;
                                  [s];
                               end_if);
 end_proc:

keywords::keyword_substitute_function := proc(expression, substitutions)
 begin
   maybeSimplify(unfixupProcs(mcSubs(fixupProcs(expression),fixupProcs(substitutions))));
 end_proc:

// ==================== Transforms ====================

keywords::keyword_laplace := proc(expression,
                                  oldvar=hold(mc_t),
                                  newvar=hold(mc_s))
 begin
   transformExpression(expression, oldvar, newvar, 
                       hold(transform::laplace), "laplace", hold(transform::invlaplace),
                       hold(mc_ss), hold(s), args(0))
 end_proc:

keywords::keyword_invlaplace := proc(expression,
                                     oldvar=hold(mc_s),
                                     newvar=hold(mc_t))
 begin
   transformExpression(expression, oldvar, newvar, 
                       hold(transform::invlaplace), "invlaplace", hold(transform::laplace),
                       hold(mc_tt), hold(t), args(0));
 end_proc:

keywords::keyword_fourier := proc(expression,
                                  oldvar=hold(mc_t),
                                  newvar=hold(mcvar_omega))
 begin
   transformExpression(expression, oldvar, newvar, 
                       hold(transform::fourier), "fourier", hold(transform::invfourier),
                       // _hex_6D635FCF89CF89 is 'mc_' followed by
                       // two lowercase omega chars -kmp
                       hold(_hex_6D635FCF89CF89), hold(CF89), args(0), transformFilterNonZeroTo);
 end_proc:

keywords::keyword_invfourier := proc(expression,
                                     oldvar=hold(mcvar_omega),
                                     newvar=hold(mc_t))
 begin
   transformExpression(expression, oldvar, newvar, 
                       hold(transform::invfourier), "invfourier", hold(transform::fourier),
                       hold(mc_tt), hold(t), args(0), transformFilterNonZeroFrom);
 end_proc:

keywords::keyword_ztrans := proc(expression,
                                 oldvar=hold(mc_n),
                                 newvar=hold(mc_z))
 begin
   transformExpression(expression, oldvar, newvar, 
                       hold(transform::ztrans), "ztrans", hold(transform::invztrans),
                       hold(mc_zz), hold(z), args(0));
 end_proc:

keywords::keyword_invztrans := proc(expression,
                                    oldvar=hold(mc_z),
                                    newvar=hold(mc_n))
 begin
   transformExpression(expression, oldvar, newvar, 
                       hold(transform::invztrans), "invztrans", hold(transform::ztrans),
                       hold(mc_nn), hold(n), args(0));
 end_proc:

// ==================== Deprecated Old Keywords ====================

keywords::keyword_convert := proc(expression, modifier, var=COMPUTED)
   // Leopold 2006-01-11
   // So far as Kent and I know, 'parfrac' is the only valid argument
   // to the 'convert' keyword.  For flexibility, we're implementing
   // keyword_convert as the identity function giving 'parfrac'
   // keyword status.  This allows "convert,parfrac" to work, but
   // leaves open the possibility of easily deleting the 'convert'
   // keyword in the future.
 begin
   expression;
 end_proc:

// ==================== Experimental New Keywords ====================

keywords::keyword_transpose := proc(expression)
 begin
   checkKeywordArgs("transpose", args(0), 1);
   op_transpose(expression);
 end_proc:

keywords::keyword_inverse := proc(expression)
 begin
   checkKeywordArgs("inverse", args(0), 1);
   expression^-1;
 end_proc:

keywords::keyword_det := proc(expression)
 begin
   checkKeywordArgs("det", args(0), 1);
   op_abs(expression);
 end_proc:

keywords::keyword_combine := proc(expression)
 local target, result;
 begin
   targets := map([args(2..args(0))], toCombineTarget);
   if targets = [] then
      combine(expression);
   else
      result := expression;
      for target in targets do
         result := combine(result, target);
         if (target = log) then
            result := mcRewrite(result, target);
         end_if;
      end_for;
      result;
   end_if;
 end_proc:

keywords::keyword_rewrite := proc(expression, target)
 begin
   checkKeywordArgs("rewrite", args(0), 2);
   mcRewrite(expression,toRewriteTarget(target));
 end_proc:

keywords::keyword_fully := proc(expression)
 option hold;
 save optionFully,
      optionSolveIgnoreSpecialCases,
      optionSolveEliminatesConstants,
      optionIntegrateChecksDiscontinuities;
 begin
   checkKeywordArgs("fully", args(0), 1);
   optionFully := TRUE;
   optionSolveIgnoreSpecialCases := FALSE;
   optionSolveEliminatesConstants := FALSE;
   optionIntegrateChecksDiscontinuities := TRUE;
   eval(expression);
 end_proc:

keywords::keyword_raw := proc(expression)
 option hold;
 save optionMaybeSimplify, optionRaw;
 begin
   checkKeywordArgs("raw", args(0), 1);
   optionMaybeSimplify := FALSE;
   optionRaw := TRUE;
   eval(expression);
 end_proc:

keywords::keyword_cauchy := proc(expression)
 option hold;
 save optionIntegrateUsesCauchyPrincipalValue;
 begin
   checkKeywordArgs("cauchy", args(0), 1);
   optionIntegrateUsesCauchyPrincipalValue := TRUE;
   eval(expression);
 end_proc;

keywords::keyword_experimentally := proc(expression)
 option hold;
 save optionExperimentally;
 begin
   // This keyword is sometimes used by the development staff for
   // debugging in controlled situations and might be expanded for
   // use in the product in the future, but at this time it MUST NOT
   // be used by end-users nor edited in any way by users.
   error(errorBadSyntax); 
   checkKeywordArgs("experimentally", args(0), 1);
   optionExperimentally:=TRUE;
   eval(expression);
 end_proc:

// ========================================

// return value of loading this file
null():
	
// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
