// 06-Sep-01 $$1 TWH Created from distribute_object
// 20-Sep-01 $$2 TWH Fix ORACLE_HOME typo
// 12-Nov-01 $$3 TWH Set ORA_NLS33 to ORACLE817
// 28-Apr-03 K-01-06 $$4 TWH Add exit
// 12-May-04 K-03-02 $$5 TWH  Chg to ORACLE920; drop ORA_NLS33
// 18-APR-05 K-03-23 $$6 MTP Use head_ilink
// 29-Jul-05 K-03-30 $$7 TWH Drop win95
#include:head_ilink.inc

set PDM_ORA_APPL=intralink
set PDM_ORACLE_SERVER=intralink
set TNS_ADMIN=%prodir%
set ORACLE_HOME=%prodir%\%mc%\obj\ORACLE920
set PRO_COMM_MSG_EXE=%prodir%\%mc%\obj\pro_comm_msg

set path=%ORACLE_HOME%\bin;%path%

if "%mc%" == "i486_nt" "%prodir%\%mc%\obj\subscribe_package.exe" %* 
if NOT "%mc%" == "i486_nt" echo "The executable subscribe_package is supported only for SUN and NT platforms"

:ptc_end
exit /B %ERRORLEVEL%

