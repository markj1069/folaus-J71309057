! 0221-diag.f90

program diag_0221
use olaus
implicit none

    character(256) :: tst_name

    call olsbegin( 'Olaus Fortran Utilities', '0221-diag.f90', "OLS" )

    call get_command_argument( 1, tst_name )

    call diag( tst_name )

    call olsend

end program diag_0221
