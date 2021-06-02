#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

OUTFILE=$( mktemp )
ERRFILE=$( mktemp )

tst_plan 2

./olf_diag_t.exe "Does olf_diag write a diagnostic record?" >OUTFILE 2>$ERRFILE
MSG="# Does olf_diag write a diagnostic record?"
FILE=$( cat $ERRFILE )
is "$MSG" "$FILE" "olf_diag does write a diagnostic record."
OUTCNT=$( cat $OUTFILE | wc --bytes )
is $OUTCNT 0 "olf_diag should not write to STDOUT."

rm --force $OUTFILE
