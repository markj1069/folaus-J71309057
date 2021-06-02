! olf_pass_t

program olf_pass_t
use olflib
implicit none

    character(256) :: tst_name

    call olf_begin('Olaus Fortran Utilities', '0261-pass.f90', "OLS")

    call get_command_argument( 1, tst_name )

    call olf_pass( tst_name )

    call olf_end

end program olf_pass_t
