! olf_diag_t.f90

program olf_diag_t
use olflib
implicit none

    character(256) :: tst_name

    call olf_begin( 'Olaus Fortran Utilities', 'olf_diag_t', "OLF" )

    call get_command_argument( 1, tst_name )

    call olf_diag( tst_name )

    call olf_end

end program olf_diag_t
