@echo off
REM -----------------------------------------------------------------------
REM
REM Running this batch file will silently (without user interaction) install
REM Mathcad 14. By editing this file, you can customize a Mathcad installation
REM for deployment across your enterprise.
REM
REM    N O T I C E: In order for Mathcad 14 to operate correctly, please 
REM    ensure that ALL the prerequisite software is installed on each 
REM    client machine prior to a silent installation of Mathcad 14 using 
REM    this BAT file.
REM
REM    All prerequisites can be found on the Mathcad 14 Installation CD.    
REM    The prerequisites are:
REM
REM       MSXML 4.0 SP2
REM       Microsoft .NET Framework 1.1 
REM       MDAC 2.6 
REM
REM In the section below, set the specified variables to customize your
REM installation by supplying a value within the appropriate set of quotation
REM marks. These values are used to build a command-line instruction to run the
REM install without user interaction.  When entering values, do not delete the 
REM backslash character before a quotation mark, as this will cause the install
REM program to misinterpret the value you enter.
REM
REM If variables left undefined (\"\"), the install will use default values. All
REM variables are OPTIONAL, except for the Product Code; the Product Code is
REM unique to each CD, and is required for the installation to proceed.
REM
REM -----------------------------------------------------------------------
REM Specify values for the variables below for the installation program.
REM Variables left as an empty string will use the default value, indicated
REM for each variable.

REM Supply your Product Code. The Product Code is a unique string of 22
REM characters that identifies the particular product you purchased, located
REM on the CD envelope. There is NO default value.
set PRODUCT_CODE=\"\"

REM Specify the directory to where you would like to install Mathcad.
REM The default value is C:\Program Files\Mathcad\Mathcad 14\
set INSTALLDIR=\"\"

REM Specify the FLEXlm server specification or license file path. If no
REM server or file is specified, Mathcad will prompt for one on start-up.
REM The syntax for a server is [port]@server where [port] is an optional
REM port number and server is the name of the FLEXlm server.
set LICENSEPATH=\"\"

REM Specify the default file format. The available choices are 
REM XML14 (default), and XMLZ14. This setting is CASE-SENSITIVE.
set DEFAULTFILEFORMAT=\"\"

REM Specify the location of the Mathcad Resources. The default value is the
REM QSHEET directory of your Mathcad installation.
set HBKLOCATION=\"\"

REM Specify the location for the QuickSheets, Tutorials, and Reference Tables
REM TOCs. These are subsets of the Mathcad Resources targeting specific
REM audiences of users. QuickSheets focus on solving problems by using Mathcad
REM functionality. The Tutorials target new Mathcad users, demonstrating how to
REM use and apply Mathcad. The Reference Tables contain constants and formulae
REM that users might otherwise need to find in books. When you access one of
REM these resources from either the Help menu or the Resources toolbar, Mathcad
REM will look in the specified location. The default value for each is the
REM QSHEET directory of your Mathcad installation.

REM When entering a value for the QuickSheets, Tutorials, and Reference Tables
REM TOCs, you must include the name of the TOC file in the path. The TOC filename
REM for each is:
REM Quicksheets: toc_qs.xmcd
REM Tutorials: toc_tuto.xmcd
REM Reference Tables: toc_fctb.xmcd
set QUICKSHEETSTOC=\"\"
set TUTORIALSTOC=\"\"
set REFERENCETABLESTOC=\"\"

REM Specify the location of your workgroup repository, if you use one, as either
REM a file path or a URL. The default value is the file ehome.html, in the QSHEET\html
REM directory of your Mathcad installation.
set MYSITEDESTINATION=\"\"

REM Specify the destination page when you click the Home button on the Resource
REM Window toolbar. The default value is the file map.xmcd in the QSHEET directory
REM of your Mathcad installation.
set HOMEPAGE=\"\"

REM By default, a silent-install log file called Mcad14_install_log.txt is created 
REM in the folder from which you run the script. Change the name of the log file
REM and path here, if desired.
set LOGFILE=\"Mcad14_install_log.txt\"

REM --------------------------------------------------------------------------------



REM NOTE TO USER - DO NOT MAKE ANY CHANGES BELOW
REM ---------------------------------------------------------------------------
REM This section converts the variables defined above into a command-line
REM instruction. Editing this section may cause the installation to fail.	    

echo.
echo Running silent install of Mathcad 14 with the following parameters:
echo PRODUCT_CODE: 	     %PRODUCT_CODE% 
echo INSTALLDIR:    	 %INSTALLDIR% 
echo LICENSEPATH: 	 %LICENSEPATH%  
echo HBKLOCATION: 	     %HBKLOCATION% 
echo QUICKSHEETSTOC:     %QUICKSHEETSTOC% 
echo TUTORIALSTOC:       %TUTORIALSTOC% 
echo REFERENCETABLESTOC: %REFERENCETABLESTOC% 
echo MYSITEDESTINATION:  %MYSITEDESTINATION% 
echo HOMEPAGE:           %HOMEPAGE% 
echo. 

Setup.exe /s /v" /L* %LOGFILE% /qn SILENTINSTALL=\"TRUE\" PRODUCTTYPE=\"ENT\" ALLUSERS=1 PRODUCT_CODE=%PRODUCT_CODE% INSTALLDIR=%INSTALLDIR% LICENSEPATH=%LICENSEPATH%  DEFAULTFILEFORMAT=%DEFAULTFILEFORMAT% HBKLOCATION=%HBKLOCATION% QUICKSHEETSTOC=%QUICKSHEETSTOC% TUTORIALSTOC=%TUTORIALSTOC% REFERENCETABLESTOC=%REFERENCETABLESTOC% MYSITEDESTINATION=%MYSITEDESTINATION% HOMEPAGE=%HOMEPAGE% "

