#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 1

./olf_pass_t.exe "Pass this test." >$OUTFILE
MSG="ok - 1 Pass this test."
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "Pass does pass this test."

rm --force $OUTFILE
