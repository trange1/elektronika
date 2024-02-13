rem $Id: linkme.generic.bat,v 1.1 1994/08/30 22:21:37 dslater Exp $
rem         $Revision: 1.1 $
link -out:..\..\..\..\digamma.dll -dll -entry:"DllEntryPoint" digamma.obj ..\..\..\LIB\MCADUSER.LIB
