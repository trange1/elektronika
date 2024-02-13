// 25-Oct-00 $$1  JJE   Created.
// 19-Mar-01 $$2  TWH  Change for ilinkdir.env
// 22-Nov-02 J-03-38 $$3  TWH  Fix #2 
// 24-Feb-05 K-03-21 $$4  JJE  Add :q
// 31-May-05 K-03-25 $$5  TWH  Add PDM_LDB_PATH
#include:head.inc

if (! $?PDM_LDB_PATH) then
  if ( $?HOME ) then
    setenv PDM_LDB_PATH $HOME
  endif
endif

#include:shlib.inc

#includeenv:ALWAYS_TRUE:ilinkdir.env

setenv BROWSER __WEBBROWSER__

# ptc-cmdtype: rsd

#includeenv:LM_LICENSE_FILE:lmlic.env
setenv RSDESIGNER_FEATURE_NAME "__RSDESIGNER_FEATURE_NAME__"

$prodir/$mc/rsdesigner/bin/uiengine $*:q
