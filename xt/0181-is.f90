! 0181-is.f90

program is_0181
use olaus
implicit none

    character(256) :: c_got
    character(256) :: c_expected
    integer        :: got
    integer        :: expected
    character(256) :: tst_name

    call olsbegin( 'Olaus Fortran Utilities', '0181-is.f90', "OLS" )

    call get_command_argument( 1, c_got )
    call get_command_argument( 2, c_expected)
    call get_command_argument( 3, tst_name )

    read( c_got,      * ) got        ! Convert from character to integer.
    read( c_expected, * ) expected   ! Do it a second time.

    call is( got, expected, tst_name )

    call olsend

end program is_0181