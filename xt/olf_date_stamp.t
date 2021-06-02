#! /usr/bin/env bash

. ../lib/OLSLIB                      # Include Olaus Bash Library
. ../lib/OLSTST                      # Include Olaus Bash Test Library

tst_plan 3

OUTFILE=$(mktemp)

./olf_date_stamp_t.exe >$OUTFILE

LINES=$( cat $OUTFILE | wc --lines )
WORDS=$( cat $OUTFILE | wc --words )
CHARS=$( cat $OUTFILE | wc --chars )

is $LINES 1 "olf_date_stamp_t should produce 1 line"
is $WORDS 1 "olf_date_stamp_t should produce 1 word"
is $CHARS 11 "olf_date_stamp_t should produce 11 characters. 10 + LF"

rm --force $OUTFILE
