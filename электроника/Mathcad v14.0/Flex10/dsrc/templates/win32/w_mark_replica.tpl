// 04-Mar-02 $$1  TWH  Created
// 28-Apr-03 K-01-06 $$2 TWH Add exit
// 12-May-04 K-03-02 $$3 TWH Chg to ORACLE920
// 18-APR-05 K-03-23 $$4 MTP Use head_ilink
#include:head_ilink.inc

if "%MC%" == "i486_nt" goto mc_ok
echo ERROR This utility is only for Win2000
goto ptc_end
:mc_ok

set INTRALINK_DIR=%PRO_DIRECTORY%

set intralinkparams="$*"

set PTC_JRE=__PTC_JRE__
set JAVA_HOME=__PTC_JRE__

set path="%PTC_JRE%\bin;%PRO_DIRECTORY%\%mc%\lib;%PRO_DIRECTORY%\%mc%\obj;%path%"
set TNS_ADMIN=%prodir%
set ORACLE_HOME=%prodir%\%mc%\obj\ORACLE920
set path=%ORACLE_HOME%\bin;%path%

#include:ptc_startup.inc

"__JVM_CMD__" -jar %PRO_DIRECTORY%\java\lib\mrc.jar  %intralinkparams%

:ptc_end
exit /B %ERRORLEVEL%

