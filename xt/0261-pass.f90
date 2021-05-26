! 0201-isnot.f90

program pass_0261
use olaus
implicit none

    character(256) :: tst_name

    call olsbegin('Olaus Fortran Utilities', '0261-pass.f90', "OLS")

    call get_command_argument( 1, tst_name )

    call pass( tst_name )

    call olsend

end program pass_0261
