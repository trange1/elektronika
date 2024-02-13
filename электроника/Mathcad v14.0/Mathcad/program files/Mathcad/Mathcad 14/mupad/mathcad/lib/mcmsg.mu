//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/releases/Mathcad_14.0.1/efi/efisymbolics-umgd/mupad/mathcad/lib/mcmsg.mu $
//*   $Revision:: 32                                                                    $
//*     $Author:: kpitman                                                               $
//*       $Date:: 2007-06-01 13:17:38-04:00                                             $
//* $NoKeywords::                                                                       $
//*
//*  Purpose : Defines user-visible messages for Mathcad
//*            (Presumably these are what require internationalization.)
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

mcmsg := newDomain("mcmsg"):
mcmsg::Name := "mcmsg":
mcmsg::info := "Library 'mcmsg': ".
                  "Definitions of user-visible messages for Mathcad.":

mcmsg::interface :=
 {
  hold(decodeMuPADError),
  hold(decodeMuPADErrorMessage),
  hold(defaultError),
  hold(errorAmbiguousVar),
  hold(errorArrayDimensionMismatch),
  hold(errorArrayIndexOutOfBounds),
  hold(errorBadDigits),
  hold(errorBadCombineTarget),
  hold(errorBadIdentifier),
  hold(errorBadMaxDegree),
  hold(errorBadRewriteTarget),
  hold(errorBadSolveVar),
  hold(errorBadSyntax),
  hold(errorCoeffsBadResultFormat),
  hold(errorDivideByZero),
  hold(errorInappropriateExpression),
  hold(errorInappropriateModifier),
  hold(errorIncomparable),
  hold(errorInvalidArgument),
  hold(errorInvalidAssumption),
  hold(errorInvalidMatrixSize),
  hold(errorInvalidModifier),
  hold(errorInvalidSolveConstraint),
  hold(errorMatrixDimensionMismatch),
  hold(errorMatrixNotSquare),
  hold(errorMustBeBetween),
  hold(errorNeedVarsToSolveFor),
  hold(errorNoEigenvecs),
  hold(errorNoMatch),
  hold(errorNoSolveSolution),
  hold(errorNot3Vec),
  hold(errorNotANumber),
  hold(errorNotFound),
  hold(errorNotFunction),
  hold(errorNotInteger),
  hold(errorNotMatrix),
  hold(errorNotNonNegativeInteger),
  hold(errorNotPolynomial),
  hold(errorNotPositiveInteger),
  hold(errorNotRange),
  hold(errorNotRationalFunction),
  hold(errorNotReal),
  hold(errorNotScalar),
  hold(errorNotScalarMatrix),
  hold(errorNotSymbol),
  hold(errorNotVector),
  hold(errorPatternNotEquation),
  hold(errorRootNotSymbolic),
  hold(errorSeriesFail),
  hold(errorStraySolveEquality),
  hold(errorStraySolveInequality),
  hold(errorStraySolveVar),
  hold(errorSymbolic),
  hold(errorTooFewArgs),
  hold(errorTooFewKeyArgs),
//hold(errorTooFewArgs1), // no need for this one. all normal functions take 1 arg
  hold(errorTooFewKeyArgs1),
  hold(errorTooManyArgs),
  hold(errorTooManyKeyArgs),
  hold(errorTooManyArgs1),
  hold(errorTooManyKeyArgs1),
  hold(errorTransformVarsIdentical),
  hold(errorUsingVarExists),
  hold(errorUsingVarNotGenerated),
  hold(lookupMuPADErrorMessage),
  hold(processMuPADError),
  hold(processLastMuPADError),
  hold(simplifyMuPADErrorMessage),
  ()}:

// ========================================

mcmsg::errorAmbiguousVar               := "ambiguous_variable":
mcmsg::errorArrayDimensionMismatch     := "array size mismatch":
mcmsg::errorArrayIndexOutOfBounds      := "index out of bounds":
mcmsg::errorBadDigits                  := "SymbolicsEvalfDigits":
mcmsg::errorBadCombineTarget           := "bad combine target":
mcmsg::errorBadIdentifier              := "bad_identifier":
mcmsg::errorBadMaxDegree               := "bad maxdegree":
mcmsg::errorBadRewriteTarget           := "bad rewrite target":
mcmsg::errorBadSolveVar                := "bad solve var":
mcmsg::errorBadSyntax                  := "bad_syntax":
mcmsg::errorCoeffsBadResultFormat      := "coeffs bad result format":
mcmsg::errorDivideByZero               := "divide by zero":
mcmsg::errorInappropriateExpression    := "inappropriate expression":
mcmsg::errorInappropriateModifier      := "inappropriate modifier":
mcmsg::errorIncomparable               := "incomparable":
mcmsg::errorInvalidArgument            := "invalid argument":
mcmsg::errorInvalidAssumption          := "Illegal Assume constraint":
mcmsg::errorInvalidMatrixSize          := "invalid matrix size":
mcmsg::errorInvalidModifier            := "invalid modifier":
mcmsg::errorInvalidSolveConstraint     := "slvIllegalConstraint":
mcmsg::errorMatrixDimensionMismatch    := "unequal matrix dimensions":
mcmsg::errorMatrixNotSquare            := "must be square":
mcmsg::errorMustBeBetween              := "must be between": // needs 2 args
mcmsg::errorNeedVarsToSolveFor         := "need vars to solve for":
mcmsg::errorNoEigenvecs                := "SymbolicsEigenvecsFail":
mcmsg::errorNoMatch                    := "no matching values found":
mcmsg::errorNoSolveSolution            := "SymbolicsNoSolveSoln":
mcmsg::errorNot3Vec                    := "MustHave3Vect":
mcmsg::errorNotANumber                 := "nan":
mcmsg::errorNotFound                   := "NotFound":
mcmsg::errorNotFunction                := "must be function":
mcmsg::errorNotInteger                 := "must be integer":
mcmsg::errorNotMatrix                  := "must be matrix":
mcmsg::errorNotNonNegativeInteger      := "must be non-negative integer":
mcmsg::errorNotPolynomial              := "msgSymbolicsNotAPoly":
mcmsg::errorNotPositiveInteger         := "must be positive integer":
mcmsg::errorNotRange                   := "must be range":
mcmsg::errorNotRationalFunction        := "must be rational function":
mcmsg::errorNotReal                    := "must be real":
mcmsg::errorNotScalar                  := "must be scalar":
mcmsg::errorNotScalarMatrix            := "must be scalar matrix":
mcmsg::errorNotSymbol                  := "must be identifier":
mcmsg::errorNotVector                  := "must be vector":
mcmsg::errorPatternNotEquation         := "subs pattern not eqn":
mcmsg::errorRootNotSymbolic            := "root not symbolic":
mcmsg::errorSeriesFail                 := "SymbolicsSeriesFail":
mcmsg::errorStraySolveEquality         := "stray solve equality":
mcmsg::errorStraySolveInequality       := "stray solve inequality":
mcmsg::errorStraySolveVar              := "stray solve var":
mcmsg::errorSymbolic                   := "SymbolicsFail":
mcmsg::errorTooFewArgs                 := "too_few_arguments":
mcmsg::errorTooFewKeyArgs              := "too_few_keyargs":
//mcmsg::errorTooFewArgs1             := "too_few_arguments1": // no such concept, not needed
mcmsg::errorTooFewKeyArgs1             := "too_few_keyargs1":
mcmsg::errorTooManyArgs                := "too_many_arguments":
mcmsg::errorTooManyKeyArgs             := "too_many_keyargs":
mcmsg::errorTooManyArgs1               := "too_many_arguments1":
mcmsg::errorTooManyKeyArgs1            := "too_many_keyargs1":
mcmsg::errorTransformVarsIdentical     := "transform vars identical":
mcmsg::errorUsingVarExists             := "using var exists":
mcmsg::errorUsingVarNotGenerated       := "using var not generated":

// These aren't used but might be useful sometime...
//
// mcmsg::errorNotScalarVector         := "must be scalar vector":
// mcmsg::errorNotRealVector           := "must be real vector":
// mcmsg::errorNotRealMatrix           := "must be real matrix":
// mcmsg::errorNotRealArray            := "must be real array":
// mcmsg::errorNotPositive             := "must be positive":
// mcmsg::errorNotNonZero              := "must be nonzero":
// mcmsg::errorNotNonNegative          := "must be non-negative":
// mcmsg::errorNotNegative             := "must be negative":
// mcmsg::errorNotIntegerVector        := "must be integer vector":
// mcmsg::errorNotIntegerMatrix        := "must be integer matrix":
// mcmsg::errorNotFunction             := "must be a function":

mcmsg::defaultError := mcmsg::errorSymbolic;

mcmsg::processLastMuPADError := proc(default = NONE)
 save defaultError;
 begin
   if default <> NONE then 
      // Possibly establish new defaultError for this dynamic scope
      // This allows something like the solver to specify the default
      // error as a solve error rather than something else.
      defaultError := default;
   end_if;
   processMuPADError(getlasterror());
 end_proc:

mcmsg::processMuPADError := proc(msglist)
 begin
   error(decodeMuPADError(msglist));
 end_proc:

mcmsg::decodeMuPADError := proc(msglist)
 begin
   decodeMuPADErrorMessage(msglist[2]);
 end_proc:

mcmsg::simplifyMuPADErrorMessage := proc(msg)
 local prefix, suffix_prefix, msg_start, msg_end;
 begin
   prefix:="Error: ";
   suffix_prefix:=" [";
   msg_start := stringlib::pos(msg,prefix);
   if msg_start = FAIL then msg_start := 1; else msg_start := msg_start+length(prefix) end_if;
   msg_end := stringlib::pos(msg,suffix_prefix);
   if msg_end = FAIL then msg_end := length(msg); else msg_end := msg_end-1; end_if;
   msg[msg_start..msg_end]
 end_proc:

mcmsg::decodeMuPADErrorMessage := proc(msg)
 begin
   lookupMuPADErrorMessage(simplifyMuPADErrorMessage(msg));
 end_proc:

mcmsg::lookupMuPADErrorMessage := proc(x)
 option remember;
 local sym;
 begin
   for sym in mcmsg::interface do
      if eval(sym) = x then return(x); end_if;
   end_for;
   defaultError;
 end_proc:

mcmsg::lookupMuPADErrorMessage("not a rational function") := mcmsg::errorNotRationalFunction:

// ========================================

// return value of loading this file
null():
	
// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
