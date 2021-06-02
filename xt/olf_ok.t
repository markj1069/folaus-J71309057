#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 2

./olf_ok_t.exe T "Does ok work with a T for true?" >$OUTFILE
MSG="ok - 1 Does ok work with a T for true?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "ok works with T for true."


./olf_ok_t.exe F "Does ok work with F for false?" >$OUTFILE
MSG="not ok - 1 Does ok work with F for false?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "ok works with F for false."

rm --force $OUTFILE
