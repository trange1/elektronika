//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/releases/Mathcad_14.0.1/efi/efisymbolics-umgd/mupad/mathcad/lib/mcrules.mu $
//*   $Revision:: 21                                                                      $
//*     $Author:: kpitman                                                                 $
//*       $Date:: 2007-04-30 01:45:39-04:00                                               $
//* $NoKeywords::                                                                         $
//*
//*  Purpose : Defines ruled-based extensions to math facilities provided by MuPAD.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

mcrules := newDomain("mcrules"):
mcrules::Name := "mcrules":
mcrules::info := "Library 'mcrules': ".
                  "Mathcad rule-based extensions to math facilities.":

mcrules::interface :=
   {
    ()}:

// Please report additions of general-purpose rules to SciFace as they are made, 
// so that they can choose to pick them up and include them in the standard release,
// saving us the trouble of later maintenance.

if mathcad_use_all_mcrules = TRUE then
   print("Ignoring mathcad_use_all_mcrules (from UseAllMcRules Registry setting).");
end_if;

    // We used to load our alternate xpatternFSA.mb under normal circumstances.
    // The fallback is to load the standard one
   proc()
      // Yes, that's a lowercase "c" on the variable read from the file,
      // FSA_cauchy, and an uppercase "C" on the variable in the actual
      // domain, intlib::definite::patternFSA_Cauchy.
      // Not my choice.  These variables are dictated by SciFace.
      // I've added error check intended to notice a change.
      // -kmp 13-Nov-2006

    save FSA, FSA_cauchy;
    local warned, filename;
    begin
      if mathcad_use_custom_mcrules <> 0 then
         warned :=FALSE;
         print(Unquoted,"Loading all compiled rule patterns"):
         if (intlib::definite::patternFSA = FAIL) then
            warned :=TRUE;
            print(Unquoted,"WARNING: intlib::definite::patternFSA was not set."); 
         end_if;
         if (intlib::definite::patternFSA_Cauchy = FAIL) then
            warned :=TRUE;
            print(Unquoted,"WARNING: intlib::definite::patternFSA_Cauchy was not set."); 
         end_if;
         if (FSA <> hold(FSA)) then
            warned :=TRUE;
            print(Unquoted,"WARNING: FSA is bound.");
         end_if;
         if (FSA_cauchy <> hold(FSA_cauchy)) then
            warned :=TRUE;
            print(Unquoted,"WARNING: FSA_cauchy is bound.");
         end_if;
         filename:="xpatternFSA".mathcad_use_custom_mcrules.".mb";
         print(Unquoted,"Loading ",filename);
         if traperror(( read(filename); ))<> 0 then
            print(Unquoted,"Load failed.");
            print(Unquoted,getlasterror());
            print(Unquoted,"Default rules will be used.");
         end_if;
         unprotect(intlib):
         if (FSA = hold(FSA)) then
            warned :=TRUE;
            print(Unquoted,"WARNING: FSA did not get bound by file load.");
         else
            intlib::definite::patternFSA := FSA:
         end_if;
         if (FSA_cauchy = hold(FSA_cauchy)) then
            warned :=TRUE;
            print(Unquoted,"WARNING: FSA_cauchy did not get bound by file load.");
         else
            intlib::definite::patternFSA_Cauchy := FSA_cauchy:
         end_if;
         if not warned then
            print(Unquoted,"Succeeded in loading intlib::definite::patternFSA".
                  " and intlib::definite::patternFSA_Cauchy.");
         end_if;
         protect(intlib, ProtectLevelError):
         print(Unquoted,"Done loading compiled rule patterns.");                        
      else
         print(Unquoted,"No loading of alternate compiled rule patterns was requested.");
      end_if;
    end_proc():

// These have been reported to SciFace

int::addpattern(sin(sqrt(x)),x,2*sin(sqrt(x))-2*cos(sqrt(x))*sqrt(x)):
int::addpattern(cos(sqrt(x)),x,2*cos(sqrt(x))+2*sin(sqrt(x))*sqrt(x)):

// These are new, not yet logged with SciFace

// Next two because of Bug # 060801-143232
// Citation: Handbook of Mathematics (ISBN 3540434917) 4th Ed, p1050, case 10
int::addpattern(tan(a*x)/x,x=0..infinity, PI/2,[a],[a>0]):
int::addpattern(tan(a*x)/x,x=0..infinity,-PI/2,[a],[a<0]):

// Next one is trivial to prove correct.  MuPAD can invert the integration back to the original.

int::addpattern(sec(x)*tan(x),x,sec(x));
int::addpattern(csc(x)*cot(x),x,-csc(x));

// Fix bad intermediate state noted in Bug # 060720-182318 :
// int(x^n,n) was returning x*E^(n*ln(x))/(n+1)...

int::addpattern(x^a,x,x^(a+1)/(a+1),[a],[a<>-1]);
int::addpattern(x^a,x,ln(x),[a],[a=-1]);


// Fix performance bug # 061128-124823
int::addpattern(sin(m*x)*sin(n*x),x=0..hi,sin(hi*m-hi*n)/(2*m-2*n)-sin(hi*m+hi*n)/(2*m+2*n),[hi,m,n]);

// Bug # 060817-153747
// These were manually derived by changing:
//   sin(t)^2 to (1-cos(2*t))/2
//   cos(t)^2 to (1+cos(2*t))/2
// and then calling transform::fourier on that form of the problem in MuPAD.
// MuPAD can solve them if they're in the right form, but can't find the right form.
//
transform::fourier::addpattern(sin(t)^2,t,s,
                               PI*dirac(s) - 1/2*PI*(dirac(s - 2) + dirac(s + 2))):

transform::fourier::addpattern(cos(t)^2,t,s,
                               (PI*(dirac(s - 2) + dirac(s + 2)))/2 + PI*dirac(s)):

// Ref: Signals & Systems - Reference Tables - Page 3
// This fixes bug #060801-170302
// NOTE: The customer that reported this seemed to think the a>0 assumption was needed,
//  though the ref table I'm looking at didn't mention that.  I've conservatively added
//  a>0 here as a restriction, but maybe that's not needed. We should research that.
//  -kmp 08-Sep-2006

transform::fourier::addpattern(E^(-a*abs(t)),t,s,
                               2*a/(a^2+s^2),[a],[a>0]):

// return value of loading this file
null():

// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
