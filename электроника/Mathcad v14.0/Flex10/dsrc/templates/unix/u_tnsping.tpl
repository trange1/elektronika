// 27-Mar-97 $$1  Pete  Created.
// 04-Jan-01 $$2  TWH   Add ora8_shlib
// 09-Jul-03 $$3  K-01-10  TWH  Add ORACLE_HOME
// 25-Sep-03               TWH  add TNS_ADMIN
// 25-Sep-03 $$4  K-01-16  TWH  mc fallback
// 12-May-03 $$5  K-03-02  TWH  Chg ORACLE_HOME
#include:head.inc
if ( $mc == "hpux_pa64" ) then
  set mc="hpux11_pa32"
endif
if ( $mc == "sun4_solaris_64" )then
  set mc="sun4_solaris"
endif
if ( $mc == "sgi_elf4" ) then
  set mc="sgi_mips4"
endif
#include:ora8_shlib.inc
setenv ORACLE_HOME $prodir/$mc/obj/ORACLE920
setenv TNS_ADMIN $prodir
exec $prodir/$mc/obj/tnsping $*

