! olf_ok_t.f90

program olf_ok_t
use olflib
implicit none

    character(256) :: ctst
    character(256) :: tst_name

    logical        :: ltst

    call olf_begin('Olaus Fortran Utilities', '0261-pass.f90', "OLS")

    call get_command_argument( 1, ctst )
    call get_command_argument( 2, tst_name )

    read( ctst, * ) ltst

    call olf_ok( ltst, tst_name )

    call olf_end

end program olf_ok_t
