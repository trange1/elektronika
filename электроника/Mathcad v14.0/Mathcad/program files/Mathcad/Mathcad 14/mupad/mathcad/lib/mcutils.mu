//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/releases/Mathcad_14.0.1/efi/efisymbolics-umgd/mupad/mathcad/lib/mcutils.mu $
//*   $Revision:: 328                                                                     $
//*     $Author:: releng                                                                  $
//*       $Date:: 2007-07-09 12:07:00-04:00                                               $
//* $NoKeywords::                                                                         $
//*
//*  Purpose : Defines functions to be used as utilities when implementing
//*            Mathcad's interfaces.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

mcutils := newDomain("mcutils"):
mcutils::Name := "mcutils":
mcutils::info := "Library 'mcutils': ".
                 "Utility for implementing Mathcad interface functions.":

mcutils::interface :=
 {
  hold(_geequal),
  hold(_great),
  hold(absGreater),
  hold(absLess),
  hold(adjustFloatPrecision),
  hold(adjustPiecewise),
  hold(adjustPiecewises),
  hold(adjustPiecewiseCheckInfinity),
  hold(adjustPiecewisesRecursively),
  hold(allCompareTrue),
  hold(allTrue),
  hold(allVar),
  hold(applyOneSolveConstraint),
  hold(applySolveConstraints),
  hold(anyTrue),
  hold(assumptionIsUseful),
  hold(attachAssumptions),
  hold(booleanOperators),
  hold(buildAlgebraicExtension),
  hold(checkArgs),
  hold(checkArgsInternal),
  hold(checkInteger),
  hold(checkKeyword),
  hold(checkKeywordArgs),
  hold(checkMatrix),
  hold(checkMatrixSquare),
  hold(checkNoOccurrences),
  hold(checkNonNegativeInteger),
  hold(checkNotListSyntax),
  hold(checkNotOp),
  hold(checkPiecewise),
  hold(checkPiecewiseClauseImageSets),
  hold(checkPiecewiseImageSets),
  hold(checkPiecewisesRecursively),
  hold(checkPositiveInteger),
  hold(checkProc),
  hold(checkReal),
  hold(checkScalar),
  hold(checkSolveVar),
  hold(checkSymbol),
  hold(checkUndefined),
  hold(checkVector),
  hold(collectCoefficient),
  hold(collectCoefficients),
  hold(collectCoefficientsScalar),
  hold(collectComplicatedCoefficient),
  hold(conjoinedAssumption),
  hold(consolidatePiecewiseResults),
  hold(constantly),
  hold(constrainVectorImageSet),
  hold(constrainVectorImageSet1),
  hold(containsOps),
  hold(containsSolution),
  hold(decodeInterval),
  hold(defaultArgument),
  hold(displayDigits),
  hold(displayDigitsChanged),
  hold(displayDigitsDefault),
  hold(displayDigitsValue),
  hold(distributeMatrixBinOp),
  hold(domTypeAssumption),
  hold(domTypeAssumptions),
  hold(emptySetMarker),
  hold(estimateDegree),
  hold(estimatedDegreeResult),
  hold(evalFloat),
  hold(evalFloatDispatch),
  hold(evalFloatNow),
  hold(evalFloat250),
  hold(evalFloatMinimumPrecision),
  hold(evalMcFloat),
  hold(evalOneFloat),
  hold(evalRectangular),
  hold(factorWith),
  hold(false),
  hold(fixupExtendedD),
  hold(fixupFloatInt),
  hold(fixupIntegers),
  hold(fixupLimit),
  hold(fixupProcs),
  hold(fixupRange),
  hold(flattenLiteralSolve),
  hold(flattenRootOf),
  hold(flattenSolveResults),
  hold(flattenSolveResultsPiece),
  hold(flattenSolveUnion),
  hold(flattenSolveUnionMinimal),
  hold(floatFromString),
  hold(floatMode),
  hold(forceNumericSolution),
  hold(forceRootOf),
  hold(formatError),
  hold(freezeExp),
  hold(fromE),
  hold(functionArgs),
  hold(functionBody),
  hold(fuzzyEqual),
  hold(fuzzyEqual_scalar),
  hold(fuzzyPosition),
  hold(fuzzyPrecision),
  hold(genTempVar),
  hold(getOneNumericSolution),
  hold(getOption),
  hold(getPowerMultiplesSubstitutions),
  hold(heuristicEqual),
  hold(hiddenDigits),
  hold(initPrinterForMathcad),
  hold(initializeMathcadPreferences),
  hold(initializeRuleSimplifier),
  hold(initializeSolve),
  hold(internalError),
  hold(invertRelationMarker),
  hold(involvesBooleans),
  hold(isAbs),
  hold(isAnonymousProc),
  hold(isAssumption),
  hold(isAssumptionSide),
  hold(isBool),
  hold(isBooleanOperator),
  hold(isComplex),
  hold(isConstant),
  hold(isConstantExp),
  hold(isEquation),
  hold(isEvery),
  hold(isExtendedD),
//hold(isFloat),
  hold(isFloating),
  hold(isFunction),
  hold(isInequality),
  hold(isInteger),
  hold(isList),
  hold(isMatrix),
  hold(isMatrixSquare),
  hold(isNamedConstant),
  hold(isNonIntegerConstant),
  hold(isNonNegativeInteger),
  hold(isNotInteger),
  hold(isNotMatrix),
  hold(isNotReal),
  hold(isNotVar),
  hold(isPiecewise),
  hold(isPolynomialRelation),
  hold(isPositiveInteger),
  hold(isProc),
  hold(isRational),
  hold(isReal),
  hold(isRelation),
  hold(isScalar),
  hold(isScalarExp),
  hold(isSet),
  hold(isSimpleLinear),
  hold(isString),
  hold(isSymbol),
  hold(isTrue),
  hold(isMostlyFreeOfExceptions),
  hold(isMostlyTrue),
  hold(isUsedBound),
  hold(isUsedBound1),
  hold(isUsedBound_result),
  hold(isUsedBound_variable),
  hold(isVector),

  hold(isEqualityMarker),
  hold(isInequalityMarker),
  hold(isUnequalityMarker),

  hold(listElements),
  hold(listFirst),
  hold(listLength),
  hold(listRest),
  hold(looksTheSame),
  hold(makeContinuedFraction),
  hold(makeTermSortFunction),
  hold(makeProc),
  hold(makeSeries),
  hold(makeSeries2),
  hold(makeSymbol),
  hold(mangleSystemNames),
  hold(mangledProcName),
  hold(mangledProcNamePrefix),
  hold(mangledProcNamePrefixSize),
  hold(matrixElements),
  hold(matrixMap),
  hold(matrixMapper),
  hold(matrixScalarDistribute),
  hold(matrixSpreader),
  hold(matrixTypes),
  hold(maybeFixupInteger),
  hold(maybeScalarize),
  hold(maybeSimplify),
  hold(maybeToBool),
  hold(maybeTransposeSolveBlockResult),
  hold(guessTermOrder),
  hold(guessTermOrder_so_far),
  hold(mc_e),
  hold(mcAlgebraicExtension),
  hold(mcFloatComplex),
  hold(mcFloatFromString),
  hold(mcLHS),
  hold(mcMinerr),
  hold(mcMinerrSubs),
  hold(mcOperatorTable),
  hold(mcPartFrac),
  hold(mcPartFracWorker),
  hold(mcRewrite),
  hold(mcRHS),
  hold(mcSeries),
  hold(mcSimplify),
  hold(mcSimplify1),
  hold(mcSimplifyFast),
  hold(mcSimplifyFast2),
  hold(mcSimplifyFast2a),
  hold(mcSimplifyRuleSelector),
  hold(mcSimplifyRule_csgn1),
  hold(mcSimplifyUsingRules),
  hold(mcSimplifyUsingRulesInitialized),
  hold(mcSimplifyUsingSubs),
  hold(mcSimplifyUsingSubsPrepass),
  hold(mcSimplifyWorker),
  hold(mcSolve),
  hold(mcSolve1),
  hold(mcSpecialFunctionNames),
  hold(mcSpecialFunctionUnknowns),
  hold(mcSubs),
  hold(mcValuation),
  hold(mcValuationFunction),
  hold(mcExpr),
  hold(mcexpr2text),
  hold(mixedExpressionFromRational),
  hold(mixedExpressionToRational),
  hold(mixedInvolved),
  hold(mixedMath),
  hold(mixedNumberFromRational),
  hold(mixedNumberPartsToRational),
  hold(mixedNumberToRational),
  hold(negInvolved),
  hold(normalizeRationalFunctionToPolynomial),
  hold(numeric_rationalize),
  hold(optionAllowEvenOdd),
  hold(optionApplySolveConstraints),
  hold(optionCollectMaxPowerMultiples),
  hold(optionCollectMaxPowerMultiplesLimit),
  hold(optionConsolidateSolvePiecewiseResults),
  hold(optionEvalFloatUsesDynamicDigits),
  hold(optionExperimentally),
  hold(optionFully),
  hold(optionGenTempVarNumberTable),
  hold(optionGenTempVarNumberTableStart),
  hold(optionIgnoreFalseAssumptions),
  hold(optionIntegrateChecksDiscontinuities),
  hold(optionIntegrateUsesCauchyPrincipalValue),
  hold(optionMaybeSimplify),
  hold(optionRaw),
  hold(optionSimulateMTaylor),
  hold(optionSimplifyMaxSteps),
  hold(optionSolveDefaultMaxDegree),
  hold(optionSolveEliminatesConstants),
  hold(optionSolveIgnoreSpecialCases),
  hold(optionSolveTempVarName),
  hold(optionSolveTempVarNamePrefix),
  hold(optionSolveTryNumeric),
  hold(optionSumContainsNamedConstants),
  hold(optionSumContainsScalars),
  hold(optionSuppressZeroMixedNum),
  hold(optionUndefinedIsContagious),
  hold(optionUseMcFloats),
//hold(optionUseUnicodeIdentifiers),
  hold(optionUseSurd),
  hold(optionVectorSumAllowsMatrices),
  hold(parseDivision),
  hold(parseVarAndRadicals),
  hold(piecewiseCaller),
  hold(preferInteger),
  hold(prepareForInput),
  hold(prepareOutput),
  hold(prepareOutputFallback),
  hold(prepareOutputPreferred),
  hold(procVars),
  hold(procBody),
  hold(procName),
  hold(processCollectOptions),
  hold(processPiecewiseImageSet),
  hold(processPiecewiseImageSet_subs),
  hold(processPiecewiseImageSets),
  hold(processPiecewiseImageSetsData),
  hold(processPiecewiseImageSetsTriage),
  hold(processSolveInequality),
  hold(processSolveResults),
  hold(protectTransformVar),
  hold(quoteSymbolName),
  hold(realityCheck),
  hold(realityCheck1),
  hold(realPartGreater),
  hold(realPartLess),
  hold(reconstitutePieces),
  hold(rectForm),
  hold(reduceSolveResults),
  hold(reduceToScalars),
  hold(reformatSolveResults),
  hold(removeFrom),
  hold(reverseList),
  hold(sameRoots),
  hold(scalarList),
  hold(separateAssumptions),
  hold(setElements),
  hold(setElementsAsList),
  hold(setEqual),
  hold(shouldAutoFloat),
  hold(siftSolveResults),
  hold(simplerThan),
  hold(simplifyBoolean),
  hold(simplifyImageSolution),
  hold(simplifyMode),
  hold(simplifyName),
  hold(simplifyPower),
  hold(simplifySetToDeclarations),
  hold(simplifySign),
  hold(simplifySignFactors),
  hold(simplifySignSymmetric),
  hold(simplifySignAntiSymmetric),
  hold(simplifySpecial),
  hold(simplifyVectorImageSolution),
  hold(solutionSeq),
  hold(solveConditions),
  hold(solveDefinitions),
  hold(solveImageSet),
  hold(solveOrdering),
  hold(sortSeries),
  hold(sortByScalarColumn),
  hold(sortByScalarColumnNum),
  hold(spreadToScalars),
  hold(stripLHS),
  hold(substOne),
  hold(optionSubstitutionVarName),
  hold(symbolName),
  hold(theOnly),
  hold(theOnlyIndepVar),
  hold(theOnlyInternal),
  hold(toAssumptions),
  hold(toBool),
  hold(toCombineTarget),
  hold(toE),
  hold(toEquation),
  hold(toList),
  hold(toLogical),
  hold(toMatrix),
  hold(toRewriteTarget),
  hold(toSet),
  hold(toVector),
  hold(transformExpression),
  hold(transformFilterAny),
  hold(transformFilterNonZeroTo),
  hold(transformFilterNonZeroFrom),
  hold(transformFilterNonZeroVar),
  hold(true),
  hold(truthValue),
  hold(unfixupProcs),
  hold(unknowns),
  hold(unknownsSoFar),
  hold(unknownsToIgnore),
  hold(unmangledProcName),
  hold(unmcfloat),
  hold(validateMatrix),
  hold(vectorMapper),
  ()}:

mcutils::isAssumption := proc(x)
 local oper, res;
 begin
   oper := op(x,0);
   // print("isAssumption",x,"oper"=oper);
   res :=
   if oper=hold(_not) or oper=hold(op_not) or
      oper=hold(_and) or oper=hold(op_and) or oper=hold(and_)
   then
      // The cases where logical-xor and logical-or might work are too obscure to fish for. 
      allTrue([op(x)],isAssumption);
   elif isEqualityMarker(oper) or isInequalityMarker(oper) then
      bool(isAssumptionSide(op(x,1)) or isAssumptionSide(op(x,2)));
   else
      // print("isAssumption operator fails");
      FALSE;
   end_if;
   // print("isAssumption returns",res);
   res;
 end_proc:

mcutils::isAssumptionSide := proc(x)
 local oper, res;
 begin
   res :=
   if isSymbol(x) then 
      TRUE;
   else
      oper := op(x,0);
      if oper=hold(Re) or oper=hold(mcad_Re) or
         oper=hold(Im) or oper=hold(mcad_Im) or
         oper=hold(abs) or oper=hold(op_abs) or oper=hold(mcad_abs)
      then
         isSymbol(op(x,0));
      else
         FALSE;
      end_if;
   end_if;
   // print("isAssumptionSide",x,res);
   res;
 end_proc:

mcutils::separateAssumptions := proc(constraints)
 local oper, equalities, inequalities, constraint, c, ok;
 begin
   equalities   := _exprseq(); // equalities
   inequalities := _exprseq(); // 
   ok := TRUE;
   for c in constraints do
      for constraint in toAssumptions(c) do
         // print("checking",constraint);
         oper := op(constraint,0);
         if oper = hold(_equal) or oper = hold(op_eq) then
            equalities := equalities, constraint;
         else
            if isAssumption(constraint) then
               // print("is assumption");
               if isInequalityMarker(op(constraint,0)) then
                  // print("is inequality");
                  inequalities := inequalities, constraint;
               else
                  // print("is equality");
                  equalities   := equalities,   constraint;
               end_if;
            else
               // print("is not assumption");
               ok := FALSE;
               break;
            end_if;
         end_if;
      end_for;
   end_for;
   equalities   := [equalities];
   inequalities := [inequalities];
   // print("equalities"=equalities,"inequalities"=inequalities);
   if nops(inequalities) = 0 then
      // print("no inequalities");
      ok := FALSE;
   end_if;
   if ok then
      // print("ok");
      [equalities, inequalities];
   else
      // print("not ok");
      [constraints, []];
   end_if;
 end_proc:

mcutils::functionArgs := proc(fn)
 begin
   if testtype(fn,DOM_PROC) then
      op(fn,1);
   elif testtype(fn,DOM_FUNC_ENV) then
      functionArgs(op(fn,1));
   else
      formatError(errorNotFunction);
   end_if;
 end_proc:

mcutils::functionBody := proc(fn)
 begin
   if testtype(fn,DOM_PROC) then
      op(fn,4);
   else
      formatError(errorNotFunction);
   end_if;
 end_proc:

mcutils::mcLHS := proc(expression)
 begin
   if op(expression,0) = hold(op_eq) then
      op(expression,1);
   else
      lhs(expression);
   end_if;
 end_proc:

mcutils::mcRHS := proc(expression)
 begin
   if op(expression,0) = hold(op_eq) then
      op(expression,2);
   else
      rhs(expression);
   end_if;
 end_proc:

mcutils::getOption := proc(key,items)
 local found, others, result;
 begin
   // print("getOption",key,items);
   found  := FAIL;
   others := _exprseq();
   for item in items do
      // print("item","type(item)"=type(item),"item"=item,"op1"=op(item,1),"key"=key,"hastype(item,_equal)"=hastype(item,"_equal"),"hastype(item,op_eq)"=hastype(item,"op_eq"));
      if (((op(item,0) = hold(_equal)) or (op(item,0) = hold(op_eq))) and op(item,1)=key) then
         if found = FAIL then
            // print("getOption found",item);
            found := item;
         else
            // print("getOption discarding superfluous",item);
            // discard shadowed values
         end_if;
      else
         // print("getOption accumulating in others:",item);
         others := others,item;
      end_if;
   end_for;             
   result := [found, [others]];
   // print("getOption returning",result);
   result;
 end_proc:

mcutils::genTempVar := proc(prefix = "_TEMP_")
 local n;
 begin
   n := if not contains(optionGenTempVarNumberTable,prefix) then
           optionGenTempVarNumberTableStart;
        else
           optionGenTempVarNumberTable[prefix];
        end_if;
   n := n+1;
   optionGenTempVarNumberTable[prefix] := n; 
   text2expr(prefix.n);
 end_proc:

mcutils::buildAlgebraicExtension := proc(elements, ground_field = Dom::Rational, s = [])
 local element, b, x, t, result;
 begin
   result := FAIL;
   if not isList(elements) then
      internalError("First argument to buildAlgebraicExtension must be a list.");
   elif elements = [] then
      //print("buildAlgebraicExpression: base case",ground_field,s);
      result := [ground_field, s];
   else
      element := eval(listFirst(elements));  // get rid of any holds
      //print("buildAlgebraicExpression: working on",element,ground_field,s);
      if testtype(element,"_power") then
         b := op(element,1);
         x := op(element,2);
         t := genTempVar("_mcae_");
         if testtype(x, DOM_RAT) then
            result := buildAlgebraicExtension(listRest(elements), 
                                              Dom::AlgebraicExtension(ground_field,
                                                                      t^denom(x) = b^numer(x)),
                                              [t = element, op(s)]);
         else
            //print("buildAlgebraicExpression: not a rational power");
         end_if;
      else
         //print("buildAlgebraicExpression: not a power");
      end_if;
   end_if;
   if (result = FAIL) then 
      formatError(errorInvalidArgument); // "radical expected"
   else
      result;
   end_if;
 end_proc:

mcutils::mcAlgebraicExtension := proc(elements)
 begin
   // print("mcAlgebraicExtension",elements);
   if elements = [hold(op_eq)(mc_domain,mc_real)] or
      elements = [hold(_equal)(mc_domain,mc_real)] or
      elements = [hold(mc_real)] then
      R_;
   elif elements = [hold(op_eq)(mc_domain,mc_complex)] or
        elements = [hold(_equal)(mc_domain,mc_complex)] or
        elements = [hold(mc_complex)] then
      C_;
   else
      Adjoin=toSet(elements);
   end_if;
 end_proc:

mcutils::parseVarAndRadicals := proc(arglist)
 local v;
 begin
   if arglist = [] then
      return(COMPUTED,[]);
   end_if;
   v := arglist[1];
   if isEquation(v) then
      return(COMPUTED, arglist);
   elif unknowns(v) <> {} then
      return(v, [op(arglist,2..nops(arglist))]);
   else
      return(COMPUTED, arglist);
   end_if;
 end_proc:

mcutils::mcPartFrac := proc(worker_arguments)
 local a, result, errmsg;
 begin
   a := args();
   if (traperror((result := mcPartFracWorker(a))) = 0) then
      result;
   else
      processLastMuPADError();
   end_if;
 end_proc:

mcutils::mcPartFracWorker := proc(r, v, elements=[])
 local ex, res, ov, nv, use_mapcoeffs; 
 begin
   use_mapcoeffs := FALSE;
   ov := v;
   nv := NONE;
   if not testtype(v,DOM_IDENT) then
      nv := _PARTFRAC_TEMP_;
      // print("mcPartFracWorker substituting",v=nv,"into",r);
      r := mcSubs(r, [v=nv]);
      // print("new r=",r);
      v := nv;
      // print("new v=",v);
   else
      // print("mcPartFracWorker sees",v,"as DOM_IDENT");
   end_if;
   // This test added to fix Bug # 980819-092102.
   if not testtype(r, Type::RatExpr(v)) then
      formatError(errorNotRationalFunction);
   end_if;
   // print("mcPartFracWorker exp=",r,"v=",v,"elems=",elements);
   if elements=[] then
      // print("mcPartFracWorker simple (rational)", r, v);
      // with two args, partfrac tries only rational results
      res := partfrac(r, v, if use_mapcoeffs then Mapcoeffs=simplify else () end_if);
   else
      // print("mcPartFracWorker full");
      ex := mcAlgebraicExtension(elements);
      // in fact, with ANY third arg, partfrac will compute a "full" result
      res := partfrac(r, v, ex, if use_mapcoeffs then Mapcoeffs=simplify else () end_if);
      // if user isn't expecting complex, don't surprise him.
      // otherwise, just assume that if he was giving radicals, 
      // he was shooting in the dark.  we only really  domain=real 
      // and domain=complex, but we quietly tolerate radicals and I.
      if (ex = R_) or (( ex <> C_ ) and not(hastype(elements,DOM_COMPLEX))) then
         if hastype(res,DOM_COMPLEX) then
            // print("mcPartFracWorker backing out and returning original arg");
            return(r);
         end_if;
      end_if;
   end_if;

   if use_mapcoeffs then

      // Need to think about the case of x+3*x^2,x here since the Mapcoeffs=simplify
      // hack will factor the result, probably wrongly.

   else

      // This next map call fixes bug # 060412-151628
      // 
      // NOTE: This fix was later moved to BEFORE the final subst 
      // to avoid Bug # 070328-160142, 
      //  mcPartFrac(sin(x)+sin(x)^2*3,sin(x))
      //  yields (wrong):  sin(x) - (3*cos(2*x))/2 + 3/2
      //  should be:       3*sin(x)^2 + sin(x)
      // Having this code here avoids a final call to
      // simplify(3*sin(x)^2), which yields 3/2 - (3*cos(2*x))/2.

      res := map(res,
                 proc(x)
                  local n, d, negate;
                  begin
                    negate := FALSE;
                    n := numer(x); d:= denom(x);
                    if d = 1 then
                       simplify(n);
                    else
                       // print("parfrac simplifying numer and denom",n,d);
                       // Simplifying being done for Bug # 060412-151628
                       n := simplify(n);
                       if Simplify::complexity(-n) < Simplify::complexity(n) then
                          // numer and denom may have put the negative on the top
                          // this gets it back in the right place.
                          n:=-n;
                          negate := TRUE;
                       end_if;
                       // Added factor for Bug # 070328-141300
                       d := factor(simplify(d));
                       // print("parfrac simplified numer and denom",n,d);
                       if negate then
                          hold(_negate)(hold(_divide)(n,d));
                       else
                          hold(_divide)(n,d);
                       end_if;
                    end_if;
                  end_proc,
                 // Needed by Bug # 070328-141300
                 Unsimplified);
      // print("mcPartFracWorker returning(simplified)",res);

   end_if;

   if (nv = NONE) then
      // print("mcPartFracWorker (not aliasing) returns",res);
   else
      // print("mcPartFracWorker returning(raw)",res);
      res := subs(res, [nv=ov], Unsimplified);
      // print("mcPartFracWorker returning(aliased)",res);
   end_if;

   res;
 end_proc:

mcutils::factorWith := proc(expression, elements)
 begin
   factor(expression,mcAlgebraicExtension(elements));
 end_proc:

mcutils::makeContinuedFraction := proc(parts)
 local len, temp, t1, t2;
 begin
   n := listLength(parts);
   if n = 0 then
      0
   else
      temp := parts[1];
      t1  := temp[1];
      t2  := temp[2];
      if n = 1 then
         t1;
      elif t1 = 0 then
         hold(op_div)(t2,makeContinuedFraction(parts[2..n]));         
      else
         hold(op_add)(t1, hold(op_div)(t2,makeContinuedFraction(parts[2..n])));
      end_if;
   end_if;
 end_proc:

// I added this for Bug # 070305-162734, but didn't end up using it.
// I'm pretty sure I'll use it later, so I just left it here. -kmp
mcutils::shouldAutoFloat := proc(x, exceptions={})
   // exceptions is a list of variables that were bound outside 
   // that we can safely ignore
 begin
   if evalFloatNow then
      // Once the user has asked us to do float operations,
      // or we have concluded need them,
      // there's no point to taking the time for this test.
      TRUE;
   elif stdlib::hasfloat(x) then // fast kernel test first
      // now confirm plausibility by assuring there are no 
      // free variables that will inhibit a float result
      if ( numeric::indets(x) minus exceptions ) = {} then
         TRUE;
      else
         FALSE;
      end_if;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::constantly := proc(val)
 option escape; // This function allows a closure to escape
 begin
   proc ()
    begin
      val;
    end_proc;
 end_proc:

mcutils::true  := TRUE:  // in case we use the wrong case
mcutils::false := FALSE: // ditto

mcutils::mcFloatComplex := TRUE:  // keep track of code for non-complex mcfloats in case we need to revert

mcutils::hiddenDigits := 250:

mcutils::displayDigitsDefault := 20:
mcutils::displayDigitsValue   := displayDigitsDefault:
mcutils::displayDigitsChanged := FALSE:

mcutils::displayDigits := proc(value = CURRENT)
 begin
   if (value = RESET) then
      displayDigitsChanged := FALSE;
      displayDigitsValue   := displayDigitsDefault;
   elif (value = CURRENT) then
      if (displayDigitsChanged) then
         displayDigitsValue;
      else
         displayDigitsDefault;
      end_if;
   else
      displayDigitsChanged := TRUE;
      displayDigitsValue   := value;
   end_if;
 end_proc:

mcutils::initializeMathcadPreferences := proc()
 begin

   mcad_csgn := funcenv(mcad_csgn);
   mcad_csgn::type := "mcad_csgn";

   mcad_sign := funcenv(mcad_sign);
   mcad_sign::type := "mcad_sign";

   op_negate := funcenv(op_negate);
   op_negate::type := "op_negate";

   op_sqr := funcenv(op_sqr);
   op_sqr::type := "op_sqr";

   op_power := funcenv(op_power);
   op_power::type := "op_power";

   op_eq := funcenv(op_eq);
   op_eq::type := "op_eq";

   op_mixednum := funcenv(op_mixednum);
   op_mixednum::type := "op_mixednum";

   floatFromString := funcenv(floatFromString);
   floatFromString::type := "floatFromString";

   keyword_solve := funcenv(keyword_solve);
   keyword_solve::type := "keyword_solve";

   mcad_exp := funcenv(mcad_exp);
   mcad_exp::type := "mcad_exp";

   mcFloatComplex := iszero(mcfloat(3,4,5)-float(3+5*I));

   if optionUseMcFloats then
      floatMode(mc_MCFLOAT);
      hiddenDigits := 20;
   else
      floatMode(mc_Float250);
      hiddenDigits := 250;
   end_if;

   simplifyMode(mc_SUBS); // mc_MUPAD or mc_RULES are the other options
                          // preferring mc_SUBS for now as most stable/versatile
   
   Series::printO(FALSE); // don't show +O(n) at end of series
   // print("Initializing Mathcad Preferences...");
   PRETTYPRINT:=FALSE;
   // print("DIGITS := hiddenDigits;");
   DIGITS := hiddenDigits;
   // print("Pref::displayDigits(RESET);");
   displayDigits(RESET);
   // Not yet ready to enable [maybe even won't have to]
   //  Pref::floatFormat("e");
   Pref::trailingZeroes(FALSE);
   // print("Pref::output(",prepareOutput,");");


   // Without this, MuPAD will not display all 
   // elements of large matrices.  (It will instead
   // issue a warning and replace the elements with
   // "...".)
   (Dom::Matrix(Dom::ExpressionField()))::setPrintMaxSize(infinity);

   // Pref::output(my_printer):
   initPrinterForMathcad();
   Pref::output(prepareOutput);

   // print("Pref::postInput(",prepareForInput,");");
   Pref::postInput(prepareForInput);
   // print("Pref::initializeSolve();");
   initializeSolve();
   // print("hiddenDigits=",hiddenDigits);
   // print("displayDigitsValue=",displayDigitsValue);
   // print("DIGITS=",DIGITS);
   // print("Initialized Mathcad Preferences");
   mcutils::floatMode(if optionUseMcFloats then mc_MCFLOAT /*evalMcFloat*/ else mc_Float250 /*evalFloat250*/ end_if);
 end_proc:

mcutils::initPrinterForMathcad := proc()
begin
   Pref::floatFormat("g", 6);

   prog::init(Content);

   unprotect(DOM_FLOAT);
   DOM_FLOAT::Content := (Out,data) -> Out::Ccn(data);
   protect(DOM_FLOAT, ProtectLevelError);

   unprotect(DOM_PROC);
   // use new Content wrapper Cproc
   DOM_PROC::Content := (Out,data) -> Out::Cproc(expr2text(data));
   protect(DOM_PROC, ProtectLevelError);

   unprotect(Content);
   // define Cproc
   Content::Cproc := () -> dom::create("proc", "", "", args());
   protect(Content, ProtectLevelError);
   // back translation method Content -> MuPAD expression
   Content::set("proc", FAIL, FAIL, x -> stdlib::Exposed(extop(x, 4)));

end():

mcutils::initializeSolve := proc()
 begin
   // Originally this was mc__25_foo to make %foo after unmangling.
   // Users objected, so we made it mc__5F_foo to make _foo after unmangling.
   // See Bug # 060924-043801
   sysassign(solvelib::preferredIdents[Z_],[mc__5F_n, mc__5F_k]);
   sysassign(solvelib::preferredIdents[R_],[mc__5F_x, mc__5F_y, mc__5F_u, mc__5F_v, mc__5F_w]);
   sysassign(solvelib::preferredIdents[Q_],[mc__5F_p, mc__5F_q]);
   sysassign(solvelib::preferredIdents[C_],[mc__5F_z]);
   sysassign(solvelib::preferredPrefixes[Z_],mc__5F_k);
   sysassign(solvelib::preferredPrefixes[R_],mc__5F_x);
   sysassign(solvelib::preferredPrefixes[Q_],mc__5F_q);
   sysassign(solvelib::preferredPrefixes[C_],mc__5F_z);
   optionGenTempVarNumberTable:=table();
 end_proc:

mcutils::optionIntegrateUsesCauchyPrincipalValue := FALSE:
mcutils::optionIntegrateChecksDiscontinuities := hold(DEFINITE): // Changed to from FALSE per Leopold's compromise suggestion on 061011-101526 and 060717-141854 at Decisions meeting of 12-Oct-2006.
mcutils::optionSolveTempVarNamePrefix         := "mc__5F_": // Use "_" not "%" per Bug # 060924-043801
mcutils::optionSolveTempVarName               := mcutils::optionSolveTempVarNamePrefix."c":
mcutils::optionGenTempVarNumberTableStart     := 0:
mcutils::optionGenTempVarNumberTable          := table();
mcutils::optionSuppressZeroMixedNum           := FALSE:
mcutils::optionSumContainsNamedConstants      := FALSE:
mcutils::optionSumContainsScalars             := TRUE:
mcutils::optionCollectMaxPowerMultiples       := 1:
mcutils::optionCollectMaxPowerMultiplesLimit  := 50:
mcutils::optionEvalFloatUsesDynamicDigits     := FALSE:
mcutils::optionIgnoreFalseAssumptions         := FALSE:
mcutils::optionMaybeSimplify                  := TRUE:
mcutils::optionSimplifyMaxSteps               := 1000:
mcutils::optionSolveEliminatesConstants       := TRUE:
mcutils::optionSolveDefaultMaxDegree          := 4:
mcutils::optionSolveTryNumeric                := TRUE:
mcutils::optionUseMcFloats                    := FALSE:  // might be reassigned by startup sequence in mupadengine.cpp
// mcutils::optionUseUnicodeIdentifiers       := FALSE:  // ditto
mcutils::optionUseSurd                        := TRUE:
mcutils::optionVectorSumAllowsMatrices        := FALSE:
mcutils::optionSolveIgnoreSpecialCases        := TRUE:
mcutils::optionAllowEvenOdd                   := TRUE:
mcutils::optionUndefinedIsContagious          := TRUE:
mcutils::optionFully                          := FALSE:
mcutils::optionApplySolveConstraints          := FALSE: // not debugged
mcutils::optionSimulateMTaylor                := FALSE: // for use if mtaylor problems discovered
mcutils::optionRaw                            := FALSE: // must be FALSE globally; bound TRUE by "raw" keyword
mcutils::optionExperimentally                 := FALSE: // msut be FALSE globally; bound TRUE by "experimentally" keyword
mcutils::optionConsolidateSolvePiecewiseResults := TRUE:  // enable post-simplification of piecewise solve results
mcutils::optionSubstitutionVarName            := "mc__5F_t";

// Leopold 2006-01-26
// The Content::expr@Content function mangles procedures
// in a lossy way.  For example, you'll get things like
//
//   basefuncs::op_deriv_1(`proc f(_local_3_mc_x) ... end`, mc_x)
//
// There's no way for the parser to recover whatever the '...'
// represents.
//
// This wrapper avoids calling Content::expr@Content on expressions
// which contain procedures; I don't know if there's a better
// way to handle this.

mcutils::prepareOutputPreferred:=((stdlib::Exposed)@expr2text@(Content::expr)@Content):
mcutils::prepareOutputFallback:=((stdlib::Exposed)@expr2text):

mcutils::prepareForInput := proc()
 begin
   optionGenTempVarNumberTable:=table();
    // print("preparing for input");
    // print("displayDigitsDefault=",displayDigitsDefault);
    // print("displayDigitsValue=",displayDigitsValue);
    // print("DIGITS=",DIGITS);
   if (optionUseMcFloats) then
      displayDigits(RESET);
   else
      displayDigitsChanged := FALSE;
   end_if;
    // print("done preparing for input");
 end_proc:

mcutils::checkUndefined := proc(data) // not used - this didn't work in prepareOutput because it crashes MuPAD
 local x;
 begin
   if data = undefined or data = hold(undefined) or
      data = FAIL      or data = hold(FAIL) then
      TRUE;
   elif isMatrix(data) then
      allTrue(data,checkUndefined);
   elif isList(data) or testtype(data,DOM_EXPR) then
      if isPiecewise(data) then return(FALSE); end_if;
      // Normally we don't get lists in this kind of thing, but the exception is
      //  hold(matrix([[a,b],[c,d]]))
      // which is a DOM_EXPR, not a Dom::Matrix(), that gets descended by going
      // into its arguments.
      for x in op(data) do
         if checkUndefined(x) then return(TRUE); end_if;
      end_for;
      FALSE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::prepareOutput := proc(data)
 local // exceptions,
   prepared;
 // save DIGITS;
 begin
   if optionUndefinedIsContagious then
      if checkUndefined(data) then
         data := hold(undefined);
      end_if;
   end_if;

   if has(data,hold(hypergeom)) then
      // print("data(before)"=expr2text(data),"type(data)"=type(data));
      data := misc::maprec(data,
                           {"hypergeom"}=proc(x)
                                          local x1,x2,x3;
                                          begin
                                            x1 := op(x,1);
                                            x2 := op(x,2);
                                            x3 := op(x,3);
                                            if isList(x1) then
                                               x1 := toVector(x1);
                                            end_if;
                                            if isList(x2) then
                                               x2 := toVector(x2);
                                            end_if;
                                            hold(mcad_hypergeom)(x1,x2,x3);
                                          end_proc,
                           Unsimplified);
      // print("data(after)"=expr2text(data),"type(data)"=type(data));
   end_if;

   // print("preparing for output");
   if (not displayDigitsChanged) then
      if not optionUseMcFloats then
         // print("Adjusting display for ",displayDigits()," of precision, setting DIGITS to ",hiddenDigits);
         data := adjustFloatPrecision(data, displayDigits());
      // DIGITS := hiddenDigits;
      end_if;
   else
      if optionUseMcFloats then
         data := adjustFloatPrecision(data, displayDigits());
      end_if;
      // print("Adjusting display for ",displayDigits()," of precision.");
   end_if;
   // DIGITS := displayDigits();
   if args(0) > 1 then
      return(map(args(), prepareOutput));
   end_if;
//   if (domtype(data)=mcfloat) then
//      return(data);
//   end_if;
//   exceptions := {DOM_PROC};
   if // contains(exceptions, type(data)) = FALSE 
      // and 
      traperror((prepared := prepareOutputPreferred(data))) = 0
   then prepared;
   else 
      // print("Fancy display failed. Using fallback. getlasterror()=",getlasterror());
      prepareOutputFallback(data);
   end_if;
 end_proc:

/*
mcutils::my_printer := proc(data)
    local prepared;
begin
    if args(0) > 1 then
       return(map(args(), my_printer))
    end_if;
    if traperror( (prepared := prepareOutputPreferred(data)) ) = 0
    then
       prepared
    else
       prepareOutputFallback(data)
    end_if
end_proc:
*/

mcutils::checkNotListSyntax := proc(datum)
 begin
   if isList(datum) then formatError(errorBadSyntax); end_if;
   datum;
 end_proc:

mcutils::checkNotOp := proc(result,procnames)
 begin
   if (domtype(procnames) <> DOM_SET) then
      internalError("Second argument to checkNotOp must be a set.");
   end_if;
   if op(result,0) in procnames then
      formatError(errorSymbolic);
   else
      result;
   end_if;
 end_proc:

mcutils::checkSymbol := proc(var)
 begin
   if not isSymbol(var) then
      formatError(errorNotSymbol);
   end_if;
 end_proc:


// TO DO: These could be done better with a trick like vectorMapper uses
//        -kmp

mcutils::checkInteger := proc(n)
 begin
   if not isInteger(n) then
      formatError(errorNotInteger);
   end_if;
 end_proc:

mcutils::checkNonNegativeInteger := proc(n)
 begin
   if not isNonNegativeInteger(n) then
      formatError(errorNotNonNegativeInteger);
   end_if;
 end_proc:


mcutils::checkPositiveInteger := proc(n)
 begin
   if not isPositiveInteger(n) then
      formatError(errorNotPositiveInteger);
   end_if;
 end_proc:

mcutils::checkProc := proc(obj)
 begin
   if not isProc(obj) then
      internalError("Did not see DOM_PROC where expected.");
   end_if;
 end_proc:

mcutils::checkReal := proc(n)
 begin
   if not isReal(n) then
      formatError(errorNotReal);
   end_if;
 end_proc:

mcutils::checkScalar := proc(v)
 begin
   if not isScalar(v) then
      formatError(errorNotScalar);
   end_if;
 end_proc:

mcutils::checkVector := proc(v, kind=ANY)
 begin
   if not isVector(v, kind) then
      formatError(errorNotVector);
   end_if;
 end_proc:

mcutils::checkMatrix := proc(v)
 begin
   if not isMatrix(v) then
      formatError(errorNotMatrix);
   end_if;
 end_proc:

mcutils::checkMatrixSquare := proc(v)
 begin
   if not isMatrixSquare(v) then
      formatError(errorMatrixNotSquare);
   end_if;
 end_proc:

mcutils::checkNoOccurrences := proc(var,expr)
 begin
   if has(expr,var) then
      formatError(errorAmbiguousVar);
   else
      expr;
   end_if;
 end_proc:

mcutils::allTrue := proc(c,p)
 local temp, x;
 begin
   temp := TRUE;
   for x in c do
      if not p(x) then temp := FALSE; break; end_if;
   end_for;
   
   temp;
 end_proc:

mcutils::anyTrue := proc(c,p)
 local temp, x;
 begin
   temp := FALSE;
   for x in c do
      if p(x) then temp := TRUE; break; end_if;
   end_for;
   
   temp;
 end_proc:

mcutils::isTrue := proc(x)
 begin
   isScalar(x) and not iszero(x);
 end_proc:

mcutils::isEvery := proc(container, predicate)
 local result, item;
 begin
   result := true;
   for item in container do
      if not predicate(item) then
         result := false;
         break;
      end_if;
   end_for;
   result;
 end_proc:

// Like isTrue, but throws an error for non-scalar values.
// (sym_to_bool in efisymbolics.mpl will fall back to this function.)
mcutils::toBool := proc(x)
 local b;
 begin
   if isScalar(x) then 
      b:=iszero(x);
      if (b = TRUE or b = FALSE) then return(not b); end_if;
   end_if;
   formatError(errorNotScalar);
 end_proc:

mcutils::setElements := proc(set)
 begin
   op(set);
 end_proc:

mcutils::setElementsAsList := proc(obj)
 local x, res;
 begin
   res := _exprseq();
   if (testtype(obj,Dom::Multiset)) then
      for x in obj do
         res := res,(x[1]$x[2]);
      end_for;
      res;
   else
      coerce(obj,DOM_LIST);
   end_if;
 end_proc:

mcutils::listElements := proc(list)
 begin
   op(list);
 end_proc:

mcutils::listLength := proc(list)
 begin
   nops(list);
 end_proc:

mcutils::listFirst := proc(list)
 begin
   op(list,1);
 end_proc:

mcutils::listRest := proc(list)
 begin
   [op(list,2..nops(list))];
 end_proc:

mcutils::removeFrom := proc(expression, to_remove)
 local newargs, argument;
 begin
   newargs := _exprseq();
   for argument in op(expression) do
      if not (argument = to_remove) then
         newargs := newargs,argument;
      end_if;
   end_for:
   if isList(expression) then
      [newargs];
   elif isSet(expression) then
      {newargs};
   else
      op(expression,0)(newargs);
   end_if;
 end_proc:

mcutils::unknownsToIgnore := 
     { hold(E), // See bug #060816-113756 - Type::ConstantIdents contains exp(1), not hold(E)
       hold(Undirected),
       // These are from Type::ConstantIdents See bug # 021217-102802c and related e-mail.
       // I'd prefer to take the set above, S, and use S union Type::ConstantIdents, but
       // somehow I get excess evaluation.
       hold(I),
       hold(PI),
       hold(CATALAN),
       hold(EULER) }:

mcutils::unknownsSoFar := {}:

mcutils::unknowns := proc(expression)
 save unknownsSoFar;
 begin
   // print("enter unknowns",expression,"unknownsSoFar"=unknownsSoFar);
   // Better to use indets than numeric::indets because numeric::indets doesn't descend
   // special-purpose structures
   unknownsSoFar := removeFrom((indets(if isMatrix(expression) then [op(expression)] else expression end_if)
                                minus unknownsToIgnore),
                               hold(E));
   misc::maprec(expression,
                {DOM_PROC, DOM_FUNC_ENV}=proc(x)
                                          begin
                                            if isAnonymousProc(x) then
                                               unknownsSoFar := _union(unknownsSoFar,unknowns(procBody(x)) minus procVars(x));
                                            end_if;
                                            x;
                                          end_proc,
                Unsimplified); // it's for effect, after all
   unknownsSoFar := _union(unknownsSoFar, mcSpecialFunctionUnknowns(expression));
   // print("leave unknowns",expression,"result"=unknownsSoFar);
   unknownsSoFar;
 end_proc:

mcutils::mcSpecialFunctionNames := {"keyword_solve"};

mcutils::mcSpecialFunctionUnknowns := proc(expression, initialUnknowns={})
 save unknownsSoFar;
 begin
   // print("enter mcSpecialFunctionNames",expression,"initial"=initialUnknowns);
   unknownsSoFar := initialUnknowns;
   misc::maprec(expression, 
                mcSpecialFunctionNames=proc(x)
                                        local f;
                                        begin
                                          f := op(x,1);
                                          // print("Found",f,"vars"=procVars(f),"unknownsSoFar"=unknownsSoFar);
                                          unknownsSoFar := mcSpecialFunctionUnknowns(procBody(f),
                                                                                     _union(procVars(f),unknownsSoFar));
                                          // print("After recursion","unknownsSoFar"=unknownsSoFar);
                                          x;
                                        end_proc,
                Unsimplified);
   // print("leave mcSpecialFunctionNames",unknownsSoFar);
   unknownsSoFar;
 end_proc:

mcutils::evalFloatMinimumPrecision := 250:

mcutils::evalMcFloat := proc(expression, requested_precision=COMPUTED)
 local result;
 save DIGITS;
 begin
   if requested_precision = COMPUTED then 
      requested_precision := DIGITS;
   end_if;
   DIGITS := requested_precision;
   // print("evalMcFloat(preeval)",expression,"digits=",DIGITS);
   result := eval(expression);
   // print("evalMcFloat(posteval)",result);
   result := mcfloat(result,requested_precision);
   displayDigits(requested_precision);
   result;
 end_proc: 

mcutils::mcFloatFromString := proc(s)
 begin
   floatFromString(s, TRUE);
 end_proc:

mcutils::floatFromString := proc(s, use_mcfloats = COMPUTED)
 local epos, dotpos, ndigits, nchars;
 save DIGITS;
 begin
   if ( use_mcfloats = COMPUTED ) then
      use_mcfloats := optionUseMcFloats;
   end_if;

   //DIGITS:=length(s)-1;
   //return(mcfloat(text2expr(s),DIGITS));
   // The above is an interim definition until a bug in stringlib::pos is explained. -kmp 01-Jun-2006

   // DIGITS:=hiddenDigits;

   // print("mcFloatFromString","s"=s, "use_mcfloats"=use_mcfloats);
   nchars := length(s);
   // print("nchars"=nchars);
   epos   := stringlib::pos(s,"e",1);
   // print("epos"=epos);
   dotpos := stringlib::pos(s,".",1);
   // print("dotpos"=dotpos);
   if epos = FAIL then
      if dotpos = FAIL then
         ndigits := nchars;
      else
         ndigits := nchars-1;
      end_if;
      if dotpos = nchars then
         // Part of a fix for Bug # 070517-160327
         // Tolerate "17." as synonym for "17.0"
         // It won't work at toplevel, but it comes in from Mathcad
         // like this sometimes because Mathcad allows users to type this.
         s := s."0";
      end_if;
   else
      if dotpos = FAIL then
         ndigits := epos-1;
      elif dotpos < epos then
         ndigits := epos-2;
      else // dot isn't supposed to follow the e, but don't fuss about that here.
         ndigits := epos-1;
      end_if;
   end_if;
   if use_mcfloats then
      DIGITS := max(DIGITS,ndigits,hiddenDigits); // was just "digits", but can't be.  consider 3.0e100+1.0e98
      mcfloat(text2expr(s)); // removed ",ndigits" for same reason.
   else
      DIGITS := max(DIGITS,ndigits,hiddenDigits);
      text2expr(s);
   end_if
 end_proc:

mcutils::evalFloat250 := proc(expression, requested_precision=COMPUTED)
 local temp, result;
 begin
   // print("evalFloat250(",expression,",",requested_precision,")");

   if (requested_precision = COMPUTED) then
     if (optionEvalFloatUsesDynamicDigits) then
        requested_precision := displayDigits();
     else
        requested_precision := displayDigitsDefault;
     end_if;
   end_if;

   // print("evalFloat250(",expression,",",requested_precision,")");

   // Suppressed as probably the wrong thing.  Better to compute with full precision.
   //
   // This pass will resolve named constants to a particular known precision as if they had been typed in that way.
   // For example, PI becomes 3.1416 in requested_precision=5
   // expression := misc::maprec(expression, isNamedConstant = (c -> evalOneFloat(c, requested_precision)));
   // print("evalFloat250(",expression," /* named constants resolved */)");

   // expression := misc::maprec(expression, isNamedConstant = float); // (c->evalOneFloat(c,requested_precision));

   // In this pass, the first float will assure that named constants are resolved to floats (to prevailing precision, probably 250).
   // Then the eval will occur, forcing user-function calls, which will see float arguments.
   // Finally, the results are floated again because the results might contain things like sin(0.5) that need to force float evaluation.
   //print("evalFloat250 expression=",expression);
   
   temp := float(eval(expression)); //float(eval(float(...)))??
   // print("evalFloat250 temp=",temp);
   result := adjustFloatPrecision(temp, requested_precision);
   // print("evalFloat250 result=",result);
   displayDigits(requested_precision);
   result;
 end_proc:

mcutils::adjustFloatPrecision := proc(expression, precision)
 begin
   // Unsimplified here causes things like factored, rectform, and other special formats not to get clobbered by this action.
   // It's done with the careful understanding that this particular substitution should not affect the shape of the tree,
   // just the number of floating point digits at certain leaves. -kmp 25-Apr-2006
   misc::maprec(expression,
                // isMatrix=((x)->matrixMap(x, ((e)->adjustFloatPrecision(e, precision)))),
                // Unsimplified,
                isFloating=((x)->evalOneFloat(x, precision)),
                Unsimplified,
                // Use PostMap so that 3.5 ends up as mcfloat(3.5, 10) not mcfloat(mcfloat(3.5, 20), 10). -kmp 07-Jun-2006
                PostMap);
 end_proc:

mcutils::mcExpr := proc(expression)
 begin
   // Bug # 061201-142407 tripped this up.  See keyword_collect for a use.
   // expr(matrix) would return an array, not a matrix.
   // mcExpr(matrix) just returns the matrix, not an array.
   // We have no use for arrays.
   if isMatrix(expression) then
      map(expression,mcExpr);
   else
      expr(expression);
   end_if;
 end_proc:

mcutils::mcexpr2text := proc(expression)
 local ret;
 save DIGITS;
 begin
   DIGITS := displayDigits();
   // print("entered mcexpr2text",expression);
   ret := expr2text(unmcfloat(expression));
   // print("leaving mcexpr2text with",ret);
   ret;
 end_proc:

mcutils::unmcfloat := proc(expression)
 local ret;
 begin
   // print("in unmcfloat",domtype(expression),expression);
   ret:=misc::maprec(expression,
                     {mcfloat}=
                          proc (x) 
                           begin 
                             // print("unmcfloat prepass",x);
                             if mcFloatComplex then                        
                                mcfloat::mcfloat_to_float(x,DIGITS);
                             else
                                evalOneFloat(x,DIGITS,FALSE);
                             end_if;
                           end_proc,
                       Unsimplified, PostMap);
  // print("in unmcfloat(2) ret=",ret);
   ret :=
   misc::maprec(ret,
                {"floatFromString"}=proc(x)
                              local ret;
                              begin
                                // print("in unmcfloat helper");
                                //if op(x,0)=hold(floatFromString) then 
                                   // print("fixing:",x,"optionUseMcFloats"=optionUseMcFloats);
                                   ret:=evalOneFloat(eval(x),DIGITS,FALSE);
                                   // print("fixed:",domtype(ret),ret,"optionUseMcFloats"=optionUseMcFloats);
                                   ret;
                                //else 
                                   // print("not fixing:",x);
                                  // x;
                                //end_if
                              end_proc,
                Unsimplified, PostMap);
   // print("leaving unmcfloat with",domtype(ret),ret);
   ret;
 end_proc:
   
mcutils::evalOneFloat := proc(expression, // : DOM_FLOAT,
                              requested_precision=COMPUTED,
                              mcfloat_result=COMPUTED)
 save DIGITS;
 local r, i, hidden_precision, rounded_display_string, rounded_display_string_i, result;
 begin
   // print("in evalOneFloat, expression=",expression,"requested_precision = ",requested_precision,if args(0)>1 then "(explicit)" else "(defaulted)" end_if);
   if requested_precision = COMPUTED then
      requested_precision := DIGITS;
   end_if;
   if mcfloat_result = COMPUTED then
       // print("setting mcfloat_result to ",optionUseMcFloats);
      mcfloat_result := optionUseMcFloats;
   end_if;
   // print("evalOneFloat entered","mcfloat_result"=mcfloat_result);
   if (testtype(expression,mcfloat)) then
      requested_precision := min(requested_precision, mcfloat::prec(expression));
      expression := mcfloat::expr(expression); //mcfloat::exprR(expression)+mcfloat::exprI(expression)*I;
   end_if;
   // print("isComplex(",expression,")=>",isComplex(expression));
   if optionUseMcFloats and mcFloatComplex then
      r := Re(expression);
      i := Im(expression);
   else
      if isComplex(expression) then
         r := Re(expression);
         i := Im(expression);
         return(  (if isFloating(r) then evalOneFloat(r,requested_precision,mcfloat_result) else r end_if)
                + (if isFloating(i) then evalOneFloat(i,requested_precision,mcfloat_result) else i end_if)*I);
      end_if;
   end_if;
   hidden_precision := max(DIGITS, 
                           requested_precision,
                           evalFloatMinimumPrecision);
   // print("evalOneFloat(",r,i,",",requested_precision,") DIGITS=",DIGITS,"hp=",hidden_precision);
   DIGITS := requested_precision;
   if optionUseMcFloats and mcFloatComplex then
      rounded_display_string   := expr2text(float(r,requested_precision));
      rounded_display_string_i := expr2text(float(i,requested_precision));
      // print("evalOneFloat rounded(r): ",rounded_display_string);
      // print("evalOneFloat rounded(i): ",rounded_display_string_i);
      DIGITS := hidden_precision;
      result := text2expr(rounded_display_string)+text2expr(rounded_display_string_i)*I;
   else
      rounded_display_string   := expr2text(float(expression,requested_precision));
      DIGITS := hidden_precision;
      result := text2expr(rounded_display_string);
   end_if;
   if (mcfloat_result) then
      // print("evalOneFloat converting,",result," to a mcfloat","prec"=requested_precision);
      result := mcfloat(result, requested_precision);
   else
      // print("evalOneFloat NOT converting,",result," to a mcfloat.");
   end_if;
   // print("evalOneFloat returning: ",domtype(result),result);
   result;
 end_proc:

mcutils::evalFloatNow := FALSE:

mcutils::evalFloat := proc(expression, requested_precision=COMPUTED)
 save evalFloatNow;
 begin
   evalFloatNow := TRUE;
   evalFloatDispatch(args());
 end_proc:

mcutils::evalFloatDispatch := evalFloat250: // overridden later if optionUseMcFloats is set when initializing

mcutils::floatMode := proc(mode = mc_CURRENT)
 begin

   // If the argument is CURRENT, we read the mode rather than set it.
   if (mode = hold(mc_CURRENT)) then
      if (evalFloatDispatch = evalMcFloat) then
         mode := hold(mc_MCFLOAT);
      elif (evalFloatDispatch = evalFloat250) then
         mode := mc_Float250;
      else
         mode := hold(mc_UNKNOWN);
      end_if;

   // If we got here, the mode is not CURRENT, so try 
   // to set the mode if we can understand the value...

   elif (mode = hold(mc_MCFLOAT)) then
      evalFloatDispatch := evalMcFloat;
      mcutils::hiddenDigits := 20;
      optionUseMcFloats := TRUE;
   else
      // These are all non-McFloat modes, but don't set 
      // that variable until we check the value is valid.
      if (mode = hold(mc_Float250)) then
         mcutils::hiddenDigits := 250;
         evalFloatDispatch := evalFloat250;
         optionUseMcFloats := FALSE;
      else
         internalError("Bad mode: %1", mode);
      end_if;
      // If we got this far, the value must be valid.
      optionUseMcFloats := FALSE;
   end_if;

   mode;
 end_proc:

mcutils::evalRectangular := proc(expression)
 local result;
 begin
   // print("evalRectangular expression"=expression);
   vars := unknowns(expression);
   // print("evalRectangular vars"=vars);
   expression := attachAssumptions(hold(rectForm)(expression),
                                   map(vars, var -> hold(domTypeAssumption)(var, Type::Real)));
   // print("evalRectangular expression"=expression);
   result := eval(expression);
   // print("evalRectangular result"=result);
   result;
 end_proc:

mcutils::scalarList := proc(obj)
 begin
   if isScalar(obj) then
      [obj];
   elif isVector(obj) then
      [op(obj)];
   elif isList(obj) then
      obj;
   else
      // used only in heuristic internal situations, so
      // the user wouldn't understand something more precise anyway
      formatError(errorSymbolic); 
   end_if;
 end_proc:

mcutils::toList := proc(obj)
 begin
   coerce(obj,DOM_LIST);
 end_proc:

mcutils::toSet := proc(obj)
 local res;
 begin
   res := coerce(obj,DOM_SET);
   if res = FAIL then
      internalError("Failed to coerce to set: ".expr2text(obj));
   else
      res;
   end_if;
 end_proc:

mcutils::isBool := proc(obj)
 begin
   bool(domtype(obj)=DOM_BOOL);
 end_proc:

mcutils::isComplex := proc(obj)
 local ret;
 begin
   if testtype(obj,DOM_COMPLEX) then
      TRUE;
   elif testtype(obj,mcfloat) then
      not iszero(Im(obj));
   else
      FALSE;
   end_if;
 end_proc:

//
//
//mcutils::isFloat := proc(obj)
// begin
//   bool(domtype(obj)=DOM_FLOAT);
// end_proc:

 // This predicate is true of floats and complexes with float parts,
mcutils::isFloating := proc(obj)
 begin
   if (domtype(obj) = DOM_FLOAT) then
      TRUE;
   elif (domtype(obj) = DOM_COMPLEX) then
      bool(isFloating(Re(obj)) or isFloating(Im(obj)));
   elif (testtype(obj, mcfloat)) then
      TRUE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::isNonNegativeInteger := proc(n)
 begin
   if not isInteger(n) then
      return(FALSE);
   elif n < 0 then
      return(FALSE);
   else
      return(TRUE);
   end_if;
 end_proc:

mcutils::isPositiveInteger := proc(n)
 begin
   if not isInteger(n) then
      return(FALSE);
   elif n <= 0 then
      return(FALSE);
   else
      return(TRUE);
   end_if;
 end_proc:

mcutils::isInteger := proc(obj)
 begin
   bool(domtype(obj)=DOM_INT);
 end_proc:

mcutils::isList := proc(obj)
 begin
   bool(domtype(obj)=DOM_LIST);
 end_proc:

mcutils::isSet := proc(obj)
 begin
   bool(domtype(obj)=DOM_SET);
 end_proc:

mcutils::isProc := proc(x)
 begin
   bool(domtype(x)=DOM_PROC);
 end_proc:

mcutils::isFunction := proc(x)
 begin
   bool(domtype(x) in {DOM_PROC, DOM_FUNC_ENV});
 end_proc:

mcutils::isAnonymousProc := proc(fn)
 begin
   if fn::dom = DOM_FUNC_ENV then
      isAnonymousProc(op(fn,1));
   elif not testtype(fn,DOM_PROC) then
      FALSE;
   elif testtype(simplifyName(procName(fn,SELF)), DOM_IDENT) then
      TRUE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::isNotReal := proc(x)
 begin
   if is(x,Type::Real)=FALSE // i.e., we know it for sure, not just that it's unknown
      and 
      x <> infinity
      and
      x <> -infinity
      // is(x,stdlib::Infinity)=FALSE  // and we're sure it's not infinity either, since is(infinity,Type::Real) => FALSE
                                    // for some reason I don't understand. (Remove this clause if that gets fixed.) -kmp
   then
      TRUE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::isReal := proc(x)
 local d;
 begin
   d := domtype(x);
   bool(d in { DOM_INT, DOM_RAT, DOM_FLOAT } or ( (d = mcfloat) and iszero(Im(x)) ));
 end_proc:

mcutils::isConstant := proc(x)
 begin
   isScalar(x) or isNamedConstant(x);
 end_proc:

mcutils::isNonIntegerConstant := proc(x)
 begin
   ( isScalar(x) and not isInteger(x) ) or isNamedConstant(x);
 end_proc:

mcutils::isNamedConstant := proc(x)
 begin
   isSymbol(x) and isScalar(float(x));
 end_proc:

mcutils::isRational := proc(x)
 begin
    bool(domtype(x) in { DOM_INT, DOM_RAT });
 end_proc:

mcutils::isConstantExp := proc(x)
 begin
   bool(nops(unknowns(x)) = 0);
 end_proc:

mcutils::isScalar := proc(x)
 begin
    bool(domtype(x) in { DOM_INT, DOM_RAT, DOM_FLOAT, DOM_COMPLEX, mcfloat });
 end_proc:

mcutils::isScalarExp := proc(x)
 begin
   if isString(x) or isMatrix(x) then 
      FALSE
   else
      isConstantExp(x);
   end_if;
 end_proc:

mcutils::booleanOperators := 
    hold(hold)( // Work around a bug wherein at toplevel mupad does 
                // infinite evaluation until the evaluation subsides
                // rather than a single reliable evaluation like it would
                // do in a program. (sigh)
         {hold(_and),   hold(_or),   hold(_not),   hold(_xor),       // MuPAD booleans
          hold(op_and), hold(op_or), hold(op_not), hold(op_xor),     // ours
          hold(and_),   hold(or_),   hold(not_),
          hold(_leequal), hold(_less), hold(_equal), hold(_unequal), // MuPAD comparisons
          hold(op_leq),   hold(op_lt), hold(op_eq),  hold(op_neq),   // ours
          hold(_geequal), hold(_great),                              // ours
          hold(op_geq),   hold(op_gt),
          hold(basefuncs::op_xor)  // we're not compiling xor the same as the other booleans, so we need special handling.
                                   // probably that's a symptom of a translator bug for xor.
          // next three are for Bug # 070411-150559
          // these are returned by the corresponding operators as noun forms
          ,hold(basefuncs::op_and)
          ,hold(basefuncs::op_or) 
          ,hold(basefuncs::op_not)

          }):

mcutils::isBooleanOperator := proc(x)
 local res;
 begin
   // print("isBooleanOperator",x);
   res := bool(x in booleanOperators);
   // print("returning",res);
   res;
 end_proc:

mcutils::involvesBooleans := proc(x)
 begin
   has(x,booleanOperators);
 end_proc:

mcutils::matrixElements := proc(m)
 local nc, res;
 begin
   res := _exprseq();
   nc := linalg::ncols(m);
   for i from 1 to linalg::nrows(m) do
      for j from 1 to nc do
         res := res, m[i,j];
      end_for;
   end_for;
   [res];
 end_proc:

mcutils::matrixTypes := {Dom::Matrix(), 
                      // MuPAD PL6 didn't like this set.  Instead, let's find what depended on this. -kmp 13-Jun-2006
                      // DOM_LIST,
                         Dom::PseudoTensor()}:

mcutils::isPiecewise := proc(obj)
 begin
   if testtype(obj,piecewise) then 
      TRUE;
   elif testtype(obj,DOM_EXPR) then
      op(obj,0)=hold(piecewise);
   else
      FALSE;
   end_if;
 end_proc:

mcutils::isMatrix := proc(obj) // *** PROBABLY INEFFICIENT ***
 local res, x;
 begin
   // print("isMatrix",obj);
 //res := bool(coerce(obj,Dom::Matrix())<>FAIL);
   res := FALSE;
   for x in matrixTypes do
      if domtype(obj) = x then 
         res := TRUE;
         break;
      end_if;
   end_for;
   // print("isMatrix returns",res);
   res;
 end_proc:

mcutils::isNotInteger := proc(x)
 begin
   if isMatrix(x) then
      // matrices are definitely not integers
      TRUE;
   elif isString(x) then
      // strings are definitely not integers
      TRUE;
   elif domtype(x) in {DOM_PROC, DOM_FUNC_ENV} then
      // functions are definitely not integers
      TRUE;
   elif testtype(x,"_range") then
      // ranges are definitely not integers (and probably shouldn't be floating around at all)
      TRUE;
   elif isScalar(x) then
      if not isInteger(x) then
         TRUE;
      else
         FALSE;
      end_if;
   elif testtype(x,DOM_EXPR) then
      if is(x,Type::Integer)=FALSE then
         // only if we're really sure it's false; don't count UNKNOWN
         TRUE;
      else
         FALSE;
      end_if;
   else
      // either is an integer or can't tell yet
      FALSE;
   end_if;
 end_proc:

mcutils::isNotVar := proc(x)
 begin
   if isConstantExp(x) then
      // Any constant is "not a variable".
      TRUE;
   elif isSymbol(x) then
      // Any non-constant symbol is not "not a variable",
      // that is, it is a variable.
      FALSE;
   elif isMatrix(x) then
      // Any matrix is "not a variable".
      TRUE;
   elif isString(x) then
      // Any matrix is "not a variable".
      TRUE;
   elif isFunction(x) then
      // Any matrix is "not a variable".
      TRUE;
   elif isList(x) then
      // Any list is "not a variable".
      TRUE;      
   else
      // Otherwise, we can't tell without executing it.
      FALSE;
   end_if;
 end_proc:

mcutils::isNotMatrix := proc(x)
 begin
   if isMatrix(x) then
      // Any matrix is not "not a matrix".
      FALSE;
   elif isList(x) then
      // Any list is "not a variable".
      TRUE;      
   elif isConstantExp(x) then
      // If all the variables are known and it wasn't a matrix, that's that.
      // e.g., 17 or sqrt(2)
      TRUE;
   elif isFunction(x) then
      // Any matrix is "not a variable".
      TRUE;
   else
      // Otherwise, we can't tell without executing it.
      FALSE;
   end_if;
 end_proc:

mcutils::isEquation := proc(x)
 begin
   if testtype(x,"_equal") or
//      (testtype(x,"function") and op(x,0) = hold(op_eq)) then
      testtype(x,"op_eq") then
      TRUE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::isMatrixSquare := proc(mat) 
 begin
   bool(linalg::nrows(mat) = linalg::ncols(mat));
 end_proc:

mcutils::isString := proc(obj)
 begin
   bool(domtype(obj)=DOM_STRING);
 end_proc:

mcutils::isSymbol := proc(obj)
 begin
   bool(domtype(obj)=DOM_IDENT);
 end_proc:

mcutils::isVector := proc(obj, kind=COLUMN, checksize=NONE)
 local c,r;
 begin
   if not isMatrix(obj) then
      FALSE;
   else
      c:=linalg::ncols(obj);
      r:=linalg::nrows(obj);
      case kind 
      of ANY    do bool((c=1 and ( checksize=NONE or checksize=r )) or
                        (r=1 and ( checksize=NONE or checksize=c ))); break;
      of COLUMN do bool( c=1 and ( checksize=NONE or checksize=r ) ); break;
      of ROW    do bool( r=1 and ( checksize=NONE or checksize=c ) ); break;
      otherwise FALSE; break;
      end_case;
   end_if;
 end_proc:

mcutils::preferInteger := proc(x)
 local c;
 begin
   c:= ceil(x);
   if  x=float(c) then
      c;
   else
      x;
   end_if;
 end_proc:

mcutils::_great   := proc(x,y) begin x >  y; end_proc:
mcutils::_geequal := proc(x,y) begin x >= y; end_proc:

mcutils::invertRelationMarker := proc(x) 
 begin 
   x := toLogical(x);
   if    x = hold(_less)    then hold(_geequal)
   elif  x = hold(_leequal) then hold(_great)
   elif  x = hold(_great)   then hold(_leequal)
   elif  x = hold(_geequal) then hold(_less)
   elif  x = hold(_equal)   then hold(_unequal)
   elif  x = hold(_unequal) then hold(_equal)
   else
      FAIL;
   end_if;
 end_proc:


// ==================== Sort Predicates ====================
// Miscellaneous sort predicates that are used in various
// places in the code for sorting vectors of values.

mcutils::sortByScalarColumnNum := 1:

mcutils::sortByScalarColumn := proc(data, colnum = 1)
 local rownum, row;
 save sortByScalarColumnNum;
 begin
   sortByScalarColumnNum := colnum;
   // print("sortByScalarColumn on data",data,"column_number",colnum);
   for rownum from 1 to listLength(data) do
      row := data[rownum];
      if not isScalarExp(row[colnum]) then 
         // neither number nor named constant
         error(errorNotScalarMatrix);
      end_if;
   end_for;
   sort(data, 
        proc(x, y) // x and y are rows
         local xi, yi;
         begin
           // print("pred x=",x);
           // print("pred y=",y);
           // print("pred colnum=",sortByScalarColumnNum);
           xi := op(x, sortByScalarColumnNum);
           yi := op(y, sortByScalarColumnNum);
           // print("pred xi=",xi);
           // print("pred yi=",yi);
           if isScalarExp(xi) then
              xi := Re(xi);
           end_if;
           if isScalarExp(yi) then
              yi := Re(yi);
           end_if;
           // print("pred xi=",xi);
           // print("pred yi=",yi);
           xi < yi;
         end_proc);
 end_proc:

mcutils::realPartLess := proc(x, y)
 begin
   evalFloat(Re(x)) < evalFloat(Re(y));
 end_proc:

mcutils::realPartGreater := proc(x, y)
 begin
   evalFloat(Re(x)) > evalFloat(Re(y));
 end_proc:

mcutils::absLess := proc(x, y)
 begin
   evalFloat(abs(x)) < evalFloat(abs(y));
 end_proc:

mcutils::absGreater := proc(x, y)
 begin
   evalFloat(abs(x)) > evalFloat(abs(y));
 end_proc:

mcutils::fuzzyPrecision := 1.0e-12:

mcutils::heuristicEqual := proc(variable_thing, fixed_thing, tolerance)
 begin
   if isConstant(fixed_thing) then
      if is(abs(variable_thing - fixed_thing) <= tolerance)=TRUE then
         TRUE;
      else
         FALSE;
      end_if;
   else
      bool(variable_thing = fixed_thing);
   end_if;
 end_proc:

mcutils::fuzzyPosition := proc(thing, container, precision = fuzzyPrecision)
 local i, result, fthing, item;
 begin
   i := -1;
   result := FAIL;
   fthing = evalFloat(thing);
   for item in container do
      i := i+1;
      if fuzzyEqual(fthing, evalFloat(item), precision) then
         result := i;
         break;
      end_if;
   end_for;
   if (result = FAIL) then 
      formatError(errorNotFound);
   else
      result;
   end_if;
 end_proc:

mcutils::fuzzyEqual_scalar := proc(n1, n2, precision = fuzzyPrecision)
 local delta, ave, temp, res;
 begin
   // print("fuzzyEqual_scalar",n1,n2,precision);
   delta := abs(float(n1)-float(n2));
   ave := abs(float(n1)+float(n2))/2;
   // print ("In fuzzyEqual_scalar","delta"=delta,"ave"=ave,"prec"=precision);
   // print ("ave=",ave);
   // print ("p=",precision);
   res := iszero(delta);
   if (res = TRUE) then
      // print("difference is zero. returning TRUE");
      return(TRUE);
   end_if;
   temp := delta/ave;
   // print("delta/ave"=temp);
   res := is(temp < precision);
   // print("is(delta/ave < ",precision,")=>",res);
   res;
 end_proc:
   
mcutils::fuzzyEqual := proc(n1, n2, precision = fuzzyPrecision)
 local r, c;
 begin
   if isMatrix(n1) and isMatrix(n2) then
      // print("matrices",n1,n2,precision);
      allCompareTrue(((n1,n2)->fuzzyEqual(n1, n2, precision)),n1,n2);
   elif isScalar(n1) and isScalar(n2) then
      // print("scalars",n1,n2,precision);
      fuzzyEqual_scalar(n1, n2, precision);
   else
      // print("bailing",n1,n2);
      bool(n1=n2);
   end_if;
 end_proc:

mcutils::distributeMatrixBinOp := proc(f, m1, m2)
 local nr, nc, r, c, row, rows, res;
 begin
   if isMatrix(m1) then
      if isMatrix(m2) then
         nr := linalg::nrows(m1);
         nc := linalg::ncols(m1);
         if (nr = linalg::nrows(m2) and
             nc = linalg::ncols(m2)) then
            // print("matching matrices");
            rows := _exprseq();
            for r from 1 to nr do
               row := _exprseq();
               for c from 1 to nc do
                  row := row, distributeMatrixBinOp(f, m1[r,c], m2[r,c]);
               end_for;
               rows := rows,[row];
            end_for;
            return(matrix([rows])); // if no uncertainty, return TRUE; otherwise, UNKNOWN
         else
            formatError(errorMatrixDimensionMismatch);
         end_if;
      else
         nr:=linalg::nrows(m1);
         nc:=linalg::ncols(m1);
         // print("not both matrices. m2:=matrix(",nr,nc,m2,")");
         m2 := matrix(nr,nc,((a,b)->m2));
         // print("new m2"=m2);
         return(distributeMatrixBinOp(f,m1,m2)); // not both matrices
      end_if;
   else
      if isMatrix(m2) then
         nr:=linalg::nrows(m2);
         nc:=linalg::ncols(m2);
         // print("not both matrices. m2:=matrix(",nr,nc,m1,")");
         m1 := matrix(nr,nc,((a,b)->m1));
         // print("new m1"=m1);
         return(distributeMatrixBinOp(f,m1,m2)); // not both matrices         
      else // both scalars
         // print("scalar");
         // print("comparing",m1,m2);
         res := f(m1, m2);
         // print("comparison=>"=res);
         res;
      end_if;
   end_if;
 end_proc:

mcutils::allCompareTrue := proc(predicate, m1, m2)
 local nr, nc, r, c, res, success;
 begin
   if isMatrix(m1) then
      if isMatrix(m2) then
         nr := linalg::nrows(m1);
         nc := linalg::ncols(m1);
         if (nr = linalg::nrows(m2) and
             nc = linalg::ncols(m2)) then
            success := TRUE;
            // print("matching matrices");
            for r from 1 to nr do
               for c from 1 to nc do
                  // print("Comparing",m1[r,c],"with",m2[r,c]);
                  res := allCompareTrue(predicate, m1[r,c],m2[r,c]); // is(predicate(m1[r,c],m2[r,c]));
                  if res = FALSE then
                     return(FALSE);
                  elif res = UNKNOWN then
                     success := UNKNOWN;
                  end_if;
               end_for;
            end_for;
            return(success); // if no uncertainty, return TRUE; otherwise, UNKNOWN
         else
            // print("dims don't match");
            return(FALSE); // dims don't match
         end_if;
      else
         // print("not both matrices. m2=",domtype(m2),m2);
         return(FALSE); // not both matrices
      end_if;
   else
      if isMatrix(m2) then
         // print("not both matrices. m1=",domtype(m1),m1);
         return(FALSE); // not both matrices         
      else // both scalars
          // print("scalar pred=",predicate,"m1=",m1,"m2=",m2);
         success:=is(predicate(m1, m2));
         // print("scalar result=",success);
         success;
      end_if;
   end_if;
 end_proc:

mcutils::looksTheSame := proc(a, b)
 local text_a, text_b, result;
 begin
   // print("Comparing",a,"to",b);
   text_a := mcexpr2text(a);
   text_b := mcexpr2text(b);
   // print("=> Comparing",text_a,"to",text_b);
   result := bool(text_a = text_b);
   // print("=> ",result);
   result;
 end_proc:

mcutils::simplerThan := proc(x, y)
   // Subjective ordering predicate
 begin
   if isReal(x) and isReal(y) then
      if x > 0 and y > 0 then
         x < y;
      elif x > 0 then
         TRUE;
      elif y > 0 then
         FALSE;
      else 
         x > y;
      end_if;
   elif isReal(x) then
      TRUE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::mcSeries := proc(expression, vars, atpoints, degrees, atpoint = 0, degree = 6)
 local nvars, var, res;
 save optionSimulateMTaylor;
 begin
   if isMatrix(expression) then
      matrixMap(expression, x->mcSeries(x,vars,atpoints,degrees,atpoint,degree));
   else
      nvars := listLength(vars);
      if nvars=0 then
         vars     := [theOnlyIndepVar(unknowns(expression))];
         atpoints := [atpoint];
         degrees  := [degree];
         nvars    := 1;
      end_if;
      // defaulting is done, now retry with real data
      if (optionSimulateMTaylor) then // old, simulated technique, from before we found (undocumented) mtaylor in MuPAD
         // print("SIMULATING");
         // print("(defaulted)","vars"=vars,"atpoints"=atpoints,"degrees"=degrees);
         // Notes:
         //  * MuPAD normally puts a +O(x^6) "error range" term here,
         //    but we've suppressed that by an option variable.
         //    See initializeMathcadPreferences().
         //  * MuPAD sometimes doesn't insert exactly the requested number
         //    of terms here.  At some point, we should look into papering
         //    over that.  Refer to bug # 060404-103023 and related email.
         // print("vars"=vars);
         // print("atpoints"=atpoints);
         // print("degrees"=degrees);
         // print("nvars"=nvars);
         for i from 1 to nvars do
            // print("pass",i);
            var     := vars[i];
            atpoint := atpoints[i];
            degree  := degrees[i];
            // print("expression"=expression);
            // print("var"=var);
            // print("atpoint"=atpoint);
            // print("degree"=degree);
            //
            // !!! Is this the right way to interpret x,y,z?  By just iterated calls?
            // I've asked for a clarification of that, and this implementation is tentative.
            // -kmp 13-Sep-2006
            expression := series(expression, var=atpoint, degree);
            
            // print("expression(expanded)"=expression);
            if i <> nvars then expression := coerce(expression,DOM_EXPR); end_if; // get rid of the O(x^6) term
         end_for;
         expression;
      else
         // print("MTAYLOR");
         if traperror(( res := mtaylor(expression,zip(vars,atpoints,_equal),max(op(degrees))) ))<>0 then
            res := FAIL;
         elif has(res, hold(mtaylor)) then
            res := FAIL;
         end_if;
         if res = FAIL then
            // print("RECOVERING FROM MTAYLOR ERROR");
            optionSimulateMTaylor := TRUE;
            res := mcSeries(expression, vars, atpoints, degrees, atpoint, degree);
            if has(res, hold(series)) then
               formatError(errorSeriesFail);
            end_if;
         end_if;
         // print("SORTING SERIES RESULT");
         sortSeries(res, vars);
      end_if;
   end_if;
 end_proc:

mcutils::emptySetMarker := hold(undefined): // mc_FAIL: // _hex_6D635FE28885 = O with / through it.

mcutils::forceNumericSolution := proc(solve_expression)
 local basic_args, solutions, eqns, vars;
 begin
   // print("forceNumericSolution",solve_expression);
   // removeFrom(solveExpression, VectorFormat=TRUE);  // ... and also remove MaxDegree
   eqns := op(solve_expression,1);
   vars := op(solve_expression,2);
   basic_args := eqns,vars;

/*
   if testtype(vars,DOM_IDENT) then
      vars := [vars];
   end_if;
   if nops(unknowns(solve_expression) minus toSet(vars))>0 then
      // numeric solvers are notoriously bad at symbolic solving.
      return(FAIL);
   end_if;
*/
   if (traperror(( solutions := numeric::solve(basic_args) )) = 0) then
      // print("forceNumericSolution returning",solutions);
      solutions;
   else
       // print("forceNumericSolution failed:",expr2text(getlasterror()));
      FAIL;
   end_if;
 end_proc:

mcutils::mcSolve := proc(equations, vars)
 local res;
 begin
   // print("mcSolve input",map(args(),expr2text));
   res := mcSolve1(args());
   // print("mcSolve res(unadjusted)",expr2text(res));
   res := adjustPiecewises(res);
   // print("mcSolve res(adjusted)",expr2text(res));
   res;
 end_proc:

mcutils::isRelation := proc(e)
 local res;
 begin
   res := 
   if isMatrix(e) then
      FALSE;
   elif isEqualityMarker(op(e,0)) then
      TRUE;
   elif isInequalityMarker(op(e,0)) then
      TRUE;
   else
      FALSE;
   end_if;
   // print("isRelation",e,"returning",res);
   res;
 end_proc:

mcutils::isPolynomialRelation := proc(eqn, vars)
 local oper, lh, rh;
 begin
   res :=
   if not isRelation(eqn) then
      FALSE;
   else
      bool(testtype(op(eqn,1),Type::PolyExpr(op(vars))) and
           testtype(op(eqn,2),Type::PolyExpr(op(vars))));
   end_if;
   // print("isPolynomialRelation",eqn,"returning",res);
   res;
 end_proc:

mcutils::mcSolve1 := proc(equations, vars)
 // This is our centralized entry point to the solver, to remind us to set VectorFormat=TRUE
 // so that post-processing can work correctly. -kmp 26-Apr-2006
 local multi,v,solutions,e,vf,msg,eqns,md, isc, solve_args;
 begin
   // print("mcSolve1 entered", "ignoreSpecialCases"=optionSolveIgnoreSpecialCases,"defaultMaxDegree"=optionSolveDefaultMaxDegree);
   // print("equations"=equations,"vars"=vars);
   md := (MaxDegree=optionSolveDefaultMaxDegree);
   // print("mcSolve1, md=",md);
   // print("fixing up vars=",vars);
   // vars := fixupProcs(vars);
   // print("fixed up vars=",vars);
   // vars := [op(vars)];
   // print("mcSolve1 testing ",equations," for Type::PolyExpr(",v,")");
   // print("equations(before)=",equations);
   // print("equations(1)"=equations, "vars(1)"=vars);
   equations := toLogical(equations,NATIVE);
   // print("equations(after)=",equations);
   if not isList(equations) then
      equations := [equations]; 
   end_if;
   // print("equations(2)"=equations, "vars(2)"=vars);
   // Fix for Bug # 060714-104604, in which solving for a polynomial doesn't do the same as for polynomial=0
   equations := map(equations,(e->if isRelation(e) then e else hold(_equal)(e,0) end_if));
   multi := _exprseq();
   if nops(equations)=1 and nops(vars)=1 then
      e := op(equations,1);
      if isEquation(e) and isPolynomialRelation(e,vars) then
         multi := Multiple;
         // This adjustment to equations and vars should fix Bug # 060818-155949
         equations := mcLHS(e)-mcRHS(e);
         vars := op(vars,1);
      end_if;
   end_if;
   vf := (VectorFormat=TRUE);
   isc := if optionSolveIgnoreSpecialCases 
          then IgnoreSpecialCases
          else _exprseq()
          end_if;
   // print("equations(3)"=equations, "vars(3)"=vars);
   while TRUE do
      solve_args := equations, vars, vf, multi, md, isc;
      // print("trying to solve(",solve_args,")");
      e := traperror(( solutions := solve(solve_args) ));
      if (e = 0) then
         // print("win. options = ", vf, multi,"solutions=",solutions);
         return(solutions);
      end_if;
      msg := getlasterror();
      if (op(msg,1)<>1028) then 
         lasterror(); // resignal error [!!! we should do something better]
      elif ((nops(multi) > 0) and stringlib::contains(op(msg,2),"multiple")) then
         // print("lose. vars=",vars);
         if // FALSE and // Hopefully this not needed any more in response to fix for Bug # 060818-155949 above
            (isList(vars) or isSet(vars)) and nops(vars)=1 then
            vars := op(vars,1);
            // print("lose. setting vars to",vars);
         else
            // print("lose. removing multiple.");
            multi := _exprseq();
         end_if;
      elif ((nops(vf) > 0) and stringlib::contains(op(msg,2),"numeric::")) then
         // print("lose. removing vectorformat.");
         vf := _exprseq();
      else
         lasterror(); // see comments above
      end_if;
   end_while;
 end_proc:

mcutils::siftSolveResults := proc(x, bounds=NONE)
 local lo, hi, real_results, best, results, delta, res;
 begin
   results := processSolveResults(x,false);
   // print("sifting results=",results,"bounds=",bounds);
   real_results := _exprseq();
   if (nops(results) > 0) then
      best := NONE;
      if (domtype(bounds) = DOM_LIST) then
         // print("sifting case #1");
         lo := bounds[1];
         hi := bounds[2];
         for res in results do
            if isReal(res) then
               if ((best = NONE or res <= best) and res >= lo and res <= hi) then
                  real_results := res, real_results;
                  best := res;
               end_if;
            end_if;
         end_for;
         // Real results required here.
         results := [real_results];
      elif (bounds <> NONE) then
         // print("sifting case #2");
         lo := bounds;
         for res in results do
            if isReal(res) then
               delta := res-lo;
               if (best = NONE or delta <= best) then
                  real_results := res, real_results;
                  best := delta;
               else
                  real_results := real_results, res;
               end_if;
            end_if;
         end_for;
         // Real results required here.
         results := [real_results];
      else
         // print("sifting case #3");
         for res in results do
            if (isReal(res)) then
               real_results := real_results, res;
            end_if;
         end_for;
         // Real results preferred but not required in this case.
         if (nops(real_results) > 0) then
            results := sort([real_results],simplerThan);
         end_if;
      end_if;
   end_if;
   // print("sifted:",results);
   if (nops(results) = 0) then
      formatError(errorSymbolic);
   else
      results[1];
   end_if;
 end_proc:

mcutils::mcMinerrSubs := proc(unknowns,unk = NONE)
 local subs;
 begin
   subs := _exprseq();
   for u in unknowns do
      if u = unk then
         subs := subs,u=1;
      else
         subs := subs,u=0;
      end_if;
   end_for;
   [subs];
 end_proc:

mcutils::mcMinerr := proc(eqns,unknowns)
 local A,B,n,m,i,j,u,sb,res,s,d;
 begin
   n := nops(unknowns);
   m := nops(eqns);

   // MuPAD's numeric::leastSquares function takes as input
   // matrices A and B and solves for a matrix X such that
   // A*X = B in the least-squares sense.  Here we construct
   // A and B from the equations given.
   A := matrix(m,n);
   B := matrix(m,1);

   for i from 1 to m do
      // Transform lhs=rhs into lhs-rhs
      if testtype(eqns[i],"_equal") then
         eqns[i] := op(eqns[i],1) - op(eqns[i],2);
      end_if;
   end_for;
   
   for i from 1 to m do
      sb:=mcMinerrSubs(unknowns);
      B[i]:= -subs(eqns[i],sb);   
      for j from 1 to n do

         // If one of the equations isn't linear in one of
         // the unknowns, we don't have a valid input to
         // numeric::leastSquares.
         // This check fixes bug 061220-182201.
         d := degree(eqns[i],unknowns[j]);
         if not (d = 0 or d = 1) then
            formatError(errorNoSolveSolution);
         end_if;

         sb:=mcMinerrSubs(unknowns,unknowns[j]);
         A[i,j]:=subs(eqns[i],sb) + B[i];
      end_for;
   end_for;

   res:=numeric::leastSquares(A,B,Soft,Symbolic)[1];

   s := _exprseq();
   for i from 1 to n do
      s := s,unknowns[i]=res[i,1];
   end_for;

   // Return the result in a format the solve-post-processing code
   // is expecting (a set of lists of equations).
   {[s]};
 end_proc:

mcutils::toVector := proc(thing)
 begin
   if isMatrix(thing) then
      toVector(matrixElements(thing));
   elif isList(thing) then
      matrix(map(thing,DOM_LIST));
   else
      matrix([[thing]]);
   end_if;
 end_proc:

mcutils::toMatrix := proc(thing)
 begin
   if isMatrix(thing) then
      thing
   else
      matrix([[thing]]);
   end_if;
 end_proc:

mcutils::isAbs := proc(x)
 local v;
 begin
   if op(x,0) = hold(abs) or op(x,0)=hold(op_abs) or op(x,0)=hold(mcad_abs) then
      v := op(x,1);
      if isMatrix(v) or op(v,0)=hold(matrix) then
         FALSE;
      else
         TRUE;
      end_if;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::isEqualityMarker := proc(x)
 local res;
 begin
   res :=
   if x = hold(_equal) then TRUE;
   elif x = hold(op_eq) then TRUE;
   else FALSE;
   end_if;
   // print("isEqualityMarker",x,"returns",res);
   res;
 end_proc:

mcutils::isUnequalityMarker := proc(x)
 local res;
 begin
   res :=
   if x = hold(_unequal) then TRUE;
   elif x = hold(op_neq) then TRUE;
   else FALSE;
   end_if;
   // print("isUnequalityMarker",x,"returns",res);
   res;
 end_proc:

mcutils::isInequalityMarker := proc(x)
 local res;
 begin
   res :=
   if   x = hold(_unequal) then TRUE;
   elif x = hold(op_neq)   then TRUE;
   elif x = hold(_less)    then TRUE;
   elif x = hold(op_lt)    then TRUE;
   elif x = hold(_leequal) then TRUE;
   elif x = hold(op_leq)   then TRUE;
   elif x = hold(_great)   then TRUE;
   elif x = hold(op_gt)    then TRUE;
   elif x = hold(_geequal) then TRUE;
   elif x = hold(op_leq)   then TRUE;
   else FALSE;
   end_if;
   // print("isInequalityMarker",x,"returns",res);
   res;
 end_proc:

mcutils::isInequality := proc(x)
 local a, temp;
 begin
    // print("isInequality entered",x);
   if testtype(x,"_not") then
      // print("isInequality checking NOT",x);
      if testtype(op(x,1),DOM_EXPR) then
         if isEqualityMarker(op(op(x,1),0)) then
            return(TRUE);
         else
            if isUnequalityMarker(op(op(x,1),0)) then
               return(isInequality(hold(_equal)(op(op(x,1)))));
            end_if;
         end_if;
      end_if;
      // if we got here, fall through to other tests below...
   end_if;
   if testtype(x,DOM_EXPR) then
       // print("isInequality descending DOM_EXPR",x);
      if isInequalityMarker(op(x,0))
      then return(TRUE);
      else
         for a in x do
            // print("trying DOM_EXPR",a);
            if isInequality(a) then
               // print("found one",a);
               return(TRUE);
            end_if;
         end_for;
      end_if;
      return(FALSE);
   elif testtype(x,Dom::Matrix()) or testtype(x,DOM_LIST) or testtype(x,DOM_SET) then
      // print("isInequality descending container",x);
      for a in x do
         // print("trying matrix element",a);
         if isInequality(a) then
            // print("found an inequality in the container:",a);
            return(TRUE);
         end_if;
      end_for;
      // print("found no inequality");
      return(FALSE);
   else
      // print("giving up");
      return(FALSE);
   end_if;
 end_proc:

mcutils::toLogical := proc(mathcad_logical, mode=NORMAL)
   // possible modes NORMAL, NATIVE
   // For those cases where we want to just convert our notation
   // to MuPAD raw notation (e.g., for assumptions)
   // In other situations, such as evaluating conditionals,
   // don't do this; instead see isTrue. -kmp 20-Jan-2006
 local mupad_logical;
 begin
   // print("toLogical got",mathcad_logical);
   mupad_logical:=subs(mathcad_logical, 
                       [hold(and_)=hold(_and),
                        hold(or_)=hold(_or),
                        hold(bv)=id,
                        hold(as_bool)=id,
                        hold(op_and)=hold(_and),
                        hold(op_or)=hold(_or),
                        hold(op_xor)=hold(_xor),
                        hold(op_not)=hold(_not),
                        hold(op_eq)=hold(_equal),
                        hold(op_neq)=hold(_unequal),
                        hold(op_lt)=hold(_less),
                        hold(op_leq)=hold(_leequal),
                        hold(op_gt)=if mode = NORMAL then hold(_great) else ((x,y)->(x>y)) end_if,
                        hold(op_geq)=if mode = NORMAL then hold(_geequal) else ((x,y)->(x>=y)) end_if,
                        hold(_great)=if mode = NORMAL then hold(_great) else ((x,y)->(x>y)) end_if,
                        hold(_geequal)=if mode = NORMAL then hold(_geequal) else ((x,y)->(x>=y)) end_if,
                        ()]);
   mupad_logical := misc::maprec(mupad_logical,
                                 {"id"}=(x->op(x,1)),
                                 Unsimplified);
   // print("toLogical returning",mupad_logical);
   mupad_logical;   
 end_proc:

mcutils::processSolveInequality := proc(vars, results)
 local res, res1, i, v, r;
 begin
   // print("processSolveInequality",vars,results);
   res := _exprseq();
   for i from 1 to nops(vars) do
      res1 := simplifySetToDeclarations(op(vars,i), op(results,i));
      if not res1[1] then 
         // print("inequality failing");
         return(FAIL); 
      end_if;
      res := res,res1[2]; // first approximation
   end_for;
   res;
 end_proc:

mcutils::mc_e := hold(E);

mcutils::toE := proc(ex, alias=hold(E))  // Converts exp(x) throughout into E^x
 save mc_e;
 begin
   mc_e := alias;
   misc::maprec(ex,{"exp","mcad_exp"}=(x->if isMatrix(op(x,1)) 
                               then // This is either E^M for M being a square matrix or is E^V for a vectorized call.
                                    // We don't handle those cases, which are probably rare anyway.
                                  formatError(errorInappropriateExpression); // for want of something better
                               else
                                  hold(_power)(mc_e,op(x,1))
                               end_if),
                Unsimplified);
 end_proc:

mcutils::fromE := proc(ex, alias=hold(E)) // Converts E^x throughout into exp(x)
 save mc_e;
 begin
   if alias <> hold(E) then
      ex := subs(ex,alias=hold(E),Unsimplified);
   end_if;
   misc::maprec(ex,{"_power"}=(x->if op(x,1)=hold(E) or op(x,1)=E then hold(exp)(op(x,2)) else x end_if),Unsimplified);
 end_proc:

mcutils::domTypeAssumptions := proc(e,typename)
 local result, type;
 begin
   if isSymbol(e) then
      result := [hold(domTypeAssumption)(e,typename)];
   else
      type := eval(typename);
      if is(e,type)=FALSE then
         // If it can be disproved, tell the user.
         formatError(errorInvalidAssumption);
      else
         // Otherwise, just go on...
         result := [];
      end_if;
   end_if;
   result;
 end_proc:

mcutils::toAssumptions := proc(expression)
 local kind, arg1, arg2, result, temp, clause, relation, bound, val;
 begin
   // print("toAssumptions entered. raw exp=",expression);
   expression := toLogical(expression);
   // print("toAssumptions. cooked exp=",expression);
   kind := op(expression,0);
   arg1 := op(expression,1);
   arg2 := op(expression,2);
   // print("kind=",kind,"arg1=",arg1,"arg2=",arg2);
   if ( kind = hold(_equal) or kind = hold(op_eq) ) then
      if op(arg1,0)=hold(matrix) then arg1:=matrix(op(arg1)); end_if;
      if isMatrix(arg1) then
         result := map([op(arg1)],arg1->op(toAssumptions(arg1=arg2)));
      elif (arg2 = hold(mc_complex)) then
         result := domTypeAssumptions(arg1,hold(Type::Complex));
      elif (arg2 = hold(mc_real)) then
         result := domTypeAssumptions(arg1,hold(Type::Real));
      elif (arg2 = hold(mc_integer)) then
         result := domTypeAssumptions(arg1,hold(Type::Integer));
      elif optionAllowEvenOdd and (arg2 = hold(mc_even)) then
         result := domTypeAssumptions(arg1,hold(Type::Even));
      elif optionAllowEvenOdd and (arg2 = hold(mc_odd)) then
         result := domTypeAssumptions(arg1,hold(Type::Odd));
      elif (op(arg2,0) = hold(mc_RealRange) and nops(arg2) = 2) then
         temp := fixupRange(op(arg2,1)..op(arg2,2));
         // x=RealRange(lo,hi) means lo<x<hi which is what Type::Interval(lo,hi) means.
         result := domTypeAssumptions(arg1,hold(Type::Interval)(op(temp)));
      else
         // Hmm... I don't know if this should work.
         // We turned it off because the doc said it shouldn't work like
         // substitute, and yet there are cases where it can be useful and
         // where MAPLE used to accept it.  So I'm disabling the error for now.
         // -kmp 10-May-2006
         // error(errorBadSyntax);
         result := [expression];
      end_if;
   elif ( kind = hold(bv) or kind = hold(as_bool) or kind = hold(id)) then
      result := toAssumptions(op(expression));
   elif ( kind = hold(_and) or kind = hold(op_and) or kind=hold(and_) ) then
      // print("and'd expression=",expression);
      result := map([op(expression)],x->op(toAssumptions(x)));
      // print("result=",result);
   elif ( kind = hold(_not) or kind=hold(not_) or kind=hold(op_not) ) then
      temp := op(arg1,0);
      if isEqualityMarker(temp) or isInequalityMarker(temp) then
         temp := invertRelationMarker(temp);
         if temp = FAIL then
            result := [expression];
         else
            result := [temp(op(arg1))];
         end_if;
      elif ( temp = hold(_not) or temp=hold(not_) or temp=hold(op_not) ) then
         result := toAssumptions(op(arg1,1));
      elif ( temp = hold(_or) or temp=hold(or_) or temp=hold(op_or) ) then
         result := toAssumptions(map(hold(op_and)(op(arg1)),(val->hold(op_not(val)))));
      else
         result := [expression];
      end_if;
   elif kind = hold(_less)  or kind = hold(op_lt) or
        kind = hold(_leequal) or kind = hold(op_leq) then
      // |val| < bound
      // becomes
      // [ -bound < val, val < bound]
      if isAbs(arg1) then
         val      := op(arg1,1);
         bound    := arg2;
         relation := toLogical(kind);
         result := [relation(-bound, val),relation(val, bound)];
      else
         result := [expression];
      end_if;
   elif kind = hold(_great) or kind = hold(op_gt) or
        kind = hold(_geequal) or kind = hold(op_geq) then
      // bound > |val|
      // becomes
      // [-bound < val, val < bound]
      if isAbs(arg2) then
         val      := op(arg2,1);
         bound    := arg1;
         relation := toLogical(kind);
         result := [relation(-bound, val),relation(val, bound)];
      else
         result := [expression];
      end_if;
   else
      result := [expression];
   end_if;
   // print("toAssumptions returning", result);
   result;
 end_proc:

mcutils::assumptionIsUseful := proc(expression)
 local n1, n2, is_result, result;
 begin
   // print("in assumptionIsUseful",expression);
   if (nops(expression)<> 2) then
      formatError(errorInvalidAssumption);
   end_if;
   n1 := nops(unknowns(op(expression,1)));
   n2 := nops(unknowns(op(expression,2)));
    // print("n1=",n1,"n2=",n2);
   if (n1 = 0 and n2 = 0) then
      // Expression contains no unknowns, so just check it for truth.
      // print("assumptionIsUseful is going to try is(",expression,")");
      is_result := is(eval(expression));
      // print(" is(",expression,") returned ",is_result);
      if (is_result) then
         // print("assumption",expression,"is not useful, but it's TRUE.");
         result := FALSE;
      else
         // print("assumption",expression,"is NOT useful because it fails.");
         if (not optionIgnoreFalseAssumptions) then
            formatError(errorInvalidAssumption);
         end_if;
         result := FALSE;
      end_if;
   elif (n1 = 1 or n2 = 1) then
      // print("assumption",expression,"is well-formed");
      result := TRUE;
   else
      // print("assumption",expression,"is too complex");
      formatError(errorInvalidAssumption);
   end_if;
    // print("assumptionIsUseful returning",result);
   result;
 end_proc:

mcutils::toEquation := proc(expression)
 begin
   if op(expression,0) = hold(op_eq) then
      _equal(op(expression));
   else
      expression;
   end_if;
 end_proc:


mcutils::checkArgsInternal := proc(thing_kind, thing_name, actual, expected_lo, expected_hi = COMPUTED)
 begin
   if (expected_hi = COMPUTED) then
      expected_hi = expected_lo;
   end_if;
   // print("checkArgsInternal",thing_kind,thing_name,"actual"=actual,"lo"=expected_lo,"hi"=expected_hi);
   if (actual < expected_lo) then
      if thing_kind = "keyword" then
         if expected_lo = 1 and expected_hi = 1 then
            formatError(errorTooFewKeyArgs1, actual);
         else
            formatError(errorTooFewKeyArgs, expected_lo, actual);
         end_if;
      else // thing_kind = "function"
           // functions always take at least one arg, so the errorTooFewArgs1 case doesn't occur
         formatError(errorTooFewArgs, expected_lo, actual);
      end_if;
   elif (actual > expected_hi) then
      if thing_kind = "keyword" then
	      if (expected_hi = 1) then
	         formatError(errorTooManyKeyArgs1, actual);
	      else
	         formatError(errorTooManyKeyArgs, expected_hi, actual);
	      end_if;
      else // thing_kind = "function"
	      if (expected_hi = 1) then
	         formatError(errorTooManyArgs1, actual);
	      else
	         formatError(errorTooManyArgs, expected_hi, actual);
	      end_if;
      end_if;
   end_if;
   // Returns the actual number of arguments so it can be cased upon.
   actual;
 end_proc:

mcutils::checkArgs := proc(fn_name, actual, expected_lo, expected_hi = COMPUTED)
 begin
   if (expected_hi = COMPUTED) then
      expected_hi := expected_lo;
   end_if;
   checkArgsInternal("function", fn_name, actual, expected_lo, expected_hi);
 end_proc:

mcutils::checkKeywordArgs := proc(keyword_name, actual, expected_lo, expected_hi = COMPUTED)
 begin
   if (expected_hi = COMPUTED) then
      expected_hi := expected_lo;
   end_if;
   // The first argument to keywords doesn't appear as such to users.
   checkArgsInternal("keyword", keyword_name, actual-1, expected_lo-1, expected_hi-1);
 end_proc:

mcutils::makeProc := proc(vars, expr)
 local vars_text, expr_text, result;
 begin
   // SURELY there is a better way to do this, but it's not obvious what it is.
   // Use this procedure only in RARE situations.  If it happens a lot, we need
   // to ask SciFace for something more efficient. -kmp 13-Feb-2006
   vars_text := expr2text(op(vars));
   expr_text := expr2text(expr);
   text2expr( "proc(" . vars_text . ") name anonymous; begin " . expr_text . " end_proc:");
 end_proc:

mcutils::fixupFloatInt := proc(n)
 local i;
 begin
   if isFloating(n) then
      i := mcad_trunc(n);
      if is(i = n)=TRUE then
         return(i);
      end_if;
   end_if;
   n;
 end_proc:

mcutils::fixupRange := proc(range)
 local lo, hi;
 begin
   if (type(range) = "_range") then
      // evaluating the hi and lo gets rid of op_negate(xxx)
      // or other opaque computations (e.g., in assumptions,
      // which are unevaluated when processed)
      // -kmp 03-May-2006
      lo := eval(op(range,1));
      hi := eval(op(range,2));
      if (is(hi < lo) = TRUE) then   
         // Items in wrong order like 2..1 need to be fixed to 1..2
         return(hi..lo);
      else
         // Items in right order (like 1..2)
         // or else still opaque and can't tell like a..b
         return(lo..hi);
      end_if;
   else
      // Not a range. Maybe a variable expecting to evaluate to a range.
      // Just return it as is.
      return(range);
   end_if;
 end_proc:

mcutils::fixupLimit := proc(limitExpr)
 begin
   limitExpr;
 end_proc:

/* // Not actually needed, and causes problems.
mcutils::fixupLimit := proc(limitExpr)
 local body,bounds,direction,limop,var,val;
 begin
   if op(limitExpr,0) <> hold(limit) 
   then
      limitExpr;
   else
      body      := op(limitExpr,1);
      bounds    := op(limitExpr,2);
      direction := op(limitExpr,3);
      if (op(bounds,0) <> hold(_equal)) then internalError("Limit result in bad form."); end_if;
      var := op(bounds,1);
      val := op(bounds,2);
      limop := case direction
               of hold(Right) do hold(op_limitright); break; 
               of hold(Left)  do hold(op_limitleft);  break; 
               otherwise         hold(op_limit);      break;
               end_case;
      limop(makeProc([var],body),val);
   end_if;
 end_proc:
*/

mcutils::quoteSymbolName := proc(symname)
 begin
   stringlib::subs(symname, "`"="``");
 end_proc:

mcutils::symbolName := proc(sym)
 local str, n;
 begin
   str := expr2text(sym);
   if str[1] = "`" then
      n := length(str);
      stringlib::subs(str[2..n-1],"``"="`");
   else
      str
   end_if;
 end_proc:

mcutils::makeSymbol := proc(symname)
 begin
   text2expr("`".quoteSymbolName(symname)."`");
 end_proc:

mcutils::simplifyName := proc(thing)
 local slotsym;
 begin
   if testtype(thing,"slot") then
      slotsym := makeSymbol(extop(thing,2));
      if (eval(slotsym) = eval(thing)) then
         thing := slotsym;
      end_if;
   end_if;
   thing;
 end_proc:

mcutils::procBody := proc(f)
 begin
   if f::dom = DOM_FUNC_ENV then
      return(procBody(op(f,1)));
   else
      functionBody(f);
   end_if;
 end_proc:

mcutils::procVars := proc(f)
   // Returns the bindings as a DOM_SET, not a DOM_LIST!  Order not guaranteed.
 begin
   if f::dom = DOM_FUNC_ENV then
      return(procVars(op(f,1)));
   else
      {functionArgs(f)};
   end_if;
 end_proc:

mcutils::procName := proc(fn, default=FAIL)
 begin
   if isProc(fn) then
      extop(fn,6);
   elif default = SELF then
      fn;
   else
      default;
   end_if;
 end_proc:

mcutils::mangledProcNamePrefix := "_procedure_":
mcutils::mangledProcNamePrefixSize := length(mcutils::mangledProcNamePrefix):

mcutils::mangleSystemNames := {hold(heaviside),hold(igamma),hold(gamma)}:

mcutils::mangledProcName := proc(fn)
 local pname, res;
 option remember;
 begin
   if fn::dom = DOM_FUNC_ENV then
      return(mangledProcName(op(fn,1)));
   end_if;
   // print("mangling fn=",fn);
   pname := procName(fn,SELF);
   // print("pname=",domtype(pname),pname);
   if (testtype(pname,DOM_IDENT)) then
      // print("is DOM_IDENT. checking exceptions");
      if not (pname in mangleSystemNames) then
         // print("mangling bypass on primitive name");
         // All Mathcad function names should have slot ids, so primitive names are
         // words like data, ex, etc. that are pushed onto anonymous procedures
         // in an unwanted way.  They are really anonymous procedures that should not
         // be "fixed". -kmp 11-Aug-2006
         return(fn);
      else
         // print("exception- bypass skipped");
      end_if;
   end_if;
   // print("mangled pname=",pname);
   pname := simplifyName(pname);
   // print("simplified mangled pname=",pname);
   if (testtype(pname,DOM_IDENT)) then
      // print("case: ident");
      res := makeSymbol(mangledProcNamePrefix.symbolName(pname));
   else
      // print("case: NON-ident");
      res := pname;
   end_if;
   // print("mangled result=",res);
   res;
 end_proc:

mcutils::unmangledProcName := proc(sym)
 local symname, n;
 option remember;
 begin
   if isSymbol(sym) then
      symname := symbolName(sym);
      n := length(symname);
      if n > mangledProcNamePrefixSize then
         // print("part1=", symname[1..mangledProcNamePrefixSize]);
         if symname[1..mangledProcNamePrefixSize] = mangledProcNamePrefix then
            return(makeSymbol(symname[mangledProcNamePrefixSize+1..n]));
         end_if;
      end_if;
   end_if;
   sym;
 end_proc:

mcutils::mangledProcName("heaviside"):=mcutils::mangledProcNamePrefix."heaviside":
mcutils::mangledProcName("igamma"):=mcutils::mangledProcNamePrefix."mcad_gamma":
mcutils::mangledProcName("gamma"):=mcutils::mangledProcNamePrefix."mcad_gamma":

mcutils::unfixupProcs := proc(expression)
 begin
   misc::maprec(expression, {DOM_IDENT}=(x->unmangledProcName(x)), Unsimplified);
 end_proc:

mcutils::fixupProcs := proc(expression)
 begin
   misc::maprec(expression, {DOM_PROC,DOM_FUNC_ENV}=(x->mangledProcName(x)), Unsimplified);
 end_proc:

mcutils::theOnlyIndepVar := proc(expression)
 begin
   theOnlyInternal(unknowns(expression),
                   "no independent variable",
                   "more than one independent variable");
 end_proc:

mcutils::theOnly := proc(things, kind)
 begin
   internalError("This function is obsolete.");
 end_proc:

mcutils::theOnlyInternal := proc(things, toofew, toomany)
 local n;
 begin
   n:=nops(things);
   if (n = 1) then
      return(op(things,1));
   elif (n = 0) then
      formatError(toofew);
   else
      formatError(toomany);
   end_if;
 end_proc:


mcutils::checkKeyword := proc(keyword, validKeywords)
   // As far as I can tell, this function is unused? -kmp 9-Apr-2007
 local validKeyword;
 begin
   for validKeyword in op(validKeywords) do
      if (keyword = validKeyword) then
         return(TRUE);
      end_if;
    end_for;
   internalError("Got %1 where one of %2 expected.", keyword, validKeywords);
 end_proc:

mcutils::internalError := proc(message)
 local result, datum;
 begin
   result := message;
   for datum in args(2..args(0)) do
      if (isString(datum)) then
         result := result . "\t" . datum;  // this might sometimes leave out quotes, but mostly should win.
      else
         result := result . "\t" . expr2text(datum);
      end_if;       
   end_for;
   error(result);
 end_proc:

mcutils::formatError := proc(message)
 local result, datum;
 begin
   result := message;
   for datum in args(2..args(0)) do
      if (isString(datum)) then
         result := result . "\t" . datum;  // this might sometimes leave out quotes, but mostly should win.
      else
         result := result . "\t" . expr2text(datum);
      end_if;       
   end_for;
   error(result);
 end_proc:

// If var occurs in expression, return a new variable which
// doesn't, first by trying base, then by repeatedly appending
// suffix to base.
mcutils::protectTransformVar := proc(expression,var,base,suffix)
 begin
   if has(expression,var) then
      var:=base;
      while has(expression,var) do
         var:=var.suffix;
      end_while;
   end_if;
   var;
 end_proc:

mcutils::maybeScalarize := proc(thing)
 begin
   if isMatrix(thing) then
      if     linalg::ncols(thing) = 1
         and linalg::nrows(thing) = 1
      then
         thing[1,1];
      else
         thing;
      end_if;
   else
      thing;
   end_if;
 end_proc:

mcutils::maybeSimplify := proc(expression, force=FALSE)
 begin
   if force or optionMaybeSimplify then
      if (testtype(expression,"function") or testtype(expression,"op_add")) 
      then
         // KLUDGE: Handle our low-tech series results represented as 
         //   a chain of op_add calls.  These must be evaluated to get
         //   rid of them in this case.  For bug # 061101-135654.
         if op(expression,0) = hold(op_add) then
            expression := eval(expression);
         end_if;
      end_if;
      simplify(expression);
   else
      expression;
   end_if;
 end_proc:

// Try to convert expr to a boolean value, returning expr
// if this can't be done.
mcutils::maybeToBool := proc(ex)
 local truth;
 begin
   if ex = NaN or ex = undefined or ex=FAIL then
      formatError(errorNotANumber);
   elif isBool(ex) then
      ex;
   elif isConstant(ex) then 
      return(not iszero(ex));
   elif isConstantExp(ex) then
      truth := is(ex<>0);
      if truth <> UNKNOWN then
         return(truth);
      end_if;
   end_if;
   ex;
 end_proc:

mcutils::checkSolveVar := proc(var)
 begin
   // print("Checking solve var",var);
   if isMatrix(var) then
      // ignore this case.  we're only looking for toplevel problems with this check
   elif (op(var,0) in hold({ _equal,  op_eq})) then
      formatError(errorStraySolveEquality);
   elif (op(var,0) in hold({_unequal, op_neq,
                          _less,    op_lt,
                          _leequal, op_leq,
                                    op_gt,
                                    op_geq})) then
      formatError(errorStraySolveInequality);
   end_if;
   // print("Solve var checked out.");
 end_proc:

mcutils::maybeTransposeSolveBlockResult := proc(result)
 local clauses;
 begin

   // print("maybeTransposeBlockSolveResult entered with",domtype(result),type(result),result);

   // For some historical reason, symbolic solve blocks are expected
   // to return their results in a format which is the transpose 
   // of that returned by the 'solve' keyword.
   if type(result) = Dom::Matrix() then
      // print("maybeTransposeBlockSolveResult CASE: Matrix");
      result:=linalg::transpose(result);
   elif testtype(result,piecewise) then
      // print("maybeTransposeBlockSolveResult CASE: Piecewise");
      result:=map(result,maybeTransposeSolveBlockResult);
   elif op(result,0) = hold(piecewise) then // not really a piecewise, but passes for one
      // print("maybeTransposeBlockSolveResult CASE: Fake Piecewise");      
      result := hold(piecewise)(map(op(result),x->[op(x,1),maybeTransposeSolveBlockResult(op(x,2))]));
   else
      // print("maybeTransposeBlockSolveResult CASE: Normal");
      result;
   end_if;

   // print("maybeTransposeBlockSolveResult returning",result);

   result;

 end_proc:

mcutils::consolidatePiecewiseResults := proc(e)
 local clauses, clause, pred_label, pred, action, else_action, actions, i, t, res;
 begin
   // This function was written to address Bug # 070108-171838 and Bug # 060613-225339
   // reporting duplicated piecewise clauses.  It's possible this needs to recurse 
   // into e, but I don't have a worked case of that for now. -kmp
   // print("enter consolidatePiecewiseResults",e);
   else_action := NONE;
   res :=
   if isPiecewise(e) then
      actions := _exprseq();
      i := 0;
      t := table();
      for clause in [op(e)] do
         pred   := op(clause,1);
         action := op(clause,2);
         if pred = hold(Otherwise) then
            // If this action is the same as another already seen,
            // it will get screened out in the next loop.
            else_action := action;
         elif contains(t,action) then
            t[action] := _or(t[action],pred);
         else
            actions := actions,action;
            t[action]:=pred;
         end_if;
      end_for;
      actions := [actions];
      // print("actions"=actions);
      clauses := _exprseq();
      for action in actions do
         if action <> else_action then
            // An else action might have duplicated another action.
            // Move that action to the end.
            clauses := clauses,[simplify(toLogical(t[action],NATIVE)),action];
         end_if;
      end_for;
      if else_action <> NONE then
         clauses := clauses,[Otherwise,else_action];
      end_if;
      // print("clauses"=[clauses]);
      hold(piecewise)(clauses);
   else
      e;
   end_if;
   // print("leave consolidatePiecewiseResults",res);
   res;
 end_proc:

// Take a result from MuPad's 'solve' function and put it
// in the form Mathcad wants to see.  
mcutils::processSolveResults := proc(results, reduce=TRUE)
 local temp;
 begin
   results := applySolveConstraints(results);
   temp := reduceSolveResults(reformatSolveResults(results), reduce);
   if optionConsolidateSolvePiecewiseResults then
      // Fix Bug # 070108-171838 and Bug # 060613-225339
      temp := consolidatePiecewiseResults(temp);
   end_if;
   if (temp = emptySetMarker) 
   then
      // print("processSolveResults about to fail");
      formatError(errorNoSolveSolution); 
   else
      // print("processSolveResults returning",temp);
      temp;
   end_if;
 end_proc:    

mcutils::reformatSolveResults := proc(results)
 local result;
 begin
   // Some results come back tagged:
   //    [a,b,c] in {...}
   // so we need to just remove that tagging...
   if (op(results,0) = hold(_in)) then
      results := op(results,2);
   end_if;
   result := 
   reconstitutePieces(if (hastype(results,piecewise) or 
                          has(results,hold(piecewise))) then
                          map([op(results)], 
                               x->flattenSolveResultsPiece(x[1],x[2]))
                      else
                          [flattenSolveResultsPiece(TRUE, results)];
                      end_if);
   // print("reformatSolveResults returning",result);
   result;
 end_proc:

mcutils::solveConditions  := FALSE:
mcutils::solveDefinitions := _exprseq();

mcutils::applySolveConstraints := proc(e)
 begin
   if optionApplySolveConstraints then
      misc::maprec(e, {"_intersect"}=applyOneSolveConstraint);
   else
      e;
   end_if;
 end_proc:

mcutils::applyOneSolveConstraint := proc(e)
 local set1, set2, temp, lo, hi, iexp, ivars, iconstraint, ivar, iivar, res, iexp_matrix, s, c;
 begin
   if not testtype(e,"_intersect") then return(e); end_if;
   if nops(e) <> 2 then return(e); end_if;
   // print("foo: 1");
   set1 := op(e,1);
   set2 := op(e,2);
   // print("foo: 2");
   if testtype(set1,solvelib::cartesianPower) then
      temp := set2;
      set2 := set1;
      set1 := temp;
   end_if;
   // print("foo: 3");
   if testtype(set1,"_union") then
      // print("CLAUSE: _union",set1,set2);
      // print(map(op(set1),x->domtype(x)));
      return(map(set1,x->applyOneSolveConstraint(_intersect(x,set2))));
   elif testtype(set1,solvelib::VectorImageSet) then
      // This is a very specialized and punts if it sees anything out of a very refined pattern,
      // but it hits some cases that are still useful to optimize
      // print("CLAUSE: ImageSet");
      // print(domtype(set1),type(set1),"set1"=set1,domtype(set2),type(set2),"set2"=set2);
      // print("set1",op(set1));
      // print("set2",op(set2));
      if not testtype(set2,solvelib::cartesianPower) then return(e); end_if;
      // print("foo: 4",op(set2,1));
      if not op(set2,2)=1 then return(e); end_if;
      set2 := op(set2,1);
      // print("foo: 5");
      if not testtype(set2,Dom::Interval) then return(e); end_if;
      lo := op(set2,1);
      hi := op(set2,2);
      // print("foo: 6");
      iexp_matrix := op(set1,1);
      ivars       := op(set1,2);
      iconstraint := op(set1,3);
      if listLength(ivars)>1 then 
         // Too complicated, give up
         return(e); 
      end_if;
      ivar := ivars[1];
      res := _exprseq();
      if not isMatrix(iexp_matrix) then return(e); end_if;
      // print("iexp_matrix"=iexp_matrix);
      for iexp in iexp_matrix do
         // print("looping iexp=",iexp);
         temp := _exprseq();
         if lo<> -infinity then
            temp := temp,iexp>lo;
         end_if;
         if hi<> infinity then
            temp := temp,iexp<hi;
         end_if;
         temp := [temp],[ivar];
         // print("solve trying",temp);
         temp := solve(temp);
         // print("solve res",temp);
         if temp=FAIL then 
            // print("failing");
            return(e);
         end_if;
         // print("result checked");
         if testtype(temp,"_in") then
            s := op(temp,1);
            c := op(temp,2);
            if isMatrix(s) then
               if testtype(c,solvelib::cartesianPower) then
                  if op(c,2)=1 then
                     // print("constraint",op(c,1));
                     // print("building",iexp,ivars,"intersecting:",iconstraint,op(c,1));
                     temp := solvelib::VectorImageSet(ivar,[ivar],op(c,1));
                     // print("res value ",temp);
                     res := res,temp;
                  else
                     // print("cartesian power not 1 after solve", temp);
                     return(e);
                  end_if;
               else
                  // print("no cartesian power after solve", domtype(c),type(c),"c"=c, "temp"=temp);               
                  return(e);
               end_if;
            else
               // print("lhs not matrix",temp);
               return(e);
            end_if;
         else
            // print("not equation",temp);
            return(e);
         end_if;
      end_for;
      iivar := genTempVar(optionSolveTempVarNamePrefix.".".ivar);
      // print("iivar=",iivar);
      temp := subs(iexp_matrix,[ivar=iivar]),[iivar],[_intersect(iconstraint[1],res)];
      // print("temp=",temp);
      res := solvelib::cartesianPower(solvelib::VectorImageSet(temp),1);
      // print("ok return",res);
      return(res);
   else
      // print("CLAUSE: other",domtype(set1),type(set1),set1,op(set1));
      // print("foo: 8");      
   end_if;
   // print("foo: 9 (punting)",e);
   return(e);
 end_proc:

mcutils::solveOrdering := proc(x,y)
 begin
   if Simplify::complexity(x) < Simplify::complexity(y) then
      TRUE;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::flattenSolveResultsPiece := proc(conditions, results)
 save solveConditions, solveDefinitions;
 local c, temp, d;
 begin
   solveConditions  := TRUE;
   solveDefinitions := _exprseq();
   // Sorting these makes sure that if there are duplicates later, 
   // when it's a matrix instead of a set, they can be recognized by an equality check.
   // Matrices think they are equal only if the order is the same.
   // See Bug # 060613-225339.
   // Fixed anew to address the lack of choice of sort predicate.
   // See Bug # 070418-112322.
   temp := matrix(sort(flattenSolveResults(results),solveOrdering));
   // print("Going to _and(...) on:",[conditions],[solveConditions]);
   c := _and(conditions,solveConditions);
   // print("Got",c);
   solveDefinitions := [solveDefinitions];
   if nops(solveDefinitions) > 1 then
      for d in solveDefinitions do
         temp := hold(evalAt)(temp,d);
      end_for;
   end_if;
   temp := [c, temp];
   // print("flattenSolveResultsPiece returning",temp);
   temp;
 end_proc:

mcutils::reconstitutePieces := proc(pieces)
 local result, npieces, clauses;
 begin
   // print("reconstitutePieces",pieces);
   npieces := listLength(pieces);
   if (npieces = 1) and (listFirst(pieces)[1] = TRUE) then
      result := listFirst(pieces)[2];
   else
      clauses := op(pieces);
      if npieces = 1 then
         clauses := clauses, [Otherwise, undefined];
      end_if;
      result := hold(piecewise)(clauses);
   end_if;
   // print("reconstitutePieces returning",result);
   result;
 end_proc:

mcutils::reduceSolveResults := proc(results, reduce=TRUE)
 // If the reduce argument is false, this is just an identity operation.
 local reduced;
 begin
   if (testtype(results,piecewise) or (op(results,0)=hold(piecewise))) then
      results := hold(piecewise)(op(map([op(results)],
                                  x->[x[1], reduceSolveResults(x[2], reduce)])));
      // print("reduceSolveResults returning",results);
      results;
   else

      if reduce then
         // print("reduceSolveResults reducing",results);
         // We don't like returning 1x1 matrices, so a special case 
         // is needed when there's just one solution...
         reduced :=
         case nops(results)
         of 0 do   emptySetMarker;
            break;
         of 1 do   if optionRaw
                   then results;
                   else op(results,1);
                   end_if;
            break;
         otherwise results;       
            break;
         end_case;
         // print("reduceSolveResults returning",reduced);
         reduced;
      else
         // print("reduceSolveResults not reducing",results);
         results;
      end_if;

   end_if:
 end_proc:

mcutils::flattenSolveUnionMinimal := proc(results, vars, vals)
 local temp;
 begin
   // print("enter flattenSolveUnionMinimal","optionSolveTryNumeric"=optionSolveTryNumeric);
   temp := solvelib::getElement(solvelib::Union(results,vars,vals));
   if temp = FAIL then
      [];
   else
      flattenSolveResults({temp});
   end_if;
 end_proc:

mcutils::flattenSolveUnion := proc(results, vars, vals)
 local res, e, v, s, v0, i, var, nvar, val, varsubs;
 begin
   // print("enter flattenSolveUnion",results,vars,vals,"optionSolveTryNumeric"=optionSolveTryNumeric);
   if not isList(vars) then
      // print("vars not list",vars);
      return(flattenSolveUnionMinimal(results,vars,vals));
   elif testtype(vals,"_union") then
      vals := [op(vals)];
      // print("_union seen",results,vars,vals);
      results :=
        hold(_union)(op(map(vals,(v->hold(solvelib::Union)(results,vars,v)))));
      // print("retrying",results);
      return(flattenSolveResults(results));
   elif testtype(vals,solvelib::VectorImageSet) then
//      print("foo", type(vals),vals,
//           "flattening would have been",
//      simplifyVectorImageSolution(Dom::ImageSet::expr(vals),
//                                  Dom::ImageSet::variables(vals),
//                                  Dom::ImageSet::sets(vals))
//      );
      // For now just do the minimal thing.  More debugging replied for more elaborate unpacking.
      return(flattenSolveUnionMinimal(results,vars,vals));
   elif not testtype(vals,Dom::ImageSet) 
        // Not yet debugged...
        // and not testtype(vals,solvelib::VectorImageSet) 
   then
      // print("vals not Dom::ImageSet",type(vals),vals);
      return(flattenSolveUnionMinimal(results,vars,vals));
   end_if;
   // print("vars and vals ok");
   e := Dom::ImageSet::expr(vals);
   v := Dom::ImageSet::variables(vals);
   s := Dom::ImageSet::sets(vals);
   if not isMatrix(e) then
      // print("expected imageset expr to be a matrix");
      return(flattenSolveUnionMinimal(results,vars,vals));  // should be more general, but...
   end_if;
   // print("imageset expr ok");
   if isSymbol(v) then v := [v]; end_if;   // accept sym as shorthand for [sym]
   if nops(v)<>1 then 
      // print("nops(v)"=nops(v),v);
      return(flattenSolveUnionMinimal(results,vars,vals)); 
   end_if;  // even though we only handle one sym for now...
   v := op(v,1); // get that first sym
   temp := simplifySetToDeclarations(_UNION_VAR_,op(s,1));
   // print("simplified imageset s to decls d","s"=s,"decls"=temp);
   if op(temp,1) = FALSE then
      return(flattenSolveUnionMinimal(results,vars,vals));
   end_if;
   v0 := genTempVar(optionSolveTempVarName);
   solveConditions := solveConditions,subs(temp[2],_UNION_VAR_=v0);
   e := subs(e, v=v0);
   if nops(vars) <> nops(e) then
      return(flattenSolveUnionMinimal(results,vars,vals)); 
   end_if;
   // print("old solveDefinitions",solveDefinitions);
   varsubs := _exprseq();
   for i from 1 to nops(vars) do
      nvar := genTempVar(optionSubstitutionVarName);
      var  := op(vars,i);
      val  := op(e,i);
      varsubs := varsubs,var=nvar;
      solveDefinitions := solveDefinitions,nvar=val;
   end_for;
   res := results;
   varsubs := [varsubs];
   // print("going to sub","res"=res,"varsubs"=varsubs);
   res := subs(res,varsubs,Unsimplified);
   // print("after sub",res);
   // print("new solveDefinitions",solveDefinitions);
   res := flattenSolveResults(res);
   // print("flattenSolveUnion returning",res);
   res; 
 end_proc:

mcutils::flattenSolveResults := proc(results)
 local oper, elems, expr, exprs, power, newstuff, temp, answer, result, i, predsets, simple, p, pp, x,
   list1, list2, xn, x0, x1, x2;
 begin
   oper := op(results,0);
   // print("enter flattenSolveResults",results,"type(results)"=type(results),"oper"=oper);
   answer:=
   if isScalar(results) then
      // print("CLAUSE = scalar",results);
      temp := [[results]];
      //print("CLAUSE scalar returning",temp);
      temp;
   elif testtype(results,"Union") then
      x0 := op(results,1);
      x1 := op(results,2);
      x2 := op(results,3);
      if isSymbol(x1) then x1 := [x1]; end_if;
      flattenSolveUnion(x0, x1, x2);
   elif (testtype(results,Dom::Multiset)) then
      // print("CLAUSE = Multiset",results,"contents=",[op(results)]);
      elems := _exprseq();
      for result in results do
          //print("Multiset flattening",result);
         temp:=flattenSolveResults(op(result,1));
          //print("Multiset newstuff domtype=",domtype(temp),"thing=",temp);
          //print("Multiset newstuff[1] domtype=",domtype(temp[1]),"thing=",temp[1]);
          //print("elements:",listElements(temp));
         for i from 1 to op(result,2) do
            elems := elems,listElements(temp);
         end_for;
      end_for;
      results := [elems];
      // print("Multiset clause returning",expr2text(results));
      results;
   elif (testtype(results,solvelib::BasicSet)) then
      // print("CLAUSE = BasicSet");
      temp := FAIL;
      if optionSolveEliminatesConstants then
        temp := solvelib::getElement(results);
      end_if;
      if temp = FAIL then
         var := genTempVar(optionSolveTempVarName);
         // print("Generated temporary name for basic set:",var);
         temp := freeze(_in)(var,results);
         // print("Adding",temp,"to solveConditions");
         solveConditions := solveConditions,temp;
         temp := [[var]]; //interim hack
      else
         temp := [[temp]];
      end_if;
      temp;
   elif (testtype(results,"_intersect")) then
      // print("CLAUSE = Intersection");
      simple := _exprseq();
      predsets  := _exprseq();
      for temp in op(results) do 
         if testtype(temp,solvelib::BasicSet) or
            testtype(temp,Dom::Interval)
         then
            predsets := predsets, temp;
         elif (testtype(temp,DOM_SET)) then
            simple := simple, temp;
//
// Something to experimentally enable at some point,
// but it requires more support later in this clause before this will work,
// since multisets look different than sets internally, and since mapping
// across them is different. kmp 22-May-2006
//
         elif (testtype(temp,Dom::Multiset)) then
            simple := simple, temp;
         elif optionSolveTryNumeric and (testtype(temp,"RootOf")) then
            temp := forceRootOf(temp);
            if isList(temp) then
               simple := simple,toSet(temp);
            else
               // print("Numeric solve got nonlist. Aborting");
               return([]);               
            end_if;
         else
            // print("Aborting due to unknown set type for intersect:", domtype(temp),temp);
            return([]);
         end_if;
      end_for;
      // print("simple:",simple);
      // print("predsets:",predsets);
      if nops(simple) = 0 then
          return([]); // too complicated
      elif nops(simple)>1 then
          simple := setElementsAsList(_intersect(simple));
      end_if;
      predsets := [predsets];
      // print("Filtering simple:",simple,"against:",predsets);
      for p in predsets do
         pp := _exprseq();
         for x in simple do
            x0 := x;
            xn := 1;
            if isList(x0) then // multisets contain [elem,multiplicities] as elements, not just elem.
               xn := x0[2];
               x0 := x0[1];
            end_if;
            // This should work for multisets, too.
            // print("testing",x,"in",p);
            temp := is(x0 in p);
            // print(" got",temp);
            if temp = UNKNOWN then 
               // print("Filtering got an UNKNOWN. Aborting.");
               return([]);
            elif temp = TRUE then
               pp := pp,x0$xn;
            end_if;
         end_for;
         // Here simple gets itself filtered by one of the predicates.
         // As we iterate across all predicates, simple is filtered by all of them.
         simple := [pp];
      end_for;
      // print("Final simple:",simple);
      simple := map(simple,x->[x]);
      // print("Listified:",simple);
      // print("CLAUSE _intersect EXITING",simple);      
      simple;
   elif (testtype(results,"_minus")) then
      // print("CLAUSE = Minus");
      list1 := flattenSolveResults(op(results,1));
      list2 := flattenSolveResults(op(results,2));
      temp := _exprseq();
      for x in list1 do
         if not containsSolution(x,list2) then
            // include this only if not in set being subtracted
            temp := temp,x;
         end_if;
      end_for;
      [temp];
   elif (testtype(results,"_union")) then //oper = hold(_union)
      // print("CLAUSE = _union",results);
      // NOTE: THIS CLAUSE MUST PRECEDE THE VectorImageSet CLAUSE and the DOM_SET clause
      //
      // Flatten _union(solutions1,solutions2,...)
      // into solution1a,solution1b,...,solution2a,solution2a,...
      elems := _exprseq();
      for result in (op(results)) do
         // print("union flattening",result);
         temp:=flattenSolveResults(result);
         // print("union newstuff domtype=",domtype(temp),"thing=",temp);
         // print("union newstuff[1] domtype=",domtype(temp[1]),"thing=",temp[1]);
         // print("elements:",listElements(temp));
         elems := elems,listElements(temp);
      end_for;
      results := [elems];
      // print("_union clause returning",expr2text(results));
      results;
   elif (testtype(results,DOM_SET)) then
      // print("CLAUSE = DOM_SET",results);
      // For set of solutions: {[x=3,y=4],[x=7,y=9]}
      // strip the LHS's:      {[3,4],[7,9]}
      // turn to an _exprseq:  [3,4],[7,9]
      temp := toList(results);
      // print("DOM_SET a=",temp);
      temp := map(temp,x->map(scalarList(x),stripLHS));
      // print("DOM_SET b=",temp);
      temp;
   elif (oper = RootOf) then
      // print("CLAUSE = RootOf");
      results := flattenRootOf(results);
      // print("returning ",results);
      results;
   elif (oper = hold(solve)) then
      // print("CLAUSE = hold(solve)",results);
      results := flattenLiteralSolve(results);
      // print("returning ",results);
      results;
   elif (oper = hold(substituteBySet) or
         oper = hold(solvelib::substituteBySet)) then
      // This is effectively a failed call to solve that has returned bad data.
      // See comments by Stefan Wehmeier in email on Bug # 050722-150302.
      // Nothing to be done but ignore what it might have had to offer. Sigh.
      []; // if this was our only chance at a solution, it will signal an error
   elif (oper = solvelib::cartesianPower or
         oper = hold(solvelib::cartesianPower)) then
      // print("CLAUSE = cartesianPower",results);
//      // got something opaque inside of the call to cartesianPower, so flatten it and try again
//      // probably the only thing we have a chance of flattening is an empty set (failure to solve),
//      // but it's worth a shot.  anything else than success will just err when we descend it, so
//      // no error checking required on the result.
      expr  := op(results,1);
      power := op(results,2);
//      // Get result as list of lists like [[n1], [n2], ...].
//      temp := flattenSolveResults(expr);
//      // print("a1"=temp,domtype(temp));
//      // Turn it into a set of vectors like {(n1), (n2), (n3)}
//      temp := solvelib::vectorSetToNumberSet(toSet(temp));
//      // print("b"=temp);
//      // now multiply it out... {matrix([[n1a],[n1b],...]),matrix([[n2a],[n2b],...]),...}
//      temp := solvelib::cartesianPower(temp, power);
//      // print("c"=temp);
//      // And translate from {matrix([[n1a],[n1b],...]),matrix([[n2a],[n2b],...]),...} into [[n1a, n1b, ...], [n2a, n2b,...], ...]
//      temp := toList(map(temp, scalarList));
//      // print("d"=temp);
//      // return result
//      temp;
      if power = 0 then
         temp := [];
      elif power = 1 then
         temp := flattenSolveResults(expr);
      else
         // print("expr$power=",expr$power);
         temp := hold(solvelib::cartesianProduct)(expr$power);
         // print("alt expression to try:",temp);
         temp :=flattenSolveResults(temp);
         // print("cartesianProduct returned to cartesianPower:",temp);  
      end_if;
      // print("cartesianProduct flattened as ",temp);
      temp;
   elif (oper = solvelib::cartesianProduct or
         oper = hold(solvelib::cartesianProduct)) then
      // print("CLAUSE = cartesianProduct",results);
      // got something opaque inside of the call to cartesianPower, so flatten it and try again
      // probably the only thing we have a chance of flattening is an empty set (failure to solve),
      // but it's worth a shot.  anything else than success will just err when we descend it, so
      // no error checking required on the result.
      exprs := op(results);
      // Get result as list of lists like [[n1], [n2], ...].
      temp := map(exprs,flattenSolveResults);
       // print("a2"=temp,domtype(temp));
      // Turn it into a set of vectors like {(n1), (n2), (n3)}
      temp := map(temp,val->solvelib::vectorSetToNumberSet(toSet(val)));
       //print("b"=temp);
      // now multiply it out... {matrix([[n1a],[n1b],...]),matrix([[n2a],[n2b],...]),...}
      temp := solvelib::cartesianProduct(temp);
       //print("c"=temp);
      // And translate from {matrix([[n1a],[n1b],...]),matrix([[n2a],[n2b],...]),...} into [[n1a, n1b, ...], [n2a, n2b,...], ...]
      temp := toList(map(temp, scalarList));
       //print("d"=temp);
      // return result
      temp;
   elif (testtype(results,solvelib::VectorImageSet)) then
      // print("CLAUSE = VectorImageSet",results);
      // For { foo(j,k,...) | j in Z_, k in C_, ... }
      // Simplify this to just foo(j,k,...) with maybe j,k,... replaced by numeric constants
      simplifyVectorImageSolution(Dom::ImageSet::expr(results),
                                  Dom::ImageSet::variables(results),
                                  Dom::ImageSet::sets(results));
   elif isSymbol(results) then
      // Fix Bug # 070430-141748, solving y^2-x^2=0 for y needs to return {[y=x],[y=-x]}.
      // The x in y=x is a symbol, not a DOM_EXPR.
      // print("CLAUSE = symbol");
      [[results]];
   elif testtype(results,DOM_EXPR) then
      // print("CLAUSE = DOM_EXPR");
      [[results]];
   elif testtype(results,Dom::ImageSet) then
      simplifyImageSolution(results);
   else
      temp := simplifySetToDeclarations(_TEMPVAR_,results);
      if temp[1] then
         var := genTempVar(optionSolveTempVarName);
         solveConditions := solveConditions,subs(temp[2],_TEMPVAR_=var);
         [[var]];
      else
         if mathcad_debug = TRUE then
            internalError("Unknown solve result type (%1): %2",domtype(results),expr2text(results));
         else
            formatError(errorNoSolveSolution);
         end_if;
      end_if;
   end_if;
   // print("flattenSolveResults returning",answer);
   map(answer,x0->map(x0,proc (x)
               local result;
               begin
                 // print("flatten maybe simplifying ",domtype(x),x);
                 if isConstantExp(x) 
                 then
                    // print("yes");
                    result := mcSimplify(x)
                 else 
                    // print("no");
                    result := x
                 end_if;
                 // print("using",result);
                 result;
               end_proc));
 end_proc:

mcutils::simplifyImageSolution := proc(results)
 local ok, res, vars, sets, nvars, conds, tvar, i, var, set, temp;
 begin
   // print("Dom::ImageSet",op(results));
   // print("enter simplifyImageSolution; solveConditions=",solveConditions);
   ok := TRUE;
   res  := op(results,1);
   vars := op(results,2);
   sets := op(results,3);
   nvars := nops(vars);
   conds := _exprseq();
   tvar := _TEMP_VAR_;
   for i from 1 to nvars do
      var := vars[i];
      set := sets[i];
      temp := simplifySetToDeclarations(tvar,set);
      if not temp[1] then
         ok := FALSE;
         break;
      end_if;
      conds := conds, temp[2];
   end_for;
   conds := [conds];
   // print("vars=",vars);
   // print("nvars=",nvars);
   // print("conds=",conds);
   // print("res=",res);
   if ok then
      // print(res);
      // not sure why this next step is done, and whether it has side effects. its value was discarded. -kmp
      // temp := map([op(res)],x->reformatSolveResults(x));
      res1 := res;
      for i from 1 to nvars do
         ok := FALSE;
         if optionSolveEliminatesConstants and not optionFully then
            // print("Trying to eliminate constants",conds[i],"op0"=op(conds[i],0));
            if testtype(conds[i],"_in") then
               // print("Condition is an 'in'");
               var := solvelib::getElement(op(conds[i],2));
               if var <> FAIL then
                  // print("Using element:",var);
                  ok := TRUE;
               else
                  // print("Element extraction failed:",op(conds[i],2));
               end_if;
            else
               // print("Condition is NOT an 'in'");
            end_if;
         else
            // print("Not trying to eliminate constants.");
         end_if;
         if not ok then
            // print("No element available. Generating variable.");
            var := genTempVar(optionSolveTempVarName);
            // print("augmenting solveConditions","i"=i,solveConditions);
            // print("var"=var,"tvar"=tvar,"conds[i]"=conds[i]);
            solveConditions := solveConditions,subs(conds[i], tvar=var);
            // print("augmented solveConditions i=",i,solveConditions);
         end_if;
         res1 := subs(res1, vars[i]=var);
      end_for;
   end_if;
   if isVector(res1,COLUMN) then
      // print("res1=",res1);
      // print("leave simplifyImageSolution; solveConditions=",solveConditions);
      res1 := [[op(res1)]];
      // print("res1=",res1);
      res1;
   else
      [];
   end_if;
 end_proc:

mcutils::numeric_rationalize := proc(x) 
 begin
   if testtype(x,mcfloat) then // mcfloats sometimes return a call like this
      numeric::rationalize(x);
   else       // no idea why anyone would ask
      hold(numeric_rationalize)(x);
   end_if:
 end_proc:

mcutils::forceRootOf := proc(results)
 local newstuff, result;
 begin
   case nops(results)
   of 1 do newstuff := hold(numeric::polyroots)(op(results,1)); break;
   of 2 do newstuff := hold(numeric::polyroots)(poly(op(results,1),[op(results,2)])); break;
   otherwise newstuff := FAIL; break;
   end_case;
   // print("Trying",newstuff);
   if traperror(( result := evalFloat(newstuff); ))=0 then
      result;
   else
      FAIL;
   end_if;
 end_proc:

mcutils::flattenRootOf := proc(results)
 begin
   if optionSolveTryNumeric then
      results := forceRootOf(results);
      // print("got",results);
      if isList(results) then
         results := map(results,c->[c]);
         // print("changed it to",results);
         results;
      else // including FAIL or other empty set marker
         // print("discarding it");
         results := [];
      end_if;
   else
      results := [];
   end_if;
   // print("flattenRootOf returning flattened numeric result",results);
   results;
 end_proc:

mcutils::flattenLiteralSolve := proc(results)
 begin
   if optionSolveTryNumeric then
      // print("flattenLiteralSolve forcing numeric solution for",results);
      results := forceNumericSolution(results);
      // print("numeric (",domtype(results),"): ",results);
      if (hastype(results,DOM_SET)) then
         //print("numeric results domtype=",domtype(results),"=",results);
         
         results := toList(results);
         results := map(results,x->if isList(x) then map(x,stripLHS) else [x] end_if);
         
      else
         results := [];
      end_if;
   else
      results := [];      
   end_if;
   // print("flattenLiteralSolve returning flattened numeric result",results);
   results;
 end_proc:

mcutils::getOneNumericSolution := proc(solveExpression)
 local result, first_element;
 begin
   // Get rid of VectorFormat = TRUE option in args because numeric solver doesn't like it
   // print("getOneNumericSolution solveexp=",solveExpression);
   result := forceNumericSolution(solveExpression);
   // print("getOneNumeriCSolution(",result,")");
   if isSet(result) and nops(result)=1 then
      first_element := op(result,1);
      // print("e1=",first_element,"dt=",domtype(first_element),"dt1=",domtype(op(first_element,1)));
      if (isScalar(op(first_element,1))) then
         op(first_element,1);
      elif isMatrix(op(first_element,1)) then
         if     linalg::ncols(op(first_element,1))=1
            and linalg::nrows(op(first_element,1))=1 
         then
            op(first_element,1);
         else
            FAIL;
         end_if;
      else
         FAIL;
      end_if;
   else
      FAIL;
   end_if;
 end_proc:

mcutils::simplifySetToDeclarations := proc(var, set)
 local argset, val, decl, decls, res;
 begin
   if testtype(set, "_intersect") or testtype(set, "_union") or testtype(set, "_minus") then
      decls := _exprseq();
      for argset in op(set) do
         decl := simplifySetToDeclarations(var, argset);
         if decl[1] = FALSE then return([FALSE]); end_if;
         decls := decls, decl[2];
      end_for;
      if testtype(set,"_intersect") then
         [TRUE,_and(decls)];
      elif testtype(set,"_union") then
         [TRUE,_or(decls)];
      elif testtype(set,"_minus") then
         [TRUE,hold(_and)(decls[1],hold(_not)(decls[2]))];
      else // shouldn't reachable
         [FALSE];
      end_if;
   elif set in {Z_,Q_,R_,C_} then
      [TRUE, freeze(_in)(var,set)];
   elif testtype(set, Dom::Interval) then
      // print("interval","var"=var,"set"=set,"elements=",op(set));
      res := [TRUE, decodeInterval(var,set)];
      // print("interval result:",res);
      res;
   elif testtype(set,DOM_SET) then
      decls := _exprseq();
      for val in set do
         decls := decls, hold(_equal)(var,val);
      end_for;
      res := [TRUE, _or(decls)];
   else // return failure if we got here
      [FALSE]; 
   end_if;
 end_proc:

mcutils::decodeInterval := proc(var, set)
 local lo, hi, p1, p2, temp, is_open, res;
 begin
   // print("decodeInterval",var,set);
   lo := op(set,1);
   hi := op(set,2);
   
   temp := lo;
   is_open := TRUE;
   if isList(temp) then
      is_open := FALSE;
      temp := op(temp,1);
   end_if;
   if lo = -infinity then
      p1 := TRUE;
   else
      p1 := if is_open then hold(_less) else hold(_leequal) end_if(temp,var);
   end_if;
   
   temp := hi;
   is_open := TRUE;
   if isList(temp) then
      is_open := FALSE;
      temp := op(temp,1);
   end_if;
   if hi = infinity then
      p2 := TRUE;
   else
      p2 := if is_open then hold(_less) else hold(_leequal) end_if(var,temp);
   end_if;
   
   res :=
   if   p1 = TRUE then p2
   elif p2 = TRUE then p1
   else hold(_and)(p1,p2);
   end_if;
   
   // print("decodeInteval returning",res);

   res;

 end_proc:

mcutils::simplifyVectorImageSolution := proc(result, vars, sets)
   // For { foo(j,k,...) | j in Z_, k in C_, ... }
   // Simplify this to just foo(j,k,...) 
   //   with maybe j,k,... replaced by numeric constants
 local var, set, ok, temp, i, decls;
 begin 
   // print("simplifyVectorImageSolution result=",result,"vars=",vars,"sets=",sets);
   for i from 1 to nops(vars) do
	   var := op(vars,i);
	   set := op(sets,i);

      // print("simplifyVectorImageSolution","var"=var,"set"=set);

      ok  := FALSE;
      if not ok then
         // print("in simplifyVectorImageSolution, heuristic 1");
         if optionFully then
            decls := simplifySetToDeclarations(var, set);
            if decls[1] = TRUE then
               ok := true;
               solveConditions := solveConditions,decls[2];
            end_if;
         end_if;
      end_if;
      // If option to eliminate solve constants is enabled, try some heuristics...
      if not ok then
         // print("in simplifyVectorImageSolution, heuristic 2");
         if (domtype(set)=solvelib::cartesianPower 
             and op(set,2) = 1
             and op(op(set,1),0) = hold(solve)) then
            // print("Trying to get one numeric solution.",expr2text(set));
            temp := getOneNumericSolution(op(set,1)); // pass the whole solve(...) form
            // !!! SHOULD PROBABLY ERROR IF A FAILURE HAPPENS HERE. -kmp
            if (temp <> FAIL) then
               result := subs(result, var=temp);
               ok := TRUE;
            end_if;
         end_if;
      end_if;
      if not ok then
         // print("in simplifyVectorImageSolution, heuristic 3");
         if optionSolveEliminatesConstants then 
            // print("Fallback: Trying to getElement.");
            // Of course, this gives the user no control over the order in which things are
            // tried, but sets are like that, I guess.  The user CAN control that somewhat 
            // by using assumptions to constrain the possible solutions. -kmp 29-Mar-2006
            temp := solvelib::getElement(set);
            // print("Got",temp);
            // According to the documentation, solvelib::getElement can fail if either the set is
            // empty, the solver isn't strong enough, or the answer depends on a case analysis of
            // some parameter.  In those cases, FAIL is supposed to get returned.
            ok := bool(temp <> FAIL);
            if (ok) then
               result := subs(result, var=temp);
            end_if;
         end_if;            
      end_if;
      if (not ok) then
         // print("in simplifyVectorImageSolution, heuristic 4");
         solveConditions := solveConditions,freeze(_in)(var,set);
      end_if;
   end_for;

   toList(linalg::transpose(result));
 end_proc:

mcutils::isSimpleLinear := proc(expression,var) 
 local term, terms, coeff, power, vars;
 begin
   terms := poly2list(expression, [var]);
   if nops(terms) > 2 then
      return(FALSE);
   end_if;
   for term in terms do
      coeff := op(term,1);
      power := op(term,2);
      if numeric::indets(coeff) <> {} then
         return(FALSE);
      end_if;
      if power <> 0 and power <> 1  then
         return(FALSE);
      end_if;
   end_for;
   return(TRUE);
 end_proc:

mcutils::constrainVectorImageSet := proc(vis, constraint)
 local res;
 begin
   // See example in constrainVectorImageSet1.
   // If FAIL is returned from there, we do intersection the clumsy way.
   res := constrainVectorImageSet1(vis, constraint);
   if res = FAIL then
      vis intersect constraint;
   else
      res;
   end_if;
 end_proc:

mcutils::constrainVectorImageSet1 := proc(vis, constraint)
 local is_scalar, e, v, vs, s, ss, lo, hi, lo_closed, hi_closed, soln, bound1, bound2, temp;
 begin
   // This solves only a very specific case of 
   //
   //   constrainVectorImageSet1(
   //      Dom::ImageSet(matrix([[3+5*k]]),[k],[Z_]),
   //      Dom::Interval(-infinity,0))
   //
   // yielding something like (possibly with different internal variables):
   //
   //   Dom::ImageSet(matrix([[5*k + 3]]), 
   //                 k, 
   //                 Z_ intersect Dom::Interval(-infinity, -3/5))
   //
   is_scalar := TRUE;
   if testtype(constraint, solvelib::cartesianPower) then
      if op(constraint,2) <> 1 then return(FAIL); end_if;
      constraint := op(constraint,1);
      is_scalar := FALSE;
   end_if;
   if not testtype(vis,solvelib::VectorImageSet) then
      // print("not solvelib::VectorImageSet",domtype(vis),type(vis),vis);
      return(FAIL);
   end_if;
   if not testtype(constraint,Dom::Interval) then
      // print("not Dom::Interval",constraint);
      return(FAIL);
   end_if;
   e  := op(vis, 1);
   vs := op(vis, 2);
   ss := op(vis, 3);
   // print("constraint"="constraint","parts",op(constraint));
   lo  := op(constraint,1);
   hi  := op(constraint,2);
   lo_closed := FALSE;
   hi_closed := FALSE;
   // print("lo"=lo,"lo_closed"=lo_closed,"hi"=hi,"hi_closed"=hi_closed);
   if domtype(lo)=DOM_LIST then
      lo := op(lo,1);
      lo_closed := TRUE;
   end_if;
   if domtype(hi)=DOM_LIST then
      hi := op(hi,1);
      hi_closed := TRUE;
   end_if;
   // print("lo"=lo,"lo_closed"=lo_closed,"hi"=hi,"hi_closed"=hi_closed);
   if not isScalarExp(lo) or not isScalarExp(hi) then
      // print("not scalar bounds");
      return(FAIL);
   end_if;
   res := op(constraint,3);
   if (nops(vs) <> 1 or nops(ss) <> 1) then
      // print("multiple vars in image set");
      return(FAIL);
   end_if;
   v := op(vs,1);
   s := op(ss,1);
   if not is_scalar then
      if not isMatrix(e) then
         return(FAIL);
      end_if;
      if not nops(e) = 1 then
         return(FAIL);
      end_if;
      e := op(e,1);
   end_if;
   if not isSimpleLinear(e, v) then
      // print("not simple linear", e, v);
      return(FAIL);
   end_if;
   soln := solve([e=BOUND], [v], VectorFormat=TRUE);
   if domtype(soln) <> DOM_SET then
      // print("solve result not simple set");
      return(FAIL);
   end_if;
   if nops(soln) <> 1 then
      // print("solve result wrong number of solutions: ", nops(soln));
      return(FAIL);
   end_if;
   soln := op(soln,1);
   if not isMatrix(soln) then
      // print("solution is not matrix", soln);
      return(FAIL);
   end_if;
   // print("soln"=soln,domtype(soln),type(soln),linalg::nrows(soln),linalg::ncols(soln));
   if linalg::nrows(soln) <> 1 or 
      linalg::ncols(soln) <> 1 then
      // print("wrong number of solutions", linalg::nrows(soln), linalg::ncols(soln), soln);
      return(FAIL);
   end_if;
   soln := soln[1,1];
   // print("soln"=soln);
   // print("BOUND (lo)"=lo);
   // print("BOUND (hi)"=hi);
   bound1 := subs(soln,BOUND=lo);
   bound2 := subs(soln,BOUND=hi);
   // print("bound1"=bound1);
   // print("bound2"=bound2);
   if is(bound1 > bound2)=TRUE then
      temp := bound1;
      bound1 := bound2;
      bound2 := temp;
      temp := lo_closed;
      lo_closed := hi_closed;
      hi_closed := temp;
   end_if;
   bound1 := if lo_closed then [bound1] else bound1 end_if;
   bound2 := if hi_closed then [bound2] else bound2 end_if;
   solvelib::VectorImageSet(matrix([[e]]), [v], [s intersect Dom::Interval(bound1,bound2)]);
 end_proc:

mcutils::stripLHS := proc(equation)
 begin
   if op(equation,0) = hold(_equal) then
      rhs(equation);
   else
      equation;
   end_if
 end_proc:

mcutils::realityCheck := proc(EXPRESSIONS)
 local temp, x, results;
 begin
   results := _exprseq();
   for x in [args()] do  
      temp := realityCheck1(x, NONE);
      if not (temp = FAIL or temp = NONE) then
         results := results, hold(domTypeAssumption)(temp,Type::Real);
      end_if;
   end_for;
   [results];
 end_proc:

mcutils::realityCheck1 := proc(ex, var)
 local subex, rc, result;
 begin
   result := 
   if isScalar(ex) then
      if iszero(Im(ex)) then
         var;
      else
         FAIL;
      end_if;
   elif isSymbol(ex) then
      if isConstant(ex) then
         var;
      elif var = NONE then
         ex;
      else
         FAIL;
      end_if;
   elif type(ex) in {"_plus", "_subtract", "_mult", "_divide"} then
      for subex in ex do
         var := realityCheck1(subex, var);
         if var = FAIL then
            return(FAIL);
         end_if;
      end_for;
      var;
   else
      FAIL;
   end_if;
   result;
 end_proc:

mcutils::allVar := hold(mc_ALL):

mcutils::attachAssumptions := proc(expression, specs)
 local result, defaultAssumption, assumptions, assumption, defaultVars, mentionedVar, spec;
 begin
   // print("attachAssumptions got","expression=",expression,"specs=",specs);
   defaultVars := unknowns(expression);  // vars to which we attach any defaultAssumption
   defaultAssumption:=NONE;              // by default, there's no defaultAssumption to attach
   result := expression;
   // print("starting with",result);
   for spec in specs do
      assumptions := toAssumptions(spec);
      // print("attachAssumptions turned","spec=",spec,"into assumptions=",assumptions);
      for assumption in assumptions do
         if assumptionIsUseful(assumption) then
            // print("assumption valid");

            // Get mentionedVar from an assumption with one of these forms:
            //   var=value
            //   domTypeAssumption(var,typespec)
            // In both cases, the variable is in the same position, so this call to op(expr,1)
            // is adequate to extract it from either form.
            mentionedVar := op(assumption,1);
            if (mentionedVar=allVar) then
               // If the mentioned var is (in whatever localized language) "ALL",
               // save it as the defaultAssumption for variables not explicitly mentioned.
               defaultAssumption := assumption;
               // print("noticing default assumption",assumption);
            else
               // Otherwise, apply the spec only to the explicitly given name...
               defaultVars := defaultVars minus {mentionedVar};
               // AND remove that name from the set of names that need default typing
               // in case a defaultAssumption was given...
               // print("attaching",assumption,"to",result);
               result := hold(_assuming)(result, hold(conjoinedAssumption)(assumption));
               // print("attached:",result);
            end_if;
         else
            // print("useless assumption");
         end_if;
      end_for;
   end_for;
   if (defaultAssumption = NONE) then
      // No default assumption.  Just use the explicit assumptions we were given "as is".
   else
      // print("going to attach allvar to",result);
      // Need to attach the default assumption to those variables not named explicitly...
      result := attachAssumptions(result,map(defaultVars,var->subs(defaultAssumption,allVar=var)));
   end_if;
      // print("attachAssumptions yielding",result);
   result;
 end_proc:

mcutils::rectForm := proc(expression)
 local real_part, imag_part, result, k, neg;
 begin
   // print("rectForm got",expression);
   
   // Using MuPAD's rectform(expression) will give us something of the right shape,
   // but it is not further evaluable in various ways.  We'd rather have a
   // regular old DOM_EXPR, but coercing to that yields FAIL.
   // So we don't implement this, for now, as the obvious:  rectform(expression)
   // Instead, we simulate it...
   // Using simplify(Re(...)) instead of mcad_Re and
   // simplify(Im(...)) instead of mcad_Re and mcad_Im 
   // because mcad_Re and mcad_Im have changed.
   // See bug # 070405-160659 -kmp 05-Apr-2007
   
   real_part := simplify(Re(expression));
   // print("mcad_Re(",expression,")=",real_part);
   imag_part := simplify(Im(expression));
   // print("mcad_Im(",expression,")=",imag_part);
   if ( iszero(imag_part) ) then
      result := real_part;
   else
      neg := FALSE;
      // This will hopefully take care of Bug # 070323-183100, which was producing 
      // keyword_explicit(keyword_rectangular(conjugate(op_add(mc_a,op_mult(mc_b,1*I)))))
      // Returning: mc_a + (-mc_b)*I
      // With this fix, it should return: mc_a - mc_b*I
      if testtype(imag_part,"_mult") then
         for k in imag_part do
            if isScalar(k) then
               if iszero(Im(k)) then
                  if k < 0 then
                     neg := TRUE;
                     break;
                  end_if;
               end_if;
            end_if;
         end_for;
      end_if;
      if neg then
         result := hold(_subtract)(real_part,hold(_mult)(-imag_part,I));
      else
         result := hold(_plus)(real_part,hold(_mult)(imag_part,I));
      end_if;
   end_if;
   // print("rectForm returning",result);
   result;
 end_proc:

mcutils::conjoinedAssumption := proc(assumption)
 begin
   // Use args() not assumption, since arg might be something like (x,Type::Real) which will show up as two args.
   _exprseq(args(), _and);
 end_proc:

mcutils::domTypeAssumption := proc(expression, domain_type)
 begin
   _exprseq(expression, domain_type);
 end_proc:

mcutils::matrixMap := proc(mat, fn)
 begin
   checkMatrix(mat);
   matrix(linalg::nrows(mat),linalg::ncols(mat),
          map([op(mat)],fn));
 end_proc:

// matrixMapper(f) -> mapper
//
// This function turns a function on non-matrix data into a mapper function 
// that recurses into matrices, applying the function on any non-matrix.

mcutils::matrixMapper := proc(fn)
 option escape; // This function allows a closure to escape
 local mapper;
 begin
   // print("Creating ",procname,"(",fn,")");
   mapper := 
   proc(node) // This is the function that escapes,
      // It is closed over both:
      //   fn (the function to ultimately apply)
      //   mapper (the function that it returns, so it can recursively map if needed)
    local extra_args;
    begin
      extra_args := args(2..args(0));
      if (isMatrix(node)) then
	      map(node,c->mapper(c,extra_args));
	   else
	      eval(fn)(node,extra_args);
      end_if;
    end_proc:
   mapper;
 end_proc:

mcutils::vectorMapper := proc(fn)
 option escape; // This function allows a closure to escape
 local mapper;
 begin
   // print("Creating ",procname,"(",fn,")");
   mapper := 
   proc(node) // This is the function that escapes,
      // It is closed over both:
      //   fn (the function to ultimately apply)
      //   mapper (the function that it returns, so it can recursively map if needed)
    local extra_args;
    begin
      extra_args := args(2..args(0));
      if (isVector(node)) then
	      map(node,c->mapper(c,extra_args));
	   else
	      eval(fn)(node,extra_args);
      end_if;
    end_proc:
   mapper;
 end_proc:

mcutils::matrixSpreader := proc(fn)
 option escape; // This function allows a closure to escape
 begin
   // print("Creating ",procname,"(",fn,")");
   proc() // This is the function that escapes.
          // It is closed over fn (the function to apply).
    begin
      eval(fn)(spreadToScalars(args()));
    end_proc:
 end_proc:
   
mcutils::reduceToScalars := proc(reducer)
 local the_args;
 begin
   error("This function should not be called."); // this next line looks wrong.
   the_args := map(args(2..args(0)), item -> if isScalar(item) 
                                             then item;
                                             else reducer(item);
                                             end_if);
 end_proc:

mcutils::spreadToScalars := proc()
 local the_args, item;
 begin
   items := args();
   result := _exprseq();
   for item in items do
      if isMatrix(item) then
         result := result, spreadToScalars(op(item));
      else
         result := result, item;
      end_if;
   end_for;
   result;
 end_proc:

mcutils::truthValue := proc(lhs, muOp, rhs, proxyOp)
 local truth, res;
 begin
   // print("truthValue",lhs,muOp,rhs,proxyOp);
   if proxyOp in {hold(op_eq), hold(op_neq)} then
      truth := allCompareTrue(((x,y)->if isString(x) or isString(y) then
                                         formatError(errorIncomparable); 
                                      elif (proxyOp in {hold(op_eq), hold(op_neq)})
                                         or (iszero(Im(x)) and iszero(Im(y)))
                                         // NOTE: Comparison of strings is presently disabled above,
                                         //       but removing the check above allows this to work,
                                         //       since muOps are capable of comparing reals and strings.
                                         or (isString(x) and isString(y)) 
                                      then
                                         // print("Comparing",x,y);
                                         res := muOp(x,y);
                                         // print("Comparison=>",res);
                                         res;
                                      else
                                         UNKNOWN;
                                      end_if),
                              lhs, rhs);
      // print("truthValue yields",truth);
      if      truth = TRUE  then return(1);
      elif    truth = FALSE then return(0);
      else // truth = UNKNOWN
         proxyOp(lhs,rhs);
      end_if;
   else
      distributeMatrixBinOp(((x,y)->if isString(x) or isString(y) then
                                       formatError(errorIncomparable);
                                    elif (proxyOp in {hold(op_eq), hold(op_neq)})
                                       or (iszero(Im(x)) and iszero(Im(y)))
                                       // NOTE: Comparison of strings is presently disabled above,
                                       //       but removing the check above allows this to work,
                                       //       since muOps are capable of comparing reals and strings.
                                       or (isString(x) and isString(y)) 
                                    then
                                       // print("Comparing",muOp,x,y);
                                       res := is(muOp(x,y));
                                       // print("Comparison=>",res);
                                       if (res = TRUE) then
                                          1;
                                       elif (res = FALSE) then 
                                          0;
                                       else 
                                          proxyOp(x,y);
                                       end_if;
                                    else
                                       res := is(muOp(x,y));
                                       if (res = TRUE) then 
                                          // We agree with MuPAD about what's true.
                                          1;
                                       elif (res = FALSE) and (is(muOp(y,x)) = TRUE) then 
                                          // MuPAD thinks 3*I < 3*I is false because it thinks (non-real) complexes
                                          // are definitely unordered, so try the inverse to be sure it's serious 
                                          // about the reason for the less than.  It's a more expensive test, but
                                          // it will be right.
                                          0;
                                       elif is(x=y)=TRUE then 
                                          if proxyOp in {hold(op_lt), hold(op_gt)} then
                                             // no equal check for these ops, so fail
                                             0;
                                          elif proxyOp in {hold(op_leq), hold(op_geq)} then
                                             // equal check for these, so win
                                             1;
                                          else
                                             // this should never happen, but just in case we change code later badly
                                             proxyOp(x,y);
                                          end_if;
                                       else
                                          // Punt. It couldn't figure it out.
                                          proxyOp(x,y);
                                       end_if;
                                    end_if),
                            lhs, rhs);
   end_if;
 end_proc:

mcutils::normalizeRationalFunctionToPolynomial := proc(expression, var)
 local temp, deg;
 begin
   temp := collect(expression,var);
   deg  := degree(denom(temp),var);
   if (deg > 0) then
      [temp*var^deg, var^deg];
   else
      [temp, 1];
   end_if;
 end_proc:

mcutils::processCollectOptions := proc(indeterminates)
   // If the first of the indeterminates is the world "multiples", 
   // then the command collect,x,y,z becomes collect,multiples,x,y,z
   // allowing any collection spec of the form x^n to refer to 
   // x^n, x^2*n, x^3*n, ..., x^k*n where k*n is the degree of the polynomial.
 begin
   if (indeterminates <> []) and (indeterminates[1] = mc_multiples) then
      // side-effect prevailing environment (see collectCoefficients)
      optionCollectMaxPowerMultiples := optionCollectMaxPowerMultiplesLimit;
      indeterminates[2..nops(indeterminates)];
   else
      // side-effect prevailing environment (see collectCoefficients)
      optionCollectMaxPowerMultiples := 1;
      indeterminates;
   end_if;
 end_proc:

mcutils::collectCoefficients := proc(polynomials, indeterminates)
 // modified by processCollectOptions
 save optionCollectMaxPowerMultiples;
 local result;
 begin
   // print("collectCoefficients","optionCollectMaxPowerMultiples(unprocessed)"=optionCollectMaxPowerMultiples);
   indeterminates := processCollectOptions(indeterminates);
   // print("collectCoefficients","optionCollectMaxPowerMultiples(processed)"=optionCollectMaxPowerMultiples);
   indeterminates := fixupProcs(indeterminates);
   polynomials    := fixupProcs(polynomials);
   // print("collectCoefficients",polynomials,indeterminates);
   result :=
   if (isMatrix(polynomials)) then
      map(polynomials, elem->collectCoefficients(elem, indeterminates));
   else
      collectCoefficientsScalar(polynomials, indeterminates);
   end_if;
   // print("collectCoefficients yielding",result);
   result := unfixupProcs(result);
   // print("collectCoefficients yielding(fixed)",result);
   result;
 end_proc:

mcutils::collectCoefficientsScalar := proc(polynomial, indeterminates)
 local nvars, var1, more_vars;
 begin
   nvars := nops(indeterminates);
   if (nvars = 0) then
      indeterminates := [ theOnlyIndepVar(unknowns(polynomial)) ];
      nvars := nops(indeterminates);
   end_if;
   if nvars = 0 then
      polynomial;
   else
      var       :=  op(indeterminates,1);
      more_vars := [op(indeterminates,2..nvars)];
      collectCoefficient(polynomial,var,more_vars);      
   end_if;
 end_proc:

mcutils::collectCoefficient := proc(polynomial, var, more_vars)
 local tempvar, res, usingE;
 begin
   // print("enter collectCoefficient",polynomial,var,more_vars);
   if var = E or var=hold(E) or var = hold(exp(1)) or var = hold(mc_exp) then
      var := hold(E);
   end_if;
   if isSymbol(var) then
      // print("var is sym",var);
      usingE := FALSE;
      if var = hold(E) then
         usingE := TRUE;
         // Not needed; the default of hold(E) is fine.
         //  var := hold(mc_e);
         // print("using E",var);
         // print("using E in(before)",polynomial);
         polynomial := toE(polynomial,var);
         // print("using E in(after)",polynomial);
      end_if;
      if nops(more_vars) = 0 then
         // print("collecting(simple)",polynomial,var);
         res := collect(polynomial,var);
      else
         // print("collecting(complicated)",polynomial,var);
         res := collect(polynomial,var,c->collectCoefficientsScalar(c,more_vars));
      end_if;
      if usingE then
         // print("fixing up E(before)",expr2text(res));
         res := fromE(res,var);
         // print("fixed up E(after)",expr2text(res));
      else
         // print("not fixing up E",res);
      end_if;
      res;
   else
      collectComplicatedCoefficient(polynomial, var, more_vars);
   end_if;
 end_proc:

mcutils::getPowerMultiplesSubstitutions := proc(polynomial, expression, tempvar)
 local pow, bas, deg, substitutions, hi, n;
 begin
   // print("getPowerMultiplesSubstitutions","polynomial"=polynomial,"expression"=expression,"op(expression,0)"=op(expression,0),"optionCollectMaxPowerMultiples"=optionCollectMaxPowerMultiples);
   substitutions := _exprseq();
   if (op(expression,0) = hold(_power)) then
      pow := op(expression,2);
      if (isScalar(pow) and pow > 0) then
	      bas := op(expression,1);
	      deg := estimateDegree(polynomial,bas);
         // print("getPowerMultiplesSubstitutions","bas"=bas,"pow"=pow,"deg"=deg);
	      if (deg > 0) then
            hi := floor(deg/pow);
            // print("hi"=hi);
            // print("optionCollectMaxPowerMultiples"=optionCollectMaxPowerMultiples);
	         for n from 1 to min(hi, optionCollectMaxPowerMultiples) do
               // print("substitutions (before)",substitutions);
		         substitutions := substitutions, bas^(n*pow) = tempvar^n;
               // print("substitutions (after)",substitutions);
	         end_for;
         else 
            // print("skipping, deg not > 0");
         end_if;
      else
         // print("skipping","pow"=pow);
      end_if;
   end_if;
   substitutions:=[substitutions];
   // print("returning",substitutions);
   substitutions;
 end_proc:

mcutils::collectComplicatedCoefficient := proc(polynomial, expression, more_vars)
 local substitutions, tempvar, mappings;
 begin
   // print("collectComplicatedCoefficient",polynomial,expression,more_vars);
   // This tempvar variable has to be a new name each time to avoid
   // collisions on recursion since we can't clean up on this until after
   // we do the recursion.  [See Bug # 070124-092739.]
   tempvar := genTempVar("_COLLECT_TEMP_");
   mappings := getPowerMultiplesSubstitutions(polynomial, expression, tempvar);
   // print("collectComplicatedCoefficient","mappings"=mappings);
   polynomial := mcSubs(polynomial, mappings);
   // print("collectComplicatedCoefficient","polynomial(mapped)"=polynomial);
   polynomial := mcSubs(polynomial, [expression = tempvar]);
   // print("collectComplicatedCoefficient","polynomial(aliased)"=polynomial);
   if more_vars = [] then
      polynomial := collect(polynomial, tempvar);
      polynomial := mcSubs(polynomial, [tempvar = expression]);
   else
      polynomial := collect(polynomial,
                            tempvar,
                            // No longer mcSubs(c,[tempvar=expression])
                            // here since it's done later.
                            // See Bug # 070124-092739.
                            c->collectCoefficientsScalar(c,more_vars));
   end_if;
   // print("collectComplicatedCoefficient returning(almost)",polynomial);
   // Do this substitution last over entire result rather than distributed
   // over just coefficients.  [See Bug # 070124-092739.]
   polynomial := mcSubs(polynomial,[tempvar=expression]);
   // print("collectComplicatedCoefficient returning(after subst)",polynomial);   
   polynomial;
 end_proc:

mcutils::freezeExp := proc(expression)
 local oper,data;
 begin
   if (domtype(expression)=DOM_EXPR) then
      oper := eval(op(expression,0));
      data := op(expression);
      freeze(oper)(data);
   else
      expression;
   end_if;
 end_proc:

mcutils::parseDivision := proc(expression)
 local n, d, n1, d1, item, res;
 begin
    // print("parseDivision",op(expression,0),[op(expression)]);
    n := _exprseq();
    d := _exprseq();
    if type(expression) = "_divide" then
       // print("parseDivision: division");
       n1 := parseDivision(op(expression,1));
       d1 := parseDivision(op(expression,2));
       for item in n1[1] do
          // print("adding",item,"to numerator");
          n := n, item;
       end_for;
       for item in n1[2] do
          // print("adding",item,"to denominator");
          d := d, item;
       end_for;
       for item in d1[1] do
          // print("adding",item,"to denominator");
          d := d, item;
       end_for;
       for item in d1[2] do
          // print("adding",item,"to numerator");
          n := n, item;
       end_for;
       res := [[n],[d]];
    elif type(expression) = "_invert" then
       // print("parseDivision: invert");
       d1 := parseDivision(op(expression,1));
       res := [d1[2],d1[1]];
    elif type(expression) = "_power" and op(expression,2) = -1 then
       // print("parseDivision: _power(...,-1)");
       d1 := parseDivision(op(expression,1));
       res := [d1[2],d1[1]];
    elif type(expression) = "_mult" then
       // print("parseDivision: product");
       for item in op(expression) do
          n1 := parseDivision(item);
          n := n,op(n1[1]);
          d := d,op(n1[2]);
       end_for;
       res := [[n], [d]];
    elif type(expression) = DOM_RAT then
       // print("parseDivision: rat");
       res := [[op(expression,1)], [op(expression,2)]];
    else
       // print("parseDivision: ",expression);
       res := [[expression], []];
    end_if;
    // print("parseDivision(",expression,") returning",res);
    res;
 end_proc:

mcutils::isUsedBound_result   := FALSE:
mcutils::isUsedBound_variable := NONE:

mcutils::isUsedBound1 := proc(subexpression)
 local var;
 begin
   if /* isFunction(subexpression) then
      if isUsedBound_variable in procVars(subexpression) then
         isUsedBound_result := TRUE;
         misc::breakmap();
      end_if;
   elif */ testtype(subexpression,"diff") then
      print("Looking at ",subexpression,isUsedBound_variable);
      if has([op(subexpression,2..nops(subexpression))],isUsedBound_variable) then
         isUsedBound_result := TRUE;
         misc::breakmap();
      end_if;
   else
      internalError("case not handled in isUseBound1");
   end_if;
   subexpression;
 end_proc:

mcutils::isUsedBound := proc(var, expression)
 save isUsedBound_result, isUsedBound_variable;
 begin
   isUsedBound_result   := FALSE;
   isUsedBound_variable := var;
   misc::maprec(expression,{"diff" /* , DOM_PROC, DOM_FUNC_ENV */}=isUsedBound1);
   isUsedBound_result;
 end_proc:

mcutils::mcSubs := proc(expression, substitutions)
 local termsubs, facsubs, divsubs, othersubs, result,
   substitution, lsub, rsub, ldiv, do_div, do_fac, substSimplify, termrule, divrule, facrule, usingE;
 begin
   usingE := FALSE;
   substSimplify := id;
   // print("mcSubs",expression,substitutions);
   termsubs  := _exprseq();
   facsubs   := _exprseq();
   divsubs   := _exprseq();
   othersubs := _exprseq();
   for substitution in substitutions do
      if not isEquation(substitution) then
         formatError(errorPatternNotEquation, substitution);
      end_if;
      lsub := lhs(substitution);
      ldiv := parseDivision(lsub);
      if nops(ldiv[1])>0 and nops(ldiv[2])>0 then // representation of a division as [[numerfactor,...],[denomfactor,...]]
         divsubs  := divsubs,substitution;
      elif (type(lsub) = "_plus") then
         termsubs := termsubs,substitution;
      elif (type(lsub) = "_mult") then
         facsubs := facsubs,substitution;
      else
         if lsub=hold(E) or lsub=E or lsub=hold(exp(1)) then
            usingE := TRUE;
            othersubs := othersubs,hold(E)=rhs(substitution);
         else
            rsub := rhs(substitution);
            if isSymbol(lsub) and not isSymbol(rsub) then
               // For Bug # 070521-100705, if changing from a symbol to a compound expression,
               // double-check that we aren't turning a "bound variable" into a "bound expression",
               // which would be a syntax error. e.g., diff(g(x,y),x) is fine, but
               // diff(g(f(x),y),f(x)) is not fine, so straight substitution into diff is wrong.
               if isUsedBound(lsub,expression) then
                  formatError(errorInappropriateExpression);
               end_if;
            end_if;
            othersubs := othersubs,substitution;
         end_if;
      end_if;
   end_for;
   termsubs  := [termsubs];
   facsubs   := [facsubs];
   divsubs   := [divsubs];
   othersubs := [othersubs];
   // print("mcSubs","termsubs"=termsubs,"facsubs"=facsubs,"divsubs"=divsubs,"othersubs"=othersubs);
   do_div := 
   proc(result, ldiv=COMPUTED)
    local divsub, pat_parsed;
    begin
      // This handles "generalized division".  That is, any cascade of _mult,_invert,_power(...,-1),_divide() and DOM_RAT
      // that are connected directly to one another.  e.g., _mult(3,_divide(a,b)) is really all one 3*a/b division.

      // print("_divide clause being checked","ldiv"=ldiv);
      if ldiv = COMPUTED then
         // print("ldiv=COMPUTED.  parsing",result);
         ldiv := parseDivision(result);
      end_if;
      // print("ldiv"=ldiv);
      for divsub in divsubs do
         pat_parsed := parseDivision(lhs(divsub));
         // print("considering pat_parsed=",pat_parsed, "against ldiv=",ldiv);
         if (containsOps(pat_parsed[1], ldiv[1]) and
             containsOps(pat_parsed[2], ldiv[2])) then
            
            // print("_divide clause won",result, "replacing",divsub);
            
            result := substSimplify(result/lhs(divsub)*rhs(divsub));
            ldiv := parseDivision(result);
            break;
         end_if;
      end_for;
      result;
    end_proc;
   do_fac :=
   proc(result)
    begin
      for facsub in facsubs do
         if containsOps(lhs(facsub), result) then
            result := substSimplify(result/lhs(facsub)*rhs(facsub));
            break;
         end_if;
      end_for;
      result;
    end_proc;
   if nops(termsubs)>0 then
      termrule := {"_plus"}=
                            proc(subexpression)
                             local result, termsub;
                             begin
                               result := subexpression;
                               for termsub in termsubs do
                                  if containsOps(lhs(termsub), subexpression) then
                                     result := substSimplify(subexpression-lhs(termsub)+rhs(termsub));
                                     break;
                                  end_if;
                               end_for;
                               result;
                             end_proc;
   else
      termrule := _exprseq();
   end_if;
   if nops(divsubs)>0 then
      divrule := {"_divide"}=
                   proc(subexpression) 
                    begin
                      // print("_divide. subexp=",subexpression);
                      do_div(subexpression);
                    end_proc;
      facrule := {"_mult"}=
                   proc(subexpression)
                    local result, facsub, ldiv;
                    begin
                      result := subexpression;
                      ldiv := parseDivision(subexpression);
                      if nops(ldiv[2])>0 then
                         // This is a division masquerading as a multiplication.
                         do_div(result,ldiv);
                      else
                         do_fac(result);
                      end_if;
                    end_proc;
   elif nops(facsubs)>0 then
      divrule := _exprseq();
      facrule := {"_mult"}=do_fac;
   else
      divrule := _exprseq();
      facrule := _exprseq();
   end_if;
   if usingE then 
      // print("using E(before toE)",expr2text(expression));
      expression := toE(expression);
      // print("using E(after toE)",expr2text(expression));
   else
      // print("not using E");
   end_if;
   // print("termsubs=",termsubs,"divsubs=",divsubs,"facsubs=",facsubs);
   result := misc::maprec(expression, 
                          termrule,
                          facrule,
                          divrule,
                          constantly(TRUE)=
                            proc(subexpression)
                             local result, othersub, temp, old;
                             begin
                               if (type(subexpression)=Series::Puiseux) then
                                  // print("series detected, x=v is ",op(subexpression,6));
                                  result := lhs(op(subexpression,6));
                               else
                                  result := subexpression;
                               end_if;
                               old := result;
                    //  print("subexp=",domtype(subexpression),subexpression,[extop(subexpression)]);
                               for othersub in othersubs do
                                  if old = lhs(othersub) then
                                     result := rhs(othersub);
                                     break;
                                  end_if;
                               end_for;
                               if (type(subexpression)=Series::Puiseux) then
                                  if (result = old) then
                                     // print("No change");
                                     subexpression;
                                  elif (isSymbol(result)) then
                                     temp := subsop(subexpression, 
                                                    6=(result=rhs(op(subexpression,6))), 
                                                    Unsimplified);
                                     // print("Changing subexpression",subexpression,"to",temp);
                                     temp;
                                  else
                                     // print("coercing",subexpression);
                                     subexpression := coerce(subexpression,DOM_EXPR);
                                     // print("substituting",subexpression,[old=result]);
                                     subs(subexpression,[old=result]);
                                  end_if;
                               else
                                  result;
                               end_if;
                             end_proc, Unsimplified);
   // print("mcSubs returning", result);
   if usingE then
      // print("using E(before fromE)",expr2text(result));
      result := fromE(result); 
      // print("using E(before fromE)",expr2text(result));
   end_if;
   result;
 end_proc:
                                                                                                      
mcutils::piecewiseCaller := NONE:

mcutils::adjustPiecewises := proc(x, caller = NONE)
 local res;
 begin
   // print("adjustPiecewises called",x,"caller"=caller);
   res :=
   if hastype(x,piecewise) then
      // e.g., for Bug # 061101-175004
      // Here we notice a piecewise coming out of a derivative or an integral or sum or product.
      // It's quite important to do the simplify here rather than later because in the case of
      // a definite integral, we infer additional ephemeral information like that the bounds of
      // the integral are real numbers.  That info is very valuable for the simplifier and will
      // go away after this form is executed, so try hard to use it while we can to avoid returning
      // a piecewise that carries info we don't need to carry.
      mcSimplify(adjustPiecewisesRecursively(mcSimplify(x),caller));
   else
      x;
   end_if;
   // print("adjustPiecewises returning",res);
   res;
 end_proc:

mcutils::adjustPiecewisesRecursively := proc(x, caller=NONE)
 local res;
 save piecewiseCaller;
 begin
   // e.g., for Bug # 061101-175004
   // This caller stuff allows us to rewrite noun forms as "undefined".
   piecewiseCaller := caller;
   // print("piecewiseCaller=",piecewiseCaller);
   // print("adjustPiecewisesRecursively checking",type(x),x);
   res := misc::maprec(x, {hold(piecewise),piecewise,"function"}=adjustPiecewise, Unsimplified);
   // print("adjustPiecewisesRecursively returning",type(x),x);
   res;
 end_proc:

mcutils::checkPiecewisesRecursively := proc(x)
 local res;
 begin
   // print("checkPiecewisesRecursively checking",x);
   res := misc::maprec(x, {hold(piecewise),piecewise,"function"}=checkPiecewise, Unsimplified);
   // print("checkPiecewisesRecursively returning",x);
   res;
 end_proc:

mcutils::checkPiecewiseImageSets := proc(pw)
 local temp, i, clause, guardian, guarded;
 begin
   for i from 1 to nops(pw) do
      clause := op(pw,i);
      guardian := op(clause,1);
      guarded  := op(clause,2);
      // print("checking",clause);
      if hastype(guardian,Dom::ImageSet) then
         // print("trying clause",guardian, guarded);
         // print("checkPiecewiseImageSets",i,"(old)=",op(pw,i));
         pw:=subsop(pw, i=checkPiecewiseClauseImageSets(guardian, guarded));
         // print("checkPiecewiseImageSets",i,"(new)=",op(pw,i));
      end_if;
   end_for:
   pw;
 end_proc:

mcutils::processPiecewiseImageSet_subs := FAIL;

mcutils::checkPiecewiseClauseImageSets := proc(guardian, guarded)
 save processPiecewiseImageSet_subs;
 begin
   // print("enter checkPiecewiseClauseImageSets",e);
   processPiecewiseImageSet_subs := _exprseq():
   guardian := processPiecewiseImageSets(guardian);
   [guardian, subs(guarded, [processPiecewiseImageSet_subs])];
 end_proc:

mcutils::processPiecewiseImageSets := proc(e)
 begin
   // print("enter processPiecewiseImageSets",e);
   misc::maprec(e,{"_in",                                 // transform these
                   hold(piecewise),piecewise,"function"   // stop these and don't go deeper
                  }=processPiecewiseImageSetsTriage,
                Unsimplified);
 end_proc:

mcutils::processPiecewiseImageSetsTriage := proc(candidate)
 local res, tempvar;
 begin
   // print("enter processPiecewiseImageSetsTriage",type(candidate),candidate);
   if testtype(candidate,"_in") then
      tempvar := _IMAGESET_TEMP_;
      res := subs(processPiecewiseImageSetsData(tempvar,op(candidate,2)), tempvar=op(candidate,1));
      if res = FAIL then
         candidate;
      else
         res;
      end_if;
   elif testtype(candidate,"function") then
      if op(candidate,0) = hold(piecewise) then
         candidate;
      else
         processPiecewiseImageSets(candidate);
      end_if;
   else
      // We also stop at piecewises and try not to descend them
      candidate;
   end_if;
 end_proc:

mcutils::processPiecewiseImageSetsData := proc(var, set)
 local tests, s, test, res;
 begin
   // print("processPiecewiseImageSetsData entered var=",var,"set=",set);
   res :=
   if testtype(set, Dom::ImageSet) then
      processPiecewiseImageSet(var, set);
   elif testtype(set, "_union") 
      or testtype(set, "_intersect") 
      or testtype(set, "_minus") then
      // This part is the same for all of those types
      tests := _exprseq();
      for s in [op(set)] do
         test := processPiecewiseImageSetsData(var, s0);
         if test = FAIL then 
            return(FAIL); 
         end_if;
         tests := tests, test;
      end_for;
      // This part diverges for each type
      if testtype(set, "_union") then
         hold(_or)(tests);
      elif testtype(set, "_intersect") then
         hold(_and)(tests);
      elif testtype(set, "_minus") then
         _and(op(tests,1), map(op(tests,2..nops(tests)), x->hold(_not)(x)));
      else
         FAIL;
      end_if;
   else
      FAIL;
   end_if;
   // print("processPiecewiseImageSetsData yielding",res);
   res;
 end_proc:

mcutils::solveImageSet := proc(e,v)
 local temp, res;
 begin
   temp := solve(e,v);
   res := FAIL;
   if testtype(temp,DOM_SET) then
      if nops(temp)=1 then
         res := op(temp,1);
      end_if;
   end_if;
   res;
 end_proc:

mcutils::processPiecewiseImageSet := proc(setvar, imageset)
 local vars, var, set, e, eqn, sets, nvars, tests, temp;
 begin
   // print("processPiecewiseImageSet");
   e     := op(imageset,1);
   vars  := op(imageset,2);
   sets  := op(imageset,3);
   nvars := nops(vars);
   eqn   := (e=setvar);
   // print("setvar=",setvar,"e=",e,"vars=",vars,"sets=",sets);
   tests := _exprseq();
   for i from 1 to nvars do
      var   := vars[i];
      set   := sets[i];
      temp  := solveImageSet(eqn,var);
      if temp = FAIL then return(FAIL); end_if;
      tests := tests, freeze(_in)(temp, set);
   end_for;
   if nvars = 1 then
      tests;
   else
      hold(_and)(tests);
   end_if;
 end_proc:


/* 

mcutils::processPiecewiseImageSet := proc(setvar, imageset)
 local vars, var0, var, set, e, sets, nvars, tests;
 begin
   // print("processPiecewiseImageSet");
   e     := op(imageset,1);
   vars  := op(imageset,2);
   sets  := op(imageset,3);
   nvars := nops(vars);
   // print("setvar=",setvar,"e=",e,"vars=",vars,"sets=",sets);
   tests := _exprseq();
   for i from 1 to nvars do
      var   := vars[i];
      var0  := genTempVar(optionSolveTempVarName);
      set   := sets[i];
      tests := tests, freeze(_in)(var0, set);
      e     := subs(e, var=var0);
   end_for;
   // print(" subs(old)=",processPiecewiseImageSet_subs);
   processPiecewiseImageSet_subs := processPiecewiseImageSet_subs, setvar=subs(e,var=var0);
   // print(" subs(new)=",processPiecewiseImageSet_subs);
   if nvars = 1 then
      tests;
   else
      hold(_and)(tests);
   end_if;
 end_proc:

*/

mcutils::checkPiecewise := proc(pw, recursively=TRUE, extra_cases=[])
 local pw1, good_cases, n_good_cases, middle_cases, temp;
 begin
   if op(pw,0) = hold(piecewise) or testtype(pw,piecewise) then
      restored_cases := _exprseq();
      middle_cases   := _exprseq();
      good_cases   := _exprseq();
      n_good_cases := 0;
      pw := checkPiecewiseImageSets(pw);
      for pw1 in pw do 
         // Make sure this isn't just a bunch of undefined and/or FAIL in a row
         // print("checking undefined",pw1,"caller=",piecewiseCaller);
         if (op(pw1,2) in {undefined, FAIL, piecewiseCaller}) then
            // Turn a noun-form of the integral into "undefined". e.g., see Bug # 061101-175004
            if optionFully then
               // Only accumulate "undefined" cases in the fully case.  They're not very helpful.
               middle_cases := middle_cases,[op(pw1,1),hold(undefined)];
            end_if;
         else
            middle_cases := middle_cases,pw1;
            good_cases := good_cases,pw1;
            n_good_cases := n_good_cases+1; // return whole thing if even one clause is non-failure
         end_if;
      end_for;
      if not optionFully then
         for pw1 in extra_cases do 
            // Make sure this isn't just a bunch of undefined and/or FAIL in a row
            // print("checking undefined",pw1,"caller=",piecewiseCaller);
            if not (op(pw1,2) in {undefined, FAIL, piecewiseCaller}) then
               restored_cases := restored_cases,pw1;
            end_if;
         end_for;
      end_if;
      if n_good_cases=0 then
         // if we got here, it was because they were all bad
         // print("checkPiecewise all-undefined/FAIL");
         //
         // We could return undefined here, but in a case where an undefined was the only option to start with,
         // that's probably the result of a programmatically generated piecewise.  
         // (Users should write just 'undefined' not piecewise([x>3,undefined],[Otherwise,undefined]).)
         // In this case, we'll signal an error even though we don't do so for other cases.
         // ALSO, this will keep us from returning "undefined" where we really meant "FAIL".
         // See bug # 060717-122104 for ltos more details.
         formatError(errorSymbolic);
      elif not optionFully then
         // Fix bug # 060731-131141 which wants an unqualified solution in the non-fully case.
         if n_good_cases = 1 and isMostlyTrue(op(good_cases,1)) then
            // If there's only one case, then good_cases holds just one case: [test, value].
            op(good_cases,2); // return value
         else
            // If there are 0 or many cases, they are a sequence [test1,value1],[test2,value2],...
            // Make sure to repatriate any filtered cases at this point
            hold(piecewise)(good_cases, restored_cases);
         end_if;
      else
         // print("checkPiecewise returning (success):",pw);
         hold(piecewise)(middle_cases);
      end_if;
   elif recursively then
      map(pw,checkPiecewisesRecursively);
   else
      pw;
   end_if;
 end_proc:

mcutils::isMostlyTrue := proc(ex)
   // Based loosely on the mathematical notion of "true mostly everywhere",
   // this predicate implements a conservative notion of the idea that 
   // if something is true over a dense space, users won't have too hard a 
   // time guessing a value that satisfies it, so they don't need their hand
   // held with predicates that are mostly true when they haven't 
   // asked for a "fully" result.  Whenever this function is "nervous", it
   // should be made to return FALSE.
 local u, t, ok, res;
 begin
   res :=
   if domtype(ex) <> DOM_EXPR then
      FALSE;
   elif op(ex,0) in {hold(_and), hold(and_), hold(op_and)} then
      allTrue(ex,isMostlyTrue);
   elif op(ex,0) in {hold(_not), hold(not_), hold(op_not)} then
      not isMostlyTrue(op(ex,1));
   elif op(ex,0) in {hold(_unequal), hold(op_neq),
                     hold(_less), hold(op_lt),
                     hold(_great), hold(op_gt),
                     hold(_leequal), hold(op_leq),
                     hold(_geequal), hold(op_gt)} then
      // For Bug # 070420-124700, if an underscore (generated) variable is involved,
      // don't treat it as mostly true. Otherwise, these expressions could be removed
      // from piecewise statements without users ever seeing them.  Probably this
      // is an abuse of modularity, since isMostlyTrue is a bad name for a function
      // making this assumption, but so be it.  We'll clean that up another time.
      // -kmp 28-Apr-2007
      res := TRUE;
      for u in unknowns(ex) do
         t := expr2text(u);
         if length(t) > 6 then
            if t[1..7] = "mc__5F_" then
               res := FALSE;
               break;
            end_if;
         end_if;
      end_for;
      res;
   elif op(ex,0) in {hold(_in), hold(op_element_of)} then
      // For Bug # 070420-124700 -- see comment above.
      t := expr2text(op(ex,1));
      ok := TRUE;
      if length(t) > 6 then
         if t[1..7] = "mc__5F_" then
            ok := FALSE;
         end_if;
      end_if;
      if ok then
         isMostlyFreeOfExceptions(op(ex,2));
      else
         FALSE;
      end_if;
   else
      FALSE;
   end_if;
   // print("isMostlyTrue",ex,"returns",res);
   res;
 end_proc:

mcutils::isMostlyFreeOfExceptions := proc(ex)
 begin
   if ex = R_ or ex = C_ then 
      TRUE;
   elif ex = Q_ or ex = Z_ then
      FALSE;

   elif testtype(ex,DOM_SET) then
      FALSE;
   elif domtype(ex) = DOM_EXPR then
      if op(ex,0) = hold(_minus) then
         // Note that C_ minus R_ will return FALSE here
         bool(     isMostlyFreeOfExceptions(op(ex,1)) and
               not isMostlyFreeOfExceptions(op(ex,2)) );
      else // let's be highly conservative
         FALSE;
      end_if;
   else
      FALSE;
   end_if;
 end_proc:

mcutils::adjustPiecewiseCheckInfinity := TRUE:

mcutils::adjustPiecewise := proc(pw)
 local guardian, consequent, new_guardian, new_consequent, clauses, res, res1, clause, filtered;
 save adjustPiecewiseCheckInfinity;
 begin
   filtered := _exprseq();
   // print("adjustPiecewise pw"=pw,"op(pw,0)"=op(pw,0));
   if isPiecewise(pw) then //testtype(pw,piecewise) or op(pw,0) = hold(piecewise) 
      // print("is piecewise");
      if adjustPiecewiseCheckInfinity then // avoid infinite recursion if not simplified out
         adjustPiecewiseCheckInfinity:=FALSE;
         // print("checking infinity");
         for clause in pw do
            // print("checking",clause);
            consequent := op(clause,2);
            if (consequent <> infinity) and
               (consequent <> -infinity) and
               has(consequent,infinity) then
               // print("simplifying:",pw);
               pw := Simplify(pw);
               // print("simplified, to be retried:",pw);
               return(adjustPiecewise(pw));
            end_if;
         end_for;
      end_if;
      // print("adjustPiecewise checking",pw);
      clauses := _exprseq();
      for clause in pw do
         // print("adjustPiecewise checking clause",clause);
         guardian   := op(clause,1);
         consequent := op(clause,2);
         // print("adjustPiecewise recursively adjusting",consequent);
         new_consequent := adjustPiecewisesRecursively(consequent);
         new_guardian := if guardian = hold(Otherwise) then guardian else simplifyBoolean(guardian); end_if;
         // print("new_guardian=",new_guardian);
         if new_guardian = TRUE then
            // print("adjustPiecewise (simplified) returning",new_consequent,"due to",guardian);
            return(new_consequent);
         elif new_guardian = FALSE then
            // print("not adjusting clauses");
         else
            if (not optionFully) and testtype(new_guardian,DOM_EXPR) then
               // Watch for checks against a singleton and remove them in a non-fully case.
               // e.g., see bug # 061101-175004 where we were getting a situation of infinity 
               // for a y=0 case that just distracts from the main branch in an integral result.
               if (op(new_guardian,0) in {hold(op_eq), hold(_equal)}) and
                  (isScalar(op(new_guardian,1)) or isScalar(op(new_guardian,2))) 
               then
                  filtered := filtered,[new_guardian, new_consequent];
               else
                  clauses := clauses,[new_guardian, new_consequent];
               end_if;
            else
               clauses := clauses,[new_guardian, new_consequent];
            end_if;
            // print("adjusted clauses to",clauses);
         end_if;
      end_for;
      // This may remove [Otherwise,undefined] because piecewise thinks that's redundant.
      // but we'll put it back when displaying from Mathcad if we need to.
      res := eval(hold(piecewise)(clauses)); // hold(piecewise)(clauses); //
   else
      res := map(pw,adjustPiecewisesRecursively);
   end_if;
   // print("adjustPiecewise calling checkPiecewise on",res);
   checkPiecewise(res, FALSE, [filtered]);
 end_proc:

mcutils::simplifyBoolean := proc(x)
 local truth;
 begin
   // print("simplifyBoolean",x);
   if testtype(x, "_and") then
      _and(map(op(x),simplifyBoolean));
   elif testtype(x, "_or")  then
      _or(map(op(x),simplifyBoolean));
   elif testtype(x, "_not") then
      _not(simplifyBoolean(op(x,1)));
   elif testtype(x, "_xor") then
      _xor(map(op(x),simplifyBoolean));
   else
      truth := is(eval(x));
      // print("simplifyBoolean atomic","truth"=truth);
      if truth=UNKNOWN then
         x;
      else
         truth;
      end_if;
   end_if;
 end_proc:

mcutils::containsSolution := proc(soln, solns)
 local i, s, ns, v, good;
 begin
   ns := nops(soln);
   for s in solns do
      if nops(s) = ns then
         good := TRUE;
         for i from 1 to ns do
            if is(s[i] = soln[i])<>TRUE then
               good := FALSE;
               break;
            end_if;
         end_for;
         if good then
            return(TRUE); 
         end_if;
      end_if;
   end_for;
   return(FALSE);
 end_proc:

mcutils::containsOps := proc(sub_sum_exp, super_sum_exp)
 local result, term;
 begin
    // print("containsOps",sub_sum_exp,super_sum_exp);
   result := TRUE;
   for term in op(sub_sum_exp) do
      if optionSumContainsNamedConstants and isNamedConstant(term) then
         // accept constants
      elif optionSumContainsScalars and isScalar(term) then
         // accept scalars
      elif not (term in {op(super_sum_exp)}) then
         result := FALSE;
         break;
      end_if;
   end_for;
    // print("containsOps returning",result);
   result;
 end_proc:

mcutils::estimatedDegreeResult := 0:
mcutils::estimateDegree := proc(expression, base)
 save estimatedDegreeResult;  
 local result;
 begin
   // print("estimateDegree",expression,base);
   estimatedDegreeResult := 0;
   misc::maprec(expression,
               {"_power"} = (proc(ex) 
                             begin
                               if isScalar(op(ex,2)) then
                                  estimatedDegreeResult := max(op(ex,2)*estimateDegree(op(ex,1), base), estimatedDegreeResult);
                                  ex;
                               else
                                  estimatedDegreeResult := max(estimateDegree(op(ex,1), base), estimatedDegreeResult);
                                  ex;
                               end_if;
                             end_proc),
               {Series::Puiseux} = (proc(ex)
                                     begin
                                       estimatedDegreeResult := max(estimateDegree(coerce(ex,DOM_EXPR),base), estimatedDegreeResult);
                                       ex;
                                     end_proc),
               constantly(TRUE) = (proc(ex)
                                    begin 
                                       if (ex = base) then
                                          estimatedDegreeResult := max(estimatedDegreeResult,1); 
                                          ex;
                                       else
                                          ex;
                                       end_if 
                                    end_proc),
              Unsimplified);
   // print("estimateDegree returning",estimatedDegreeResult);
   estimatedDegreeResult;
 end_proc:

// Mixed arith

mcutils::mixedExpressionFromRational := proc(expression)
 begin
   // print("entering mixedExpressionFromRational", expression);
   if isMatrix(expression) then
      map(expression, mixedExpressionFromRational);
   else
      mixedNumberFromRational(expression);      
   end_if;
 end_proc:

mcutils::mixedExpressionToRational := proc(expression)
 local temp;
 begin
   // print("entering mixedExpressionToRational", expression);
   if isMatrix(expression) then
      temp := map(expression, mixedExpressionToRational);
   else
      // need to catch things like -1 * op_mixednum(...)
      // and allow them to coalesce to a single rational.
      temp := misc::maprec(expression,{mcfloat}=id,{"op_mixednum"}=mixedNumberToRational);//"function"
   end_if;
   // print("mixedExpressionToRational",expression,"returns",temp);
   temp;
 end_proc:

mcutils::negInvolved := proc(x)  // heuristic, for use in mixedInvolved
 local res;
 begin
   // print("negInvolved entered with",x);
   if isConstant(x) then 
      res:=is(x<0);
      //print("is x<0 returned",res);
      res:=bool(res=TRUE);
   else 
      //print("x is NOT arithmetical");
      res:=FALSE
   end_if;
   //print("negInvolved returns",res);
   res;
 end_proc:

mcutils::mixedInvolved := proc(expression)
 local temp, x;
 begin
   // print("entering mixedInvolved", expression);
   if isMatrix(expression) then
      temp := FALSE;
      for x in op(expression) do
         if mixedInvolved(x) then temp := TRUE; break; end_if;
      end_for;
   elif op(expression,0) = hold(op_negate) or
        op(expression,0) = hold(_negate)   or
        ( op(expression,0) = hold(_mult) and 
          anyTrue([op(expression)],negInvolved) )
   then // check to see if there's a leading mixnum in a minus or * expression.
      temp := mixedInvolved(op(expression,1));
   elif op(expression,0) = hold(op_mixednum) then
      temp := TRUE;
   else
      temp := FALSE;
   end_if;
   temp;
 end_proc:

mcutils::mixedMath := proc(fn)
 local fnargs, ret;
 begin
   // print("entering mixedmath");
   fnargs := args(2..args(0));
   if anyTrue([fnargs],mixedInvolved) then
      ret := mixedExpressionFromRational(fn(map(fnargs,mixedExpressionToRational)));
   else
      ret := fn(fnargs);
   end_if;
   // print("leaving mixedmath");
   ret;
 end_proc:

mcutils::mixedNumberFromRational := proc(n)
 local num, denom;
 begin
   // print("entering mixedNumberFromRational",n);
   if isRational(n) and not isInteger(n) then
      if n < 0 then
         -mixedNumberFromRational(-n);
      elif optionSuppressZeroMixedNum and n < 1 then
         n;
      else
         num   := op(n,1):
         denom := op(n,2):
         hold(op_mixednum)(iquo(num,denom), irem(num,denom), denom);
      end_if;
   else
      n;
   end_if;
 end_proc:

mcutils::mixedNumberToRational := proc(expression)
 begin
   // print("entering mixedNumberToRational",n);
   if // (op(expression,0)=hold(op_mixednum)) then
      testtype(expression,"op_mixednum") then
      mixedNumberPartsToRational(op(expression));
   else
      expression;
   end_if;
 end_proc:

mcutils::mixedNumberPartsToRational := proc(a,b,c)
 local temp;
 begin
   // print("entering mixedNumberPartsToRational",n);
   if c = 0 then 
      formatError(errorDivideByZero);
   end_if;
   if a < 0 then
		a-b/c;
	else
      a+b/c;
   end_if;
 end_proc:

// ====================


mcutils::toCombineTarget := proc(target)
 begin
   if   (target = hold(mc_atan)     /* or target = mc_atan */ ) then
      arctan;
   elif (target = hold(mc_exp)      /* or target = mc_exp  */  or
         // the tokens E and its value are possible and distinct
         target = hold(E)           or target = E       ) then
      exp;
   elif (target = hold(mc_log)      /* or target = mc_log */  ) then
      log;
   elif (target = hold(mc_ln)       /* or target = mc_ln */   ) then
      ln;
   elif (target = hold(mc_sincos))  then
      sincos;
   elif (target = hold(mc_sinhcosh))  then
      sinhcosh;
   else
      formatError(errorBadCombineTarget, target);
   end_if;
 end_proc:

mcutils::mcRewrite := proc(e, key)
 begin
   if key = log then
      misc::maprec(misc::maprec(e,{"ln"}=(x->log(10,op(x,1))*ln(10))),
                   {"ln"}=(x->hold(log)(E,op(x,1))));
   else
      rewrite(e,key);
   end_if;
 end_proc:

mcutils::toRewriteTarget := proc(target)
 begin
      // Factorials
   if   (target = hold(mc_fact)   /* or target = mc_fact */  ) then
      fact;

      //  (Note: _hex_6D635FCE93 is the mangled form of capital gamma).
   // elif (target = hold(_hex_6D635FCE93) or target = _hex_6D635FCE93 )
      elif (    target = hold(mcvar_Gamma) /* or target = mcvar_Gamma */ 
             or target = hold(mc_gamma)
            ) then
      gamma;
      
      // Exponentials
   elif (target = hold(mc_ln)     /* or target = mc_ln */    ) then
      ln;
   elif (target = hold(mc_log)    /* or target = mc_log */   ) then
      log;
   elif (target = hold(mc_exp)    /* or target = mc_exp */    or
   // the tokens E and its value are possible and distinct
         target = hold(E)         or target = E              )   then
      exp;
      
      // Trig
   elif (target = hold(mc_sin)    /* or target = mc_sin */   ) then
      sin;
   elif (target = hold(mc_cos)    /* or target = mc_cos */   ) then
      cos;
   elif (target = hold(mc_tan)    /* or target = mc_tan */   ) then
      tan;
   elif (target = hold(mc_cot)    /* or target = mc_cot */   ) then
      cot;
      
   elif (target = hold(mc_sincos))   then
      sincos;
      
      // Inverse Trig
   elif (target = hold(mc_asin) /* or target = mc_asin */  ) then
      arcsin;
   elif (target = hold(mc_acos) /* or target = mc_acos */  ) then
      arccos;
   elif (target = hold(mc_atan) /* or target = mc_atan */  ) then
      arctan;
   elif (target = hold(mc_acot) /* or target = mc_acot */  ) then
      arccot;
      
      // Hyperbolics
   elif (target = hold(mc_sinh)   /* or target = mc_sinh */  ) then
      sinh;
   elif (target = hold(mc_cosh)   /* or target = mc_cosh */  ) then
      cosh;
   elif (target = hold(mc_tanh)   /* or target = mc_tanh */  ) then
      tanh;
   elif (target = hold(mc_coth)   /* or target = mc_coth */  ) then
      coth;
      
   elif (target = hold(mc_sinhcosh)) then
      sinhcosh;
      
      // Misc
   elif (target = hold(mc_signum) /* or target = mc_signum */) then
      sign;
   elif (/* target = hold(heaviside) or target = heaviside     or  */
         target = hold(mc_heaviside) /* target = mc_heaviside */ )    then
      heaviside;
   elif (target = hold(mc_andor))   then
      andor;
      
   else
      formatError(errorBadRewriteTarget, target);
   end_if;  
 end_proc:

// ====================

mcutils::defaultArgument := proc(given, default)
 begin
   if given = Null then
      default;
   else
      given;
   end_if;
 end_proc:

mcutils::setEqual := proc(set1,set2)
 begin
   set1 := toSet(set1);
   set2 := toSet(set2);
   bool(nops(set1 minus set2)=0 and
        nops(set2 minus set1)=0);
 end_proc:

mcutils::sameRoots := proc (x,y)
 local xx,yy;
 begin
   // print("entered sameRoots",x,y);
   // View matrix as a set of lists (each list is a row).
   // Make sure all of those row sets occur, in any order.
   // setEqual(toList(x), toList(y));
   xx := sort(map(toList(x),mcexpr2text));
   yy := sort(map(toList(y),mcexpr2text));
   //print("sameRoots comparing");
   //print("xx"=xx);
   //print("yy"=yy);
   looksTheSame(xx,yy); // bool(xx=yy);
 end_proc:

mcutils::validateMatrix := proc(m)
 begin
   if linalg::nrows(m) = 0 or
      linalg::ncols(m) = 0 then
      error(errorInvalidMatrixSize);
   else
      m;
   end_if;
 end_proc:

// test case: keyword_fourier(op_add(op_negate(heaviside(op_sub(op_negate(mc_t),mcvar_omega))),heaviside(op_sub(op_negate(mc_t),mcvar_omega))),mc_t,mcvar_omega);

mcutils::transformFilterNonZeroVar := proc(oper_name, expression, from_var, to_var, filter_var)
 local action, posres, zres, negres, res;
 begin
   // print("transformFilterNonZeroVar oper_name",oper_name);
   // print("transformFilterNonZeroVar expression",expression);
   // print("transformFilterNonZeroVar from_var",from_var);
   // print("transformFilterNonZeroVar to_var",to_var);
   // print("transformFilterNonZeroVar filter_var",filter_var);
   action := oper_name(expression,from_var,to_var);
   // print("transformFilterNonZeroVar action",action);
   res := eval(action);
   if has(res,hold(dirac)) then
      return(res);
   end_if;
   // print("transformFilterNonZeroVar res",res);
   posres := eval(res) assuming filter_var > 0;
   // print("transformFilterNonZeroVar posres",posres);
   negres := eval(res) assuming filter_var < 0;
   // print("transformFilterNonZeroVar negres",negres);
   if posres = negres then
      // print("same, returning",posres);
      posres;
   elif optionFully then
      // print("fully different, returning piecewise");
      piecewise([filter_var > 0, posres],[filter_var < 0, negres]);
   else
      // print("non-fully different, try again neutrally");
      res;
   end_if;
 end_proc:

mcutils::transformFilterAny := proc(oper_name, expression, from_var, to_var)
 local action;
 begin
   action := oper_name(expression,from_var,to_var);
   eval(action);
 end_proc:

mcutils::transformFilterNonZeroTo := proc(oper_name, expression, from_var, to_var)
 begin
   transformFilterNonZeroVar(oper_name, expression, from_var, to_var, to_var);   
 end_proc:

mcutils::transformFilterNonZeroFrom := proc(oper_name, expression, from_var, to_var)
 begin
   transformFilterNonZeroVar(oper_name, expression, from_var, to_var, from_var);
 end_proc:

mcutils::fixupIntegers := proc(x)
 begin
   misc::maprec(x,isFloating=maybeFixupInteger,Unsimplified);
 end_proc:

mcutils::maybeFixupInteger := proc(floated)
 local fixed;
 begin
   fixed := floor(floated);
   if is(fixed=floated)=TRUE then
      fixed;
   else
      floated;
   end_if;
 end_proc:

mcutils::transformExpression := proc(expression,
                                     oldvar, newvar,
                                     oper_name, kwd_name, inv_oper_name,
                                     tempvar, tempsuffix, nargs, filter=ANY)
 local result, expression1, result1, xnewvar, action, bestc, best, newc;
 begin
   oldvar := fixupProcs(oldvar);
   expression := fixupProcs(expression);
   checkKeywordArgs(kwd_name, nargs, 1, 3);
   // working on 021007-104756
   // ignore given filters for now.  this just isn't going to work.
   // i'll back out of it more gracefully later. -kmp 
   // if filter=ANY or optionRaw then
      filter := transformFilterAny; 
   // end_if;
   if oldvar = newvar then
      formatError(errorTransformVarsIdentical,oldvar,newvar);
   end_if;
   xnewvar := newvar;
   newvar:=protectTransformVar(expression,newvar,tempvar,tempsuffix);
   // print("transformExpression",filter,oper_name,expression,oldvar,newvar,assumptions);
   expression:=fixupIntegers(expression); // Fixes part of the problem in Bug # 070517-150447
   result := maybeSimplify(eval(filter(oper_name,expression,oldvar,newvar)));
   // print("transformExpression got back",result);
   // print("transform result",result);
   if not( has(result,oper_name) or has(result,inv_oper_name) ) then
      return(unfixupProcs(result));
   end_if;
   bestc := Simplify::complexity(result);
   best := result;
   for expression1 in Simplify(expression,All) do
      result1:=maybeSimplify(eval(filter(oper_name,expression1,oldvar,newvar)));
      if not( has(result1,oper_name) or has(result1,inv_oper_name) ) then
         return(unfixupProcs(result1));
      end_if;
      newc := Simplify::complexity(result1);
      if newc < bestc then
         bestc := newc;
         best  := result1;
      end_if;
   end_for;
   if op(best,0) = oper_name or op(best,0) = inv_oper_name then
      formatError(errorSymbolic);
   else
      best;
   end_if;
 end_proc:

// ==================== INTERIM BUG FIXES ====================

// None at this time.

// ==================== EXTENSIONS ====================

// Integral table extensions
// moved to mcrules.mu
//int::addpattern(sin(sqrt(x)),x,2*sin(sqrt(x))-2*cos(sqrt(x))*sqrt(x));
//int::addpattern(cos(sqrt(x)),x,2*cos(sqrt(x))+2*sin(sqrt(x))*sqrt(x));

// Simplifier extensions

Simplify::createValuation: // force autoload

mcutils::mcSimplifyUsingRulesInitialized := FALSE:

mcutils::initializeRuleSimplifier := proc()
 local temp;
 begin

   // This is not initially done because this may not be the default simplifier
   // and so may never be used.

   if not mcSimplifyUsingRulesInitialized then

// Done in regular init now.
//    mcad_csgn := funcenv(mcad_csgn);
//    mcad_csgn::type := "mcad_csgn";
      
      mcOperatorTable := Simplify::defaultOperatorTable;
      
      mcOperatorTable["mcad_csgn"] := X -> 32 + 1.2*Simplify::complexity(op(X,1));
      
      mcOperatorTable["_power"]   := 
      proc(EXPR)
       local temp;
       begin
         if domtype(op(EXPR, 2)) = DOM_INT then
            if op(EXPR, 2) < 0 then
               // fraction
               2.4*Simplify::complexity(1/EXPR)
            else
               // no penalty for base, slight penalty for exponent
               10 + Simplify::complexity(op(EXPR, 1)) +
               2*Simplify::complexity(op(EXPR, 2))
            end_if
         elif domtype(op(EXPR, 2)) = DOM_RAT then
            temp := 10
                    + 2.5*Simplify::complexity(op(EXPR, 1))
                    + 3.5*Simplify::complexity(op(EXPR, 2));
            if testtype(op(EXPR,1),"_power")
               and domtype(op(EXPR, 2)) in {DOM_RAT, DOM_INT}
            then
               temp := 50*temp; // Give mcad_csign a fighting chance
            end_if;
            temp;
         else
            15 + 3*Simplify::complexity(op(EXPR, 1)) +
            4*Simplify::complexity(op(EXPR, 2))
         end_if
       end_proc;
      
      mcValuation := Simplify::createValuation(mcOperatorTable);
      mcValuationFunction := 
      proc(EXPR)
       local res;
       begin
         res := 
         float(Simplify::indetComplexity(EXPR)
               + mcValuation(EXPR)/2
               + Simplify::pairPenalty(EXPR));
         // print("mcValuation of",EXPR,"=",res);
         res;
       end_proc;
      
      mcSimplifyRule_csgn1 := Rule((x^2)^(1/2),  x*mcad_csgn(x));
      
      mcSimplifyUsingRulesInitialized := TRUE;

   end_if;
 end_proc:

mcutils::mcSimplifyRuleSelector := proc(bs, ex, gl, st)
 local res;
 begin
   // print("Enter mcSimplifyRuleSelector, ex=",ex);
   res := if op(ex,0)=hold(_power) then [mcSimplifyRule_csgn1] else [] end_if;
   // print("mcSimplifyRuleSelector returning",res);
   res;
 end_proc:

mcutils::mcSimplifyFast := proc(ex)
 begin
   // Ok, so I lied.  We're not really simplifying at all here.
   // Due to Bug # 060725-114756, I just removed it for now pending finding out 
   // what is necessary here and what's optional.  For now, let people call the simplify 
   // keyword explicitly if they need more simplification.  It's safer that way anyway
   // because it happens once at a known time, not iteratively (and potentially expensively)
   // throughout a potentially long computation.  I'm optimistically hoping that this change
   // to undo the helpful-but-probably-too-painfully-slow thing I had been doing before in 
   // favor of a simple no-op is going to speed up a lot of things. 
   // Any change to this operation to do more should be bounded to O(1) time, 
   // not time proportional to expression size, and also preferrably with a VERY small 
   // constant multiplier... -kmp 01-Dec-2006
   // checkArgs(procname, args(0), 1);
   ex;
 end_proc:

mcutils::mcSimplifyFast2 := proc(ex)
 begin
   // ... just a bookkeeping trick so I can figure out which we did on pass 2
   // for 14.0.1 (was Simplify)
   // e.g., see #060914-123737
   ex;
 end_proc:

mcutils::mcSimplifyFast2a := proc(ex)
 begin
   // ... just a bookkeeping trick so I can figure out which we did on pass 2
   // for 14.0.1 (was simplify)
   // e.g., see #060914-123737
   ex;
 end_proc:

mcutils::mcSimplify1 := proc(ex, OPTIONAL_ARGS)
 local xargs, res, action;
 begin
   xargs := args(2..args(0));
   action := hold(Simplify)(ex,xargs);
   // print("mcSimplify1 going to",action);
   if traperror(( res := eval(action); ))<>0 then // Simplify(ex,xargs)
      if traperror(( res := eval(action); ))<>0 then // Simplify(ex,xargs)
         // Try twice, in case of error such as Bug # 061103-131059.  Then give up.
         return(ex);
      end_if;
   end_if;
   // print("mcSimplify1 result",res);
   if testtype(res,"_exprseq") then
      res := op(res,1); // work around a bug in Simplify
      // print("mcSimplify1 result (repaired)",res);
   end_if;
   res;
 end_proc:

mcutils::mcSimplifyUsingSubs := proc(ex, OPTIONAL_ARGS)
 local xargs, res;
 begin
   xargs := args(2..args(0));
   res := simplify(mcSimplifyUsingSubsPrepass(ex));
   // print("simple simplify result:",res);
   res := mcSimplify1(res, xargs);
   res;
 end_proc:

mcutils::mcSimplifyUsingSubsPrepass := proc(ex)
 begin
 // print("mcSimplifyUsingSubsPrepass",domtype(ex),type(ex),ex);
   misc::maprec(ex,{"signIm","mcad_csgn","mcad_sign","op_sqrt",
                    "_power","op_sqr","op_mult","_mult",
                    "sin","mcad_sin",
                    "cos","mcad_cos",
                    "sec","mcad_sec",
                    "csc","mcad_csc",
                    "tan","mcad_tan",
                    "cot","mcad_cot",
                    "sinh","mcad_sinh",
                    "cosh","mcad_cosh",
                    "sech","mcad_sech",
                    "csch","mcad_csch",
                    "tanh","mcad_tanh",
                    "coth","mcad_coth"}=simplifySpecial);
 end_proc:

mcutils::mcSimplifyUsingRules := proc(ex, optional_target)
 begin
   Simplify(args(),Valuation=mcValuationFunction, SelectRules=mcSimplifyRuleSelector);
 end_proc:

 // Possible settings: Simplify, mcSimplifyUsingRules, or mcSimplifyUsingSubs
 // This is a bootstrap setting. Real initial setting is done in
 // initializeMathcadPreferences().

mcutils::mcSimplifyWorker := Simplify: 

mcutils::mcSimplify := proc(thing, OPTIONAL_ARGS)
 local result;
 begin
   // Some programs are not simplifiable according to MuPAD,
   // but we still want them to work gracefully.
   if traperror((result := mcSimplifyWorker(args()))) = 0
   then result;
   else thing;
   end_if;
 end_proc:

mcutils::simplifySign := proc(X) 
 local x1,d1,n1;
 begin
   if testtype(X,"mcad_csgn") or testtype(X,"mcad_sign") then
      x1 := op(X,1);
      // check whether foo(-x) is actually simpler than foo(x)
      if Simplify::complexity(-x1) <  Simplify::complexity(x1) then
         // Retain the operator, just complement the arg sign and the overall sign
         return(-subsop(X,1=-x1));
      end_if;
   elif testtype(X,"signIm") then
      x1 := op(X,1);
      return(mcSimplifyUsingSubsPrepass(-mcad_csgn(x1*I)));
   end_if;
   // happens if either we're called on bad data or have nothing to contribute simplificationwise.
   X;
 end_proc:

mcutils::simplifySpecial := proc(X) 
 local f, a, res;
 begin
  // print("simplifySpecial",X);
   if testtype(X,"_power") or testtype(X,"op_sqrt") then
      res := simplifyPower(X);
      // print("simplifySpecial returning",res);
      res;
   elif testtype(X,"mcad_csgn") or testtype(X,"mcad_sign") or testtype(X,"signIm") then
      simplifySign(X);
   elif type(X) in {"sin","mcad_sin",
                    "csc","mcad_csc",
                    "tan","mcad_tan",
                    "cot","mcad_cot",
                    "sinh","mcad_sinh",
                    "csch","mcad_csch",
                    "tanh","mcad_tanh",
                    "coth","mcad_coth"} then
      f := op(X,0);
      a := op(X,1);
      simplifySignAntiSymmetric(f, if testtype(a,"_mult") then [op(a)] else [a] end_if);
   elif type(X) in {"cos","mcad_cos",
                    "sec","mcad_sec",
                    "cosh","mcad_cosh",
                    "sech","mcad_sech"} then
      f := op(X,0);
      a := op(X,1);
      simplifySignSymmetric(f, if testtype(a,"_mult") then [op(a)] else [a] end_if);
   elif testtype(X,"_mult") or testtype(X,"op_mult") then
      simplifySignFactors(op(X,0),[op(X)]);
   else
      // shouldn't happen unless we're called on wrong data, but just in case
      // it's better to just return the data than lose.
      X:
   end_if;
 end_proc:

mcutils::simplifySignFactors := proc(f,a)
 local a0, facs, temp;
 begin
   facs := _exprseq();
   for a0 in a do
      if testtype(a0, "_power") 
         and (type(op(a0,1)) in {"mcad_sign", "mcad_csgn", "signIm"})
         and (testtype(op(a0,2), Type::Integer))
      then
         temp := mcSimplifyUsingSubsPrepass(a0);
         if Simplify::complexity(temp) < Simplify::complexity(a0) then
            a0 := temp;
         end_if;
      end_if;
      facs := facs, a0;
   end_for;
   f(facs);
 end_proc:

mcutils::simplifySignSymmetric := proc(f,argfactors)
 local a, a0, res, win;
 begin
   win := FALSE;
   // print("simplifySignSymmetric",f,argfactors);
   a := _exprseq();
   for a0 in argfactors do
      if type(a0) in {"signIm","mcad_sign","mcad_csgn"} then
         // print("discarding",a0);
         win := TRUE;
      else
         // print(" accumulating ",a0);
         a := a,a0;
      end_if;
   end_for;
   res := f(_mult(a));
   // print("simplifySignSymmetric(resimplifying)","res"=res);
   // print("simplifySignSymmetric","res"=res);
   if win then
      // print("simplifySignSymmetric resimplifying",res);
      res := mcSimplifyUsingSubsPrepass(res);
   end_if;
   // print("simplifySignSymmetric(simped)","res"=res);
   res;
 end_proc:

mcutils::simplifySignAntiSymmetric := proc(f,argfactors)
 local s, a, a0, res, win;
 begin
   win := FALSE;
   // print("simplifySignAntiSymmetric",f,argfactors);
   a := _exprseq();
   s := _exprseq();
   for a0 in argfactors do
      if type(a0) in {"signIm","mcad_sign","mcad_csgn"} then
         // print(" moving inside to out ",a0);
         s := s,a0;
         win := TRUE;
      else
         // print(" accumulating ",a0);
         a := a,a0;
      end_if;
   end_for;
   res := _mult(s)*f(_mult(a));
   // print("simplifySignAntiSymmetric","res"=res);
   if win then
      // print("simplifySignAntiSymmetric resimplifying",res);
      res := mcSimplifyUsingSubsPrepass(res);
   end_if;
   // print("simplifySignAntiSymmetric(simped)","res"=res);
   res;
 end_proc:

mcutils::simplifyPower := proc(X) 
 // to be called as Simplify(misc::maprec(ex, {"_power","op_sqrt"}=simplifyPower));
 local v, temp, b1, e1, b1b, b1e;
 begin
   // print("enter simplifyPower",X);
   b1 := op(X,1);
   e1 := op(X,2);
   b1b := op(b1,1);
   b1e := op(b1,2);
   if testtype(X, "op_sqr") then
      // print("testing for csgn to a power");
      if type(b1) in {"mcad_csgn", "mcad_sign"} then
         // print("e1=",e1,"even?",is(e1,Type::Even),"odd?",is(e1,Type::Odd));
         if is(e1,Type::Even)=TRUE then
            return(1);
         elif is(e1,Type::Odd)=TRUE then
            return(b1);
         else
            return(X);
         end_if;
      end_if;
   elif testtype(X,"_power") then
       // print("testing for csgn to a power");
      if type(b1) in {"mcad_csgn","mcad_sign"} then
         // print("e1=",e1,"even?",is(e1,Type::Even),"odd?",is(e1,Type::Odd));
         if is(e1,Type::Even)=TRUE then
            return(1);
         elif is(e1,Type::Odd)=TRUE then
            return(b1);
         else
            return(X);
         end_if;
  /* // Possible workaround/fix for Bug # 070201-161730
     // See also Bug # 060608-135952 if this gets fixed.
      elif type(b1) in {"abs"} then
         // print("it's abs");
         // print("e1=",e1,"even?",is(e1,Type::Even),"odd?",is(e1,Type::Odd));
         if is(e1,Type::Even)=TRUE then
            return(_power(op(b1,1),e1));
         end_if;
  */
      elif e1=1/2 then
         if testtype(b1,"_power") then
            if b1e=2 then
               if is(b1b,Type::Real)=TRUE then
                  // print(" _power of _power",b1b,"IS real");
                  temp:=mcad_abs(b1b);
               else
                  // print(" _power of _power",b1b,"is NOT real");
                  temp := b1b*mcad_csgn(b1b);
               end_if;
               // print("exit simplifyPower SUCCESS",temp);
               return(eval(temp));
            end_if;
         elif testtype(b1,"op_sqr") then
            if is(b1b,Type::Real)=TRUE then
               // print(" _power of op_sqr",b1b,"IS real");
               temp:=mcad_abs(b1b);
            else
               // print(" _power of op_sqr",b1b,"is NOT real");
               temp:=b1b*mcad_csgn(b1b);
            end_if;
            // print("exit simplifyPower SUCCESS",temp);
            return(eval(temp));
         end_if;
      elif e1=-1/2 then
         if testtype(b1,"_power") then
            if b1e=2 then
               if is(b1b,Type::Real)=TRUE then
                  // print("neg _power of _power",b1b,"IS real");
                  temp:=1/mcad_abs(b1b);
               else
                  // print("neg _power of _power",b1b,"is NOT real");
                  temp := 1/(b1b*mcad_csgn(b1b));
               end_if;
               // print("exit simplifyPower SUCCESS",temp);
               temp := eval(temp);
               // print("exit simplifyPower SUCCESS(evaluated)",temp);
               return(temp);
            end_if;
         elif testtype(b1,"op_sqr") then
            if is(b1b,Type::Real)=TRUE then
               // print("neg _power of op_sqr",b1b,"IS real");
               temp:=1/mcad_abs(b1b);
            else
               // print("neg _power of op_sqr",b1b,"is NOT real");
            end_if;
            // print("exit simplifyPower SUCCESS",temp);
            temp := eval(temp);
            // print("exit simplifyPower SUCCESS(evaluated)",temp);
            return(temp);
         end_if;
      end_if;
   elif testtype(X,"op_sqrt") then
      if testtype(b1,"_power") then
         if b1e=2 then
            if is(b1b,Type::Real)=TRUE then
               // print("op_sqrt of _power",b1b,"IS real");
               temp:=mcad_abs(b1b);
            else
               // print("op_sqrt of _power",b1b,"is NOT real");
               temp :=b1b*mcad_csgn(b1b);
            end_if;
            // print("exit simplifyPower SUCCESS",temp);
            return(eval(temp));
         end_if;
      elif testtype(b1,"op_sqr") then
         if is(b1b,Type::Real)=TRUE then
            // print("op_sqrt of op_sqr",b1b,"IS real");
            temp:=mcad_abs(b1b);
         else
            // print("op_sqrt of op_sqr",b1b,"is NOT real");
            temp:=b1b*mcad_csgn(b1b);
         end_if;
         // print("exit simplifyPower SUCCESS",temp);
         temp := eval(temp);
         // print("exit simplifyPower SUCCESS(evaluated)",temp);
         return(temp);
      end_if;
   end_if;
   X;
 end_proc:

mcutils::simplifyMode := proc(mode = mc_CURRENT)
 begin
   
   // If the argument is CURRENT, we read the mode rather than set it.
   if (mode = hold(mc_CURRENT)) then
      if (mcSimplifyWorker = Simplify) then
         mode := hold(mc_MUPAD);
      elif (mcSimplifyWorker = mcSimplifyUsingRules) then
         mode := hold(mc_RULES);
      elif (mcSimplifyWorker = mcSimplifyUsingSubs) then
         mode := hold(mc_SUBS);
      else
         mode := hold(mc_UNKNOWN);
      end_if;
      
   elif (mode = hold(mc_MUPAD)) then
      mcSimplifyWorker := Simplify;
   elif (mode = hold(mc_RULES)) then
      initializeRuleSimplifier();
      mcSimplifyWorker := mcSimplifyUsingRules;
   elif (mode = hold(mc_SUBS)) then
      mcSimplifyWorker := mcSimplifyUsingSubs;
   else
      internalError("Bad mode: %1", mode);
   end_if;
   
   mode;
 end_proc:

// Distribute a scalar operation, like addition, over
// a matrix and a scalar in the way that Mathcad
// does it (which is different from MuPAD's way).
mcutils::matrixScalarDistribute := proc(f,a,b)
 begin
   if isMatrix(a) and isMatrix(b) then
      distributeMatrixBinOp((x,y)->matrixScalarDistribute(f,x,y),a,b);
   elif isMatrix(b) then
      map(b,x->matrixScalarDistribute(f,a,x));
   elif isMatrix(a) then
      map(a,x->matrixScalarDistribute(f,x,b));
   else
      f(a,b);
   end_if;
 end_proc:

mcutils::isExtendedD := proc(x)
 local result;
 begin
   // print("isExtendedD(",x,")");
   result := bool(op(op(x,0),0)=hold(D));
   // print(" isExtendedD => ",result);
   result;
 end_proc:

mcutils::fixupExtendedD := proc(x)
 local a, i, c, d_op, d_argspecs, d_fn, point_args, d_argspec, result, np, 
   formal_point_args, actual_point_args, d_argcount, formal_arg, actual_arg, d_count, newproc;
 begin
   d_op := op(x,0);
   if (nops(d_op)<>2) then return(x); end_if;    // Simpler cases like D(f)(x) can stand
   d_argspecs := op(d_op,1);                     // Otherwise, we have D([..argspecs..],f)(..point_args..)

   if not allTrue(d_argspecs,isInteger) then     // We don't handle non-integer argspecs
      return(x);                                 // No available rewrite for D([..x..],...)(...)
   end_if;                                       // that is, we have no D[n](f)(x) notation available, nor any rewrite
   d_fn := op(d_op,2);
   point_args := [op(x)];
   np :=  nops(point_args);
   if allTrue(point_args,isSymbol) then
      if np = nops(toSet(point_args)) then
         // Special case f(a,b,c,...) where all of a,b,c are
         //  unique symbols.  In this case, we know what to
         //  call each of the args, so use those names.
         formal_point_args := point_args;
         actual_point_args := listElements(point_args);
         result := d_fn(actual_point_args);
         for d_argspec in reverseList(d_argspecs) do
            result := hold(diff)(result,op(formal_point_args,d_argspec));
         end_for;
         return(result);
      end_if;
   end_if;
   actual_point_args := point_args;      // make a copy
 d_argcount := map(actual_point_args,x->0);
 for a in d_argspecs do
   d_argcount[a] := d_argcount[a]+1;
 end_for;
 formal_point_args := actual_point_args; // make a copy
 for i from 1 to np do
   if d_argcount[i] > 0 then
     formal_point_args[i] := `mc_x`.i;
   end_if;
 end_for;
 result := d_fn(listElements(formal_point_args));
 for i from 0 to np-1 do
    c := np-i;
    if d_argcount[c] > 0 then 
      formal_arg := formal_point_args[c];
      actual_arg := actual_point_args[c];
      d_count := d_argcount[c];
      newproc := makeProc(formal_arg,result); // xproc1(formal_arg,result);
      result := hold(op_deriv_n)(newproc,d_count,actual_arg);
    end_if;
 end_for;
 result;
 end_proc:

mcutils::reverseList := proc(theList)
 local i, k, result;
 begin
   result := _exprseq();
   k := nops(theList);
   for i from 0 to k-1 do
      result := result, theList[k-i];
   end_for;
   [result];
 end_proc:

mcutils::makeTermSortFunction := proc(vars)
 option escape;
 begin
   proc (exp1,exp2)
    begin
      for var in vars do
         // print("comparing",exp1,exp2,"under vars",vars);
         d1 := guessTermOrder(exp1,var);
         d2 := guessTermOrder(exp2,var);
         if not isReal(d1) or not isReal(d2) then
            return(FALSE);
         elif d1 < d2 then
            // print("true");
            return(TRUE);
         elif d1 > d2 then
            // print("false");
            return(FALSE);
         end_if;
      end_for;
      // print("false (defaulted)");
      return(FALSE);
    end_proc;
 end_proc:

mcutils::guessTermOrder_so_far := 0:

mcutils::guessTermOrder := proc(x, v)
 save guessTermOrder_so_far;
 // This is heuristic for sorting series expressions, as in makeTermSortFunction.
 // DO NOT USE FOR COMPUTATION OF VALUES.
 // This is similar to "degree" but has to do with the idea that 
 // nth-order terms need to sort at a certain position.  So,
 // 1/x^8 and x^8 and (3*x^2+x)^4 and x^8/(1+x^5) are all of "term order 8" for the purpose of placement in the series.
 // Terms like x^x are ignored as hopeless and treated as order 1
 // because the exponent is impenetrable and there's an x in the denominator.
 begin
   guessTermOrder_so_far := if has(x,v) then 1 else 0 end_if;
   misc::maprec(x,
                {"_power", "op_power"}=
                  proc(x)
                   local b, e;
                   begin
                     b := op(x,1);
                     e := op(x,2);
                     if b = v then
                        if isScalar(e) then
                           guessTermOrder_so_far := max(guessTermOrder_so_far, abs(e));
                           // print("For",x,"setting degree=",guessTermOrder_so_far);
                        end_if;
                     else
                        guessTermOrder_so_far := max(guessTermOrder_so_far, e*guessTermOrder(b,v));
                     end_if;
                     x;
                   end_proc);
   guessTermOrder_so_far;
 end_proc:

mcutils::sortSeries := proc(series_expression,vars)
 local res;
 begin
   // print("sortSeries",series_expression,vars);
   if testtype(series_expression,"_plus") then
      res := sort([op(series_expression)],makeTermSortFunction(vars));
      // print("sortSeries results=",res);
      makeSeries(op(res));
   elif testtype(series_expression,Series::Puiseux) then
      sortSeries(expr(series_expression),vars);
   else
      // print("sortSeries fallthrough=",series_expression);
      series_expression;
   end_if;
 end_proc:

mcutils::makeSeries := proc()
 local nargs,res;
 begin
   // print("enter makeSeries",args());
   nargs := args(0);
   res :=
   case nargs 
   of 0 do 0;                            break;
   of 1 do args(1);                      break;
   of 2 do makeSeries2(args(1),args(2)); break;
   otherwise
      makeSeries(makeSeries2(args(1),args(2)),args(3..nargs));
      break;
   end_case;
   // print("leave makeSeries",res);
   res;
 end_proc:

mcutils::makeSeries2 := proc(exp1, exp2)
 begin
   if evalFloatNow then
      // Kludge to allow float of a series result to work.
      // Float will ignore held results, so we have to manually
      // float the arguments now while we can.
      // See Bug # 061205-111234.
      if op(exp1,0) <> hold(op_add) and op(exp1,0) <> hold(op_sub) then
         exp1 := float(exp1);
      end_if;
      if op(exp2,0) <> hold(op_add) and op(exp2,0) <> hold(op_sub) then
         exp2 := float(exp2);
      end_if;
   end_if;
   if expr2text(exp2)[1]="-" then  // use subtraction for negative terms
      hold(op_sub)(exp1,-exp2);
   else
      hold(op_add)(exp1,exp2);
   end_if;
 end_proc:

/* // These patches should not be needed as of PL13.

// Next two expressions are patch to make negative things not display lousily
// This fixes bugs # 061103-103826, 061003-141357

Content::set("plus", FAIL,  // no layout for _plus, hard-coded
              _plus,
              proc(plusExpr, attributes : DOM_TABLE)
                name convert_plus;
                local i, signs;
                save XxX;
              begin
                signs := attributes[hold(Signs)];
                if signs = "-" then
                  hold(_negate)(Content::expr(op(plusExpr, 1)))
                else
                  subsop(XxX((if signs[i] = "-" then
 
generate::negate(Content::expr(op(plusExpr, i)))
                              else
                                Content::expr(op(plusExpr, i))
                              end_if) $ i = 1 .. nops(plusExpr)),
                         0=hold(_plus), Unsimplified);
                end_if;
              end_proc):

*/

// Fix Bug # 061122-091020.  This fix should not be needed in PL18, if we ever go to that.
sysassign(stdlib::frozen::func_call,e -> context(subsop(hold(F)(args(2..args(0))), 0 = e)));

// return value of loading this file
null():
	
// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
