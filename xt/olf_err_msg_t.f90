! 0141-errtst.f90

program olf_err_msg_t
use olflib
implicit none

    integer          :: err_no
    character( 256 ) :: c_err_no
    integer          :: return_code
    character( 256 ) :: c_return_code
    character( 256 ) :: error_message
    character( 256 ) :: sys
    character( 256 ) :: comp
    character( 256 ) :: pgmid

    call get_command_argument( 1, c_err_no )
    call get_command_argument( 2, c_return_code )
    call get_command_argument( 3, error_message )

    read( c_err_no, * ) err_no              ! Convert from character to integer.
    read( c_return_code, * ) return_code    ! Do it a second time.

    call olf_begin('Olaus Fortran Utilities', 'olf_err_msg_t', "OLF")

    call olf_get_sys( sys, comp, pgmid )

    call olf_err_msg( trim(pgmid), err_no, return_code, trim(error_message) )

    call olf_end

end program olf_err_msg_t