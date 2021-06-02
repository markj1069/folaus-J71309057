#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

tst_plan 4

OUTFILE=$( mktemp /tmp/XXXXXXXX )
TMPFILE=$( mktemp /tmp/XXXXXXXX )

./olf_isnt_t.exe 0 0 "Does isnt work with zeros?" >$OUTFILE
MSG="not ok - 1 Does isnt work with zeros?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "isnt with zeros works."

./olf_isnt_t.exe -10 0 "Does isnt work with mixed numbers?" >$OUTFILE
MSG="ok - 1 Does isnt work with mixed numbers?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "isnt with mixed numbers works."

./olf_isnt_t.exe 0 1 "Does isnt know the difference betweeen 0 and 1?" >$OUTFILE
MSG="ok - 1 Does isnt know the difference betweeen 0 and 1?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "isnt with non equal numbers works."

./olf_isnt_t.exe -1 -1 "Does isnt work with netative ones?" >$OUTFILE
MSG="not ok - 1 Does isnt work with netative ones?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "isnt with negative numbers works."

rm --force $OUTFILE $TMPFILE
