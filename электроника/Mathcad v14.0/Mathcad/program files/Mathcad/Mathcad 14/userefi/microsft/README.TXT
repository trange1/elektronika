README FILE FOR USING MICROSOFT COMPILER VISUAL C++ TO BUILD A
USER DLL FOR MATHCAD 

The instructions assume that you have installed Mathcad in the default directory.
 If this is not true (for example, if you installed to the
 directory C:\PROGRAM FILES\MATHSOFT\MATHCAD), then please substitute 
the correct path wherever it appears.


I. Using Visual Studio 6.0

1. From the Command Line

Sample files are provided in the SOURCES subdirectory. Each sample 
has a compile.bat and a linkme.bat file associated with 
it. To build a sample project just call these files in sequence.

For information on how to generate new source files, see the file CREATING
A USER DLL.PDF located on the Mathcad CD.

Using command line calls to the compiler and linker:

Typical compile line:

  cl -c -IC:\WINMCAD\USEREFI\MICROSFT\INCLUDE -DWIN32 
filename.c

or, using the relative notation in the case of the samples,

  cl -c -I..\..\INCLUDE -DWIN32 filename.c

Typical link line:

  link -out:C:\WINMCAD\USEREFI\DLLname.dll -dll 
  -entry:"DllEntryPoint"  
  filename.obj
  C:\WINMCAD\USEREFI\MICROSFT\LIB\MCADUSER.LIB

or, again, using the relative notation in the case of the samples,

  link -out:..\..\..\DLLname.dll -dll -entry:"DllEntryPoint" filename.obj 
..\..\LIB\MCADUSER.LIB


2. From the Visual C++ IDE

Each sample has a .mak project file associated with it. To build a 
sample just start Visual C++, open the project and rebuild it.

To generate a new user DLL project in Visual C++:

        * Create a new project and choose a name and path for it. 
        * Choose Dynamic Link Library (.DLL) for the Project Type. 
        * Add your source files to the project. (If you 
          have not created the source files yet you can add them later.)
        * Add the library file MCADUSER.LIB in the MICROSFT\LIB 
          directory to the project.
        * In the Options/Project Compiler Options dialog box choose 
          the Preprocessor category and add the directory where 
          the include file MCADINCL.H for MICROSFT is located, e.g. 
          C:\WINMCAD\USEREFI\MICROSFT\INCLUDE (or ..\..\INCLUDE 
          in relative notation for the samples) to the Include path.
        * In the Options/Project Linker Options dialog box choose 
          the Image Attributes category and enter DllEntryPoint 
          for the Entry-Point Symbol.

Now you are ready to build the DLL. You can do this by choosing 
Rebuild All on the Project menu.
  
After building you have to move the DLL to the USEREFI directory 
under MATHCAD's default directory, e.g. C:\WINMCAD\USEREFI. 

Comments:
        
        * In the source file, the DLL entry point can be called 
          anything you want, e.g., DllEntryPoint. However, you need 
          to specify the name to the linker. You do this by 
          choosing a linker option as described above.

        * You must initialize C runtime libraries using 
          calls to _CRT_INIT when the DLL is first entered and when 
          it is detached. This is demonstrated in the sample.

        * Alignment: The default structure alignment for Win32s 
          applications is 8-byte alignment.


II. Using Visual Studio .NET

1. From the Command Line

To build all the samples simply execute the following from the command line:
  
  "%MS_DEV%\Common7\IDE\devenv" C:\WINMCAD\USEREFI\MICROSFT\SOURCES\userefi.sln /build release

This command builds the release configuration of all samples.  To build a different 
configuration, replace the "release" above with the name of the desired configuration
(e.g. debug)

In order to build a particular sample project (e.g. userpack), execute the following 
from the command line:

  "%MS_DEV%\Common7\IDE\devenv" C:\WINMCAD\USEREFI\MICROSFT\SOURCES\userefi.sln /build release /project userpack

For more options see the syntax of the "devenv" command using:

  "%MS_DEV%\Common7\IDE\devenv" /?


2. From the Visual C++ IDE

Each sample has a .vcproj project file associated with it.  In addition, there
is a single solution file, C:\WINMCAD\USEREFI\MICROSFT\SOURCES\userefi.sln which 
includes all sample projects.  To build the samples just start Visual C++, open the
solution or the desired project and rebuild it.  The user DLLs produced by the samples 
are automatically copied to the USEREFI directory of your Mathcad installation.

To generate a new user DLL project in Visual C++:

        * Create a new project and choose a name and path for it. 
        * Choose Dynamic Link Library (.DLL) for the Project Type. 
        * Add your source files to the project. (If you 
          have not created the source files yet you can add them later.)
        * Open the project properties by right-clicking on the project in the Solution 
          Explorer and selecting Properties...
	* Under C/C++ > General > Additional Include Directories add the directory where 
          the include file MCADINCL.H for MICROSFT is located, e.g. 
          C:\WINMCAD\USEREFI\MICROSFT\INCLUDE (or ..\..\INCLUDE 
          in relative notation for the samples)
	* Under Linker > Input > Additional Dependencies add the library file MCADUSER.LIB 
	  in the MICROSFT\LIB directory
        * Under Linker > Command Line > Additional Options add -entry:"DllEntryPoint"
          for the Entry-Point Symbol.
  	* If you would like the resulting user DLLs to be automatically copied to the
	  Mathcad userefi directory, under Build Events > Post-Build Event > Command Line
	  enter 
		xcopy $(TargetPath) C:\WINMCAD\USEREFI\ /rqky


III. Using Other Compilers

You could use VCBuild to build the samples without the need of a full Visual C++ 
installation.  For instructions on installing and using VCBuild please follow the 
instructions provided by the Microsoft Developer Network 
(http://msdn2.microsoft.com/en-us/library/hw9dzw3c.aspx)


For more information see the sample source files and the README.TXT 
file in the USEREFI subdirectory.
