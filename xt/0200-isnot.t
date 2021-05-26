#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

tst_plan 4

OUTFILE=$( mktemp /tmp/XXXXXXXX )
TMPFILE=$( mktemp /tmp/XXXXXXXX )

xt/0201-isnot.exe 0 0 "Does isnot work with zeros?" >$OUTFILE
MSG="not ok 1 - isnot with zeros works."
FILE=$( cat $OUTFILE )
isnot "$MSG" "$FILE" "isnot with zeros works."

xt/0201-isnot.exe -10 0 "Does isnot work with mixed numbers?" >$OUTFILE
MSG="not ok 2 - isnot with mixed numbers works."
FILE=$( cat $OUTFILE )
isnot "$MSG" "$FILE" "isnot with mixed numbers works."

xt/0201-isnot.exe 0 1 "Does isnot know the difference betweeen 0 and 1?" >$OUTFILE
MSG="not ok 3 - isnot with non equal numbers works."
FILE=$( cat $OUTFILE )
isnot "$MSG" "$FILE" "isnot with non equal numbers works."

xt/0201-isnot.exe -1 -1 "Does isnot work with netative ones?" >$OUTFILE
MSG="not ok 4 - isnot with negative numbers works."
FILE=$( cat $OUTFILE )
isnot "$MSG" "$FILE" "isnot with negative numbers works."

rm --force $OUTFILE $TMPFILE
