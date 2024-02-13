@echo off
REM By default, a silent-install log file called Mcad14_install_help_log.txt is created 
REM when installing help in the folder from which you run this script. Change the name 
REM of the log file and path here, if desired.
set HELPLOGFILE=\"Mcad14_install_help_log.txt\"
REM set HELP_INSTALL_DIR=\"C:\Program Files\Mathcad\Mathcad 14\doc\"
set HELP_INSTALL_DIR=\"\"

REM --------------------------------------------------------------------------------



REM NOTE TO USER - DO NOT MAKE ANY CHANGES BELOW
REM ---------------------------------------------------------------------------


help\Setup.exe /s /v" /L* %HELPLOGFILE% /qn HELP_INSTALL_DIR=%HELP_INSTALL_DIR% "
