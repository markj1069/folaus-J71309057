#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 1

xt/0501-olsbegin.exe 'Fortran Olaus' '0500-olsbegin' 'OLS' >$OUTFILE
RC=$?

is "$RC" "$EX_OK" "olsbegin should not be a problem."

rm --force $OUTFILE
