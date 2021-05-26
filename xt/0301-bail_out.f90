! 0301-bail_outf90

program bail_out_0301
use olaus
implicit none

    character(256) :: tst_name

    call olsbegin('Olaus Fortran', '0101-olsdef.f90', "OLS")

    call get_command_argument( 1, tst_name )

    call bail_out( tst_name )

end program bail_out_0301
