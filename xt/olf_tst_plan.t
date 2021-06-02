#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

tst_plan 12

OUTFILE=$( mktemp /tmp/XXXXXXXX )
ERRFILE=$( mktemp /tmp/XXXXXXXX )

./olf_tst_plan_t.exe 1 >$OUTFILE 2>$ERRFILE
RC=$?
is $RC $EX_OK "tst_plan 1 should exit with a Return Code of EX_OK."
PLAN="1..1"
FILE=$( cat $OUTFILE )
is $PLAN $FILE "tst_plan 1 should output '1..1' to STDOUT."
ERRCNT=$( cat $ERRFILE | wc --bytes )
is $ERRCNT 0 "tst_plan 1 should not write to STDERR."

./olf_tst_plan_t.exe 10 >$OUTFILE 2>$ERRFILE
RC=$?
is $RC $EX_OK "tst_plan 10 should exit with a Return Code of EX_OK."
PLAN="1..10"
FILE=$( cat $OUTFILE )
is $PLAN $FILE "tst_plan 10 should output '1..10' to STDOUT."
ERRCNT=$( cat $ERRFILE | wc --bytes )
is $ERRCNT 0 "tst_plan 10 should not write to STDERR."

./olf_tst_plan_t.exe 0 >$OUTFILE 2>$ERRFILE
RC=$?
is $RC $EX_SOFTWARE "tst_plan 0 should exit with a Return Code of EX_SOFTWARE."
OUTCNT=$( cat $OUTFILE | wc --bytes )
is $OUTCNT 0 "tst_plan 0 should not write to STDOUT."
FILE=$( cat $ERRFILE )
MSG="OLF7002F Number of plan tests less than one. Fatal Error."
is "$MSG" "$FILE" "tst_plan 0 should output an error message to STDERR."

./olf_tst_plan_t.exe -1 >$OUTFILE 2>$ERRFILE
RC=$?
is $RC $EX_SOFTWARE "tst_plan -1 should exit with a Return Code of EX_SOFTWARE."
OUTCNT=$( cat $OUTFILE | wc --bytes )
is $OUTCNT 0 "tst_plan -1 should not write to STDOUT."
MSG="OLF7002F Number of plan tests less than one. Fatal Error."
is "$MSG" "$FILE" "tst_plan -1 should output an error message to STDERR."

rm --force $OUTFILE $ERRFILE

