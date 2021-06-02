#! /usr/bin/env bash

. lib/OLSLIB
. lib/filexsf.sh

function add {
    echo "!-h- $1" >>lib/olflib.f90 # Add the header
    cat "lib/$1"   >>lib/olflib.f90 # Add the procedure
    echo "!-e- $1" >>lib/olflib.f90 # Add the trailer
}

rm -f lib/olflib.f90

cat >lib/olflib.f90 <<"/*"          # Add the module header info.
!====================Olaus Fortran Utility Routines=====================
module olflib
    use ISO_FORTRAN_ENV
    implicit none

/*

add olf_def.f90

cat >>lib/olflib.f90 <<'/*'         # Separate definations from procedures

contains

/*

add olf_bail_out.f90
add olf_begin.f90
add olf_bld_msg.f90
add olf_date_stamp.f90
add olf_debug.f90
add olf_diag.f90
add olf_done_testing.f90
add olf_end.f90
add olf_err_msg.f90
add olf_fail.f90
add olf_get_rc.f90
add olf_get_sys.f90
add olf_help.f90
add olf_input.f90
add olf_is.f90
add olf_isnt.f90
add olf_log.f90
add olf_man.f90
add olf_note.f90
add olf_ok.f90
add olf_pass.f90
add olf_setrc.f90
add olf_skip.f90
add olf_skip_all.f90
add olf_time_stamp.f90
add olf_todo.f90
add olf_tst_plan.f90
add olf_usage.f90
add olf_version.f90
add olf_write.f90

cat >>lib/olflib.f90 <<'/*'         # Terminate Olaus Module

end module olflib
/*
