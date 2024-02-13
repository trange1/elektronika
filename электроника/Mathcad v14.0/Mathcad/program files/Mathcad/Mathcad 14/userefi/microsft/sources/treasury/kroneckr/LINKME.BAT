rem $Id: linkme.generic.bat,v 1.1 1994/08/30 22:21:37 dslater Exp $
rem         $Revision: 1.1 $
link -out:..\..\..\..\kroneckr.dll -dll -entry:"DllEntryPoint" kroneckr.obj ..\..\..\LIB\MCADUSER.LIB
