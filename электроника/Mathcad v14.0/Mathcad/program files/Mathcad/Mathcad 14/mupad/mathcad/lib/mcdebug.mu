//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/Trunk/efi/efisymbolics-umgd/mupad/mathcad/lib/mcdebug.mu $
//*   $Revision:: 25                                                                      $
//*     $Author:: kpitman                                                                 $
//*       $Date:: 2006-11-13 11:40:44-05:00                                               $
//* $NoKeywords::                                                                         $
//*
//*  Purpose : Defines debugging functions useful for Mathcad.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

mcdebug := newDomain("mcdebug"):
mcdebug::Name := "mcdebug":
mcdebug::info := "Library 'mcdebug': ".
                  "Mathcad debugging functions (NOT FOR DISTRIBUTION).":

mcdebug::interface :=
   {
    // ===== Tools =====
    hold(dbgShowTree),
    hold(dbgShowTreeRecursively),
    hold(mc_dbgDebugInfo),
    hold(mc_dbgElt),
    hold(mc_dbgFloatMode),
    hold(mc_dbgFuzzyEqual),
    hold(mc_dbgHeuristicEqual),
    hold(mc_dbgHold),
    hold(mc_dbgIs),
    hold(mc_dbgMatCol),
    hold(mc_dbgMcFloat),
    hold(mc_dbgMcFloatFromString),
    hold(mc_dbgRef),
    hold(mc_dbgSimplifyMode),
    hold(mc_dbgSolve),
    ()}:

// ==================== DEBUGGING FUNCTIONS ====================

mcdebug::mc_dbgDebugInfo := proc(key = mc_VERSION)
 begin
   if key = mc_VERSION then
      op_transpose(matrix([version().[patchlevel()]]));
   elif key = mc_PATCHLEVEL then
      patchlevel();
   elif key = mc_RULES then 
      bool(mathcad_use_all_mcrules = TRUE);
   else
      formatError(errorBadSyntax);
   end_if;
 end_proc;

mcdebug::mc_dbgElt := proc(M, i, j=0)
 begin
   checkArgs(procname, args(0), 2, 3);
   checkMatrix(M);
   M[i+1,j+1];
 end_proc:

mcdebug::mc_dbgFloatMode := proc(mode = mc_CURRENT)
 begin
   floatMode(mode);
 end_proc:

mcdebug::mc_dbgHeuristicEqual := proc(n1, n2, tolerance)
 begin
   heuristicEqual(n1,n2,tolerance);
 end_proc:

// Expose this for debugging use.
mcdebug::mc_dbgFuzzyEqual := proc(n1, n2, precision=fuzzyPrecision)
 local res;
 begin
   res := fuzzyEqual(n1, n2, precision);
   if   res = TRUE  then 1;
   elif res = FALSE then 0;
   else hold(mc_dbgFuzzyEqual)(n1, n2, 
                               if precision = fuzzyPrecision then
                                  _exprseq(); 
                               else 
                                  precision;
                               end_if);
   end_if;
 end_proc:

mcdebug::mc_dbgHold := proc(x)
 local nargs;
 begin
   nargs := args(0);
   if nargs = 1 then
      text2expr(x);
   else
      text2expr(x)(args(2..nargs));
   end_if;
 end_proc:

mcdebug::mc_dbgIs := proc(e)
 option hold;
 local a0,a1,a2,answer;
 begin
   checkArgs(procname, args(0), 1);
   e := toLogical(e);
   a0 := op(e,0);
   a1 := op(e,1);
   a2 := op(e,2);
   if a0 in {hold(_equal)} then
      if (a2 = hold(mc_real)) then
         answer:=is(a1,Type::Real);
      elif (a2 = hold(mc_complex)) then
          answer:=is(a1,Type::Complex);
      elif (a2 = hold(mc_integer)) then
         answer:=is(a1,Type::Integer);
      elif (a2 = hold(mc_odd)) then
         answer:=is(a1,Type::Odd);
      elif (a2 = hold(even)) then
         answer:=is(a1,Type::Even);
      else
         answer:=is(a1=a2);
      end_if;
   else
      answer:=is(e);
   end_if;
   if   answer=TRUE  then 1
   elif answer=FALSE then 0
   else -1;
   end_if;
 end_proc:

mcdebug::mc_dbgMatCol := proc(M, i)
 begin
   checkArgs(procname, args(0), 2);
   op_matcol(M, i+1);
 end_proc:

mcdebug::mc_dbgMcFloat := proc(val)
 begin
   mcfloat(val);
 end_proc:

mcdebug::mc_dbgMcFloatFromString := proc(val)
 begin
   mcFloatFromString(val);
 end_proc:

mcdebug::mc_dbgRef := proc(M, i, j=NONE)
 begin
   if j = NONE then
      M[i];
   else
      M[i,j];
   end_if;
 end_proc: 

mcdebug::dbgShowTree := proc(expression)
 option hold;
 begin
   if (nops(expression)=1 and op(expression,0) = hold(hold)) then
      expression := op(expression,1);
   end_if;
   dbgShowTreeRecursively(expression, 0);
 end_proc:

mcdebug::dbgShowTreeRecursively := proc(expression, level)
 local temp,prefix,i,n;
 begin
   prefix := _concat("","  "$level);
   temp := op(expression,0);
   if (temp <> FAIL) then
      n := nops(expression);
      print(Unquoted,NoNL,prefix);
      print(Unquoted,NoNL,expr2text(temp));
      print(Unquoted,NoNL," [");
      print(Unquoted,NoNL,n);
      print(Unquoted,if n=1 then " argument]" else " arguments]" end_if);
      for i from 1 to n do
        dbgShowTreeRecursively(op(expression,i), level+1);
      end_for;
   else
      print(Unquoted,NoNL,prefix);
      print(Unquoted,expr2text(expression));
   end_if;
 end_proc:
  
mcdebug::mc_dbgSimplifyMode := proc(mode = mc_CURRENT)
 begin
   simplifyMode(mode);
 end_proc:

mcdebug::mc_dbgSolve := proc(expressions, vars)
 begin
   checkArgs(procname, args(0), 2);
    keyword_solve(expressions, vars);
 end_proc:

// return value of loading this file
null():

// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
