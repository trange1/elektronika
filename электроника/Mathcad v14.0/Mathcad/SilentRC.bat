@echo off
REM By default, a silent-install log file called Mcad14_install_rc_log.txt is created 
REM when installing help in the folder from which you run this script. Change the name 
REM of the log file and path here, if desired.
set RCLOGFILE=\"Mcad14_install_rc_log.txt\"
REM set RC_INSTALL_DIR=\"C:\Program Files\Mathcad\Mathcad 14\"
set RC_INSTALL_DIR=\"\"

REM --------------------------------------------------------------------------------



REM NOTE TO USER - DO NOT MAKE ANY CHANGES BELOW
REM ---------------------------------------------------------------------------

echo RC_INSTALL_DIR: %RC_INSTALL_DIR%

rc\Setup.exe /s /v" /L* %RCLOGFILE% /qn RC_INSTALL_DIR=%RC_INSTALL_DIR% "
