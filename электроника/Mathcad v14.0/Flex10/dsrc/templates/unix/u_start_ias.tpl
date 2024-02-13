// 20-Nov-01  $$1  TWH  Created
// 28-Nov-01  $$2  TWH  Fix servers value
// 28-N0v-01  $$3  TWH  TNS_ADMIN $prodir/iaserver3.1 -> $prodir per kayo
// 19-Jul-04  K-03-06 $$4  TWH  Chg to ORACLE920
#include:head.inc

#include:shlib.inc
#include:ora8_shlib.inc

# ptc-cmdtype: iasadmin

setenv TNS_ADMIN $prodir
setenv PDM_ORACLE_SERVER intralink
setenv PDM_ORA_APPL intralink
setenv ORACLE_HOME $prodir/$mc/obj/ORACLE920
setenv ORA_NLS33 $prodir/$mc/obj/ORACLE920/ocommon/nls/admin/data

set ILSERVER="iaserver"
set CFG_FILE_NAME="${ILSERVER}.conf"

$prodir/$mc/obj/${ILSERVER} -c $prodir/$CFG_FILE_NAME -f $* &
