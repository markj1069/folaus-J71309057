! olf_bld_msg_t

program olf_bld_msg_t
use olflib
implicit none

    character(256) :: c_err_no
    character(256) :: c_rc
    character(256) :: msg

    integer :: err_no
    integer :: rc
    character(265) :: sys_msg
    character( 256 ) :: sys
    character( 256 ) :: comp
    character( 256 ) :: pgmid

    call olf_begin('Olaus Fortran Utilities', 'olf_bld_msg_t', "OLF")
    call olf_get_sys( sys, comp, pgmid )

    call get_command_argument( 1, c_err_no )
    call get_command_argument( 2, c_rc )
    call get_command_argument( 3, msg )

    read( c_err_no, * ) err_no  ! Convert c_err_no into integer
    read( c_rc    , * ) rc      ! Convert c_rc into integer

    call olf_bld_msg( sys_msg, trim(pgmid), err_no, rc, msg ) ! Build a system message from it constituent parts.

    write( *, '(a)' ) trim(sys_msg)

    call olf_end

end program olf_bld_msg_t
