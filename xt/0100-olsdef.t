#!  /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

tst_plan 1

xt/0101-olsdef.exe                   # Run the olsdef test program.
RC=$?                                # Capture the return(exit) code.

is $RC 64 "0101-olsdef.exe is expected to exit with a return code of 64."
