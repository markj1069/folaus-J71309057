! olf_bail_out_t

program olf_bail_out_t
use olflib
implicit none

    character(256) :: reason

    call olf_begin('Olaus Fortran Utilities', 'olf_bail_out_t', "OLF")

    call get_command_argument( 1, reason )

    call olf_bail_out( reason )

end program olf_bail_out_t
