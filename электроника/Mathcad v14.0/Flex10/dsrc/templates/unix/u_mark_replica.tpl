// 04-Mar-02 ##1  TWH  Created
// 07-Mar-02 $$1  TWH  Add u_ora8_shlib.inc & ORACLE_HOME
// 28-May-02 $$2  TWH  Fix #1
// 16-Apr-03 K-01-06 $$3  TWH  64 bit fallback
// 02-Oct-03 K-01-16 $$4 TWH  rm PGL_DEBUG_GRAPHICS hack
// 25-Feb-04 K-01-26 $$5 TWH  java chg'd sgi arguments
// 12-May-04 K-03-02 $$6 TWH  Chg ORACLE_HOME value
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

set libset="$prodir/$mc/obj/ps_libset"
if ( ! -x $libset ) unset libset

setenv INTRALINK_DIR $prodir
setenv TNS_ADMIN $prodir
setenv ORACLE_HOME $prodir/$mc/obj/ORACLE920

set intralink_params = "$*"
setenv PTC_JRE __PTC_JRE__
setenv JAVA_HOME __PTC_JRE__

#include:ora8_shlib.inc
#include:jre_shlib.inc

if ($mc =~ sgi*) then
  if (! $?LD_LIBRARYN32_PATH ) then
    if ($?LD_LIBRARY64_PATH ) then
      setenv LD_LIBRARYN32_PATH ${LD_LIBRARY64_PATH}
    endif
  endif
  if ($?LD_LIBRARYN32_PATH) then
    if ($?LD_LIBRARY_PATH ) then
      setenv LD_LIBRARY_PATH ${LD_LIBRARYN32_PATH}:${LD_LIBRARY_PATH}
    else
      setenv LD_LIBRARY_PATH ${LD_LIBRARYN32_PATH}
    endif
  endif
endif

set native=""
set format=""

if ($mc == sgi_elf2) then
  set format="-32"
endif
if ($mc == sgi_mips4) then
  set format="-32"
  set native="-native"
endif

#include:ptc_startup.inc

__JVM_CMD__ $native $format -jar ${prodir}/java/lib/mrc.jar $intralink_params

