#! /usr/bin/env bash

. ../lib/OLSLIB
. ../lib/OLSTST

lst=$(./olf_set_rc_t.exe)
RC=$?                        # Capture return code from setex.exe

tst_plan 1
is $RC 8 "Return code from 0121-setrc.exe should 8. line: RC=$RC $LINENO"
