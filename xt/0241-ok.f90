! 0241-ok.f90

program ok_0241
use olaus
implicit none

    character(256) :: ctst
    character(256) :: tst_name

    logical        :: ltst

    call olsbegin('Olaus Fortran Utilities', '0261-pass.f90', "OLS")

    call get_command_argument( 1, ctst )
    call get_command_argument( 2, tst_name )

    read( ctst, * ) ltst

    call ok( ltst, tst_name )

    call olsend

end program ok_0241
