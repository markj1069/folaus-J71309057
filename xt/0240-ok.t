#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

OUTFILE=$( mktemp )

tst_plan 2

xt/0241-ok.exe T "Does ok work with a T for true?" >$OUTFILE
MSG="ok - 1 Does ok work with a T for true?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "ok works with T for true."


xt/0241-ok.exe F "Does ok work with F for false?" >$OUTFILE
MSG="not ok - 1 Does ok work with F for false?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "ok works with F for false."

rm --force $OUTFILE
