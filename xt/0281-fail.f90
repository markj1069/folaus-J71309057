! 0281-fail.f90

program fail_0281
use olaus
implicit none

    character(256) :: tst_name

    call olsbegin('Olaus Fortran Utilities', '0261-fail.f90', "OLS")

    call get_command_argument( 1, tst_name )

    call fail( tst_name )

    call olsend

end program fail_0281
