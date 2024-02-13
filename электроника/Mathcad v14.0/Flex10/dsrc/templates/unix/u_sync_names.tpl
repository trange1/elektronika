// 06-Sep-01 $$1 TWH Created from distribute_object
// 19-Sep-01 $$2 TWH Add hp
// 25-Sep-01 $$3 TWH Fix typo #2
// 12-Nov-01 $$4 TWH Set ORA_NLS33 to ORACLE817
// 01-Apr-02 $$5 TWH apply final_arg code per Lijun Wang 930237
// 05-Mar-03 K-01-02 ALG  $$6   SPR 1003705: Exit status
// 24-Apr-03 K-01-06 TWH  $$7   Force 32 platform type
// 12-May-04 K-03-02 TWH  $$8   replace ORA_NLS33 w/ ORACLE_HOME
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

#include:ora8_shlib.inc

setenv PDM_ORA_APPL intralink
setenv PDM_ORACLE_SERVER intralink
setenv TNS_ADMIN $prodir
setenv ORACLE_HOME $prodir/$mc/obj/ORACLE920

setenv PRO_COMM_MSG_EXE $prodir/$mc/obj/pro_comm_msg

set n = 1 
set final_arg = "" 

while($n <= $#argv) 
    set final_arg = ($final_arg \"$argv[$n]\") 
    @ n = ($n + 1) 
end

if ($mc == sun4_solaris || $mc =~ hp*) then
  eval $prodir/$mc/obj/sync_names $final_arg
  exit $status
else
  echo "The executable sync_names is supported only for SUN, HP and NT platforms"
  exit 1
endif
