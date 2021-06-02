! olf_fail_t

program olf_fail_t
use olflib
implicit none

    character(256) :: tst_name

    call olf_begin('Olaus Fortran Utilities', 'olf_fail_t', "OLF")

    call get_command_argument( 1, tst_name )

    call olf_fail( tst_name )

    call olf_end

end program olf_fail_t
