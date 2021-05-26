#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 1

xt/0281-fail.exe "Fail this test." >$OUTFILE
MSG="not ok - 1 Fail this test."
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "Fail does fail this test."

rm --force $OUTFILE
