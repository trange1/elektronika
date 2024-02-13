// 09-Aug-01 $$1  TWH  Created.
// 25-Sep-03 $$2  K-01-16  TWH  mc fallback
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
#include:shlib.inc

$prodir/$mc/obj/ldbcompact $*
