#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

OUTFILE=$( mktemp )
ERRFILE=$( mktemp )

tst_plan 3

./olf_bail_out_t.exe "The test has failed so badly there is nothing left to do but quit." >$OUTFILE 2>$ERRFILE
RC=$?
is $RC $EX_TESTBAIL "olf_bail_out should set return code to EX_TESTBAIL."
MSG="OLF7000F Bail out! The test has failed so badly there is nothing left to do but quit."
FILE=$( cat $ERRFILE )
is "$MSG" "$FILE" "olf_bail_out does write an disgnostic error message."

LINES=$( cat $OUTFILE | wc --lines )
is $LINES 0 "olf_bail_out should not write to STDOUT."

rm --force $OUTFILE
