//********* Copyright © Parametric Technology Corporation. All rights reserved
//*
//*    $Logfile:: /MathcadClient/Trunk/efi/efisymbolics-umgd/mupad/mathcad/lib/init.mu $
//*   $Revision:: 16                                                                   $
//*     $Author:: kpitman                                                              $
//*       $Date:: 2006-10-24 13:14:47-04:00                                            $
//* $NoKeywords::                                                                      $
//*
//*  Purpose : Initializes the Mathcad library of symbolic functions.
//*
//* See also : The MuPad documentation on the 'package' function.
//*
//*
//*  Comments: This file uses a tab size of 3 spaces.
//*
//****************************************************************************

// Add our library directory to the list of places to find modules.

// This didn't work...
//LIBPATH:=LIBPATH,pathname("LIBFILES");
// But this did (together with specifying 'path' in the loadproc
// calls below)...
alias(path = pathname("."));

for libname in [ 
                 mcmsg,     // user-visible messages for internationalization
                 mcfloat,   // support for MAPLE-like floats in MuPAD
                 mcutils,   // type predicates and other internal tools
                 basefuncs, // op_add, etc.
                 keywords,  // live symbolics (symbolic keywords)
                 mcmenu,    // dead symbolics (menu commands)
                 mcrules,   // calculus rules, etc.

                 if (mathcad_debug = TRUE) then mcdebug; else (); end_if,

                 ()] do

   // Set foo module up to autoload.
   // Constructs and executes:      mylib := loadproc(mylib, "", "mylib"):  

   eval(subs(ASSIGN(VAR,INITFORM),
             ASSIGN=hold(_assign),
             VAR=libname,
             INITFORM=hold(loadproc)(libname,path,coerce(libname,DOM_STRING)))):

   // Make names in 'mylib' available without qualification
   // Constructs and executes:      export(mylib):

   eval(subs(EXPORTER(VAR),
             EXPORTER=hold(export),
             VAR=libname)):

end_for;

unalias(path);

// return value of package
"library 'mathcad' successfully loaded":

// For Emacs Users...
// Local Variables:
// tab-width:3
// indent-tabs-mode:nil
// End:
