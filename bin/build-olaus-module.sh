#! /usr/bin/env bash

. lib/OLSLIB
. lib/filexsf.sh

function add {
    echo "!-h- $1" >>lib/olaus.f90 # Add the header
    cat "lib/$1"   >>lib/olaus.f90 # Add the procedure
    echo "!-e- $1" >>lib/olaus.f90 # Add the trailer
}

rm -f lib/olaus.f90

cat >lib/olaus.f90 <<"/*"          # Add the module header info.
!====================Olaus Fortran Utility Routines=====================
module olaus
    use ISO_FORTRAN_ENV
    implicit none

/*

add olsdef.f90

cat >>lib/olaus.f90 <<'/*'         # Separate definations from procedures

contains

/*

add bail_out.f90
add diag.f90
add errmsg.f90
add fail.f90
add getrc.f90
add olsgetsys.f90
add is.f90
add isnot.f90
add ok.f90
add olsbegin.f90
add olsbldmsg.f90
add olsend.f90
add olsinput.f90
add olslog.f90
add olsusage.f90
add olsversion.f90
add olswrite.f90
add pass.f90
add setrc.f90
add tst_plan.f90
add date_stamp.f90
add skip.f90
add time_stamp.f90
add todo.f90

cat >>lib/olaus.f90 <<'/*'         # Terminate Olaus Module

end module olaus
/*
