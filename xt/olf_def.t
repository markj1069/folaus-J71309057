#!  /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

tst_plan 1

./olf_def_t.exe                      # Run the olsdef test program.
RC=$?                                # Capture the return(exit) code.

is $RC 64 "olf_def_t.exe is expected to exit with a return code of 64."
