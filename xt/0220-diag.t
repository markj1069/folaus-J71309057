#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 1

xt/0221-diag.exe "Does diag write a diagnostic record?" >$OUTFILE
MSG="# Does diag write a diagnostic record?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "diag does write a diagnostic record."

rm --force $OUTFILE
