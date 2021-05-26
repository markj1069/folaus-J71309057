#! /usr/bin/env bash

. lib/OLSLIB
. lib/OLSTST

tst_plan 16

TMPFILE=$(mktemp /tmp/errmsg.XXXXXXXX)


xt/0141-errmsg.exe 7000 $EX_OK "Return Code set to EX_OK" 2>$TMPFILE
RC=$?
is $RC $EX_OK "Return Code set to EX_OK. line: $LINENO"
MSG="OLS7000I Return Code set to EX_OK"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7004 $EX_WARNING "Return Code set to EX_WARNING" 2>$TMPFILE
RC=$?
is $RC $EX_WARNING "Return Code set to EX_WARNING. line: $LINENO"
MSG="OLS7004W Return Code set to EX_WARNING"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7008 $EX_ERROR "Return Code set to EX_ERROR" 2>$TMPFILE
RC=$?
is $RC $EX_ERROR "Return Code set to EX_ERROR. line: $LINENO"
MSG="OLS7008E Return Code set to EX_ERROR"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7012 $EX_SEVERE "Return Code set to EX_SEVERE" 2>$TMPFILE
RC=$?
is $RC $EX_SEVERE "Return Code set to EX_SEVERE. line: $LINENO"
MSG="OLS7012S Return Code set to EX_SEVERE"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7016 $EX_FATAL "Return Code set to EX_FATAL" 2>$TMPFILE
RC=$?
is $RC $EX_FATAL "Return Code set to EX_FATAL. line: $LINENO"
MSG="OLS7016F Return Code set to EX_FATAL"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7076 $EX_PROTOCOL "Return Code set to EX_PROTOCOL" 2>$TMPFILE
RC=$?
is $RC $EX_PROTOCOL "Return Code set to EX_PROTOCOL. line: $LINENO"
MSG="OLS7076F Return Code set to EX_PROTOCOL"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7064 999 "Return Code set to EX_USAGE" 2>$TMPFILE
RC=$?
is $RC $EX_FATAL "Return Code set to EX_FATAL. line: $LINENO"
MSG="OLS7064F Return Code set to EX_USAGE"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

xt/0141-errmsg.exe 7064 -1 "Return Code set to EX_FATAL" 2>$TMPFILE
RC=$?
is $RC $EX_FATAL "Return Code set to EX_FATAL. line: $LINENO"
MSG="OLS7064F Return Code set to EX_FATAL"
TMP=$(cat $TMPFILE)
is "$MSG" "$TMP" "Did we get the expected error message? line: $LINENO" 

rm --force $TMPFILE
