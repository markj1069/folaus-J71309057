#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 2

xt/0301-bail_out.exe "The test has failed so bad there is nothing left to do but quit." >$OUTFILE
RC=$?
is $RC $EX_TESTBAIL "bail_out should set return code to EX_TESTBAIL."
MSG="Bail out! The test has failed so bad there is nothing left to do but quit."
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "bail_out does write an disgnostic error message."

rm --force $OUTFILE
