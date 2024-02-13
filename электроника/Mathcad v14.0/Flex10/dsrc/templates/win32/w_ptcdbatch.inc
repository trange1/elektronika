//
// File: w_ptcdbatch.inc
//
// 22-Nov-02 J-03-38  ALG  $$1   SPR 971401: Created from w_ptcdbatch.tpl
//
#include:head.inc

#includeenv:DCAD_TEMP:dcadtemp.env
set NMSD_PATH=%PRO_DIRECTORY%\%MC%\nms\nmsd.exe
#includeenv:PROE_START:proe_start.env

set DB_CLIENT_DIRECTORY=%PRO_DIRECTORY%
set DBC_TEXT_RESOURCE=%PRO_DIRECTORY%\text\resource
set DBC_UITOOLS_RESOURCE=%PRO_DIRECTORY%\proe\uitools\text\resource

#includeenv:LM_LICENSE_FILE:lmlic.env

set PRO_COMM_MSG_EXE=%PRO_DIRECTORY%\%MC%\obj\pro_comm_msg.exe

#include:ptc_startup.inc
