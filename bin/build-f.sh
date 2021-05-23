#! /usr/bin/env bash

. lib/OLSLIB
. lib/filexsf.sh

FN="$1"
XF=$( filexsf  "$FN" )
FP=$( filepath "$FN" )
EX="$XF.exe"

gfortran -I "lib" -o "$EX" "$FN" lib/olaus.o
