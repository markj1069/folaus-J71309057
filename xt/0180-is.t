#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

tst_plan 4

OUTFILE=$( mktemp /tmp/XXXXXXXX )

xt/0181-is.exe 0 0 "Does is work with zeros?" >$OUTFILE
MSG="ok - 1 Does is work with zeros?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "is with zeros works."

xt/0181-is.exe -10 0 "Does is work with mixed numbers?" >$OUTFILE
MSG="not ok - 1 Does is work with mixed numbers?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "is with mixed numbers works."

xt/0181-is.exe 0 1 "Does is know the difference betweeen 0 and 1?" >$OUTFILE
MSG="not ok - 1 Does is know the difference betweeen 0 and 1?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "is with non equal numbers works."

xt/0181-is.exe -1 -1 "Does is work with netative ones?" >$OUTFILE
MSG="ok - 1 Does is work with netative ones?"
FILE=$( cat $OUTFILE )
is "$MSG" "$FILE" "is with negative numbers works."
