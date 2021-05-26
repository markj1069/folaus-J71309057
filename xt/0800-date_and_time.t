#! /usr/bin/env bash

. lib/OLSLIB                         # Include Olaus Bash Library
. lib/OLSTST                         # Include Olaus Bash Test Library

tst_plan 3

OUTFILE=$(mktemp)

xt/0801-date_and_time.exe >$OUTFILE



LINES=$( cat $OUTFILE | wc --lines )
WORDS=$( cat $OUTFILE | wc --words )
CHARS=$( cat $OUTFILE | wc --chars )

is $LINES 1 "0801 should produce 1 line"
is $WORDS 2 "0801 should produce 2 words"
is $CHARS 20 "0801 should produce 20 characters"

rm --force $OUTFILE
