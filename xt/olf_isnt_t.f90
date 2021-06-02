! olf_isnt_t.f90

program olf_isnt_t
use olflib
implicit none

    character(256) :: c_got
    character(256) :: c_expected
    integer        :: got
    integer        :: expected
    character(256) :: tst_name

    call olf_begin('Olaus Fortran Utilities', 'olf_isnot_t', "OLF")

    call get_command_argument( 1, c_got )
    call get_command_argument( 2, c_expected)
    call get_command_argument( 3, tst_name )

    read( c_got,      * ) got        ! Convert from character to integer.
    read( c_expected, * ) expected   ! Do it a second time.

    call olf_isnt( got, expected, tst_name )

    call olf_end

end program olf_isnt_t
