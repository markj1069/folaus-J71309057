#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 1

./olf_fail_t.exe "Fail this test." >$OUTFILE
MSG="not ok - 1 Fail this test."
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "Fail does fail this test."

rm --force $OUTFILE
