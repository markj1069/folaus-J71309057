#! /usr/bin/env bash

. lib/OLSLIB
. lib/filexsf.sh

XF=$( filexsf  "$1" )
FP=$( filepath "$1" )

gfortran -c "$XF.f90" -o "$XF.o" -J "$FP"
