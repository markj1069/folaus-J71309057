#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 1

./olf_begin_t.exe 'Fortran Olaus' 'olf_begin_t.' 'OLF' >$OUTFILE
RC=$?

is "$RC" "$EX_OK" "olf_begin should not be a problem."

rm --force $OUTFILE
