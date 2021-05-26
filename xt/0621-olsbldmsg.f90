! 0621-olsbldmsg.f90

program olsbldmsg_0621
use olaus
implicit none

    character(256) :: c_err_no
    character(256) :: c_rc
    character(256) :: msg

    integer :: err_no
    integer :: rc
    character(265) :: sys_msg

    call olsbegin('Olaus Fortran Utilities', '0621-olsbldmsg', "OLS")

    call get_command_argument( 1, c_err_no )
    call get_command_argument( 2, c_rc )
    call get_command_argument( 3, msg )

    read( c_err_no, * ) err_no  ! Convert c_err_no into integer
    read( c_rc    , * ) rc      ! Convert c_rc into integer

    call olsbldmsg( sys_msg, err_no, rc, msg ) ! Build a system message from it constituent parts.

    write( *, '(a)' ) trim(sys_msg)

    call olsend

end program olsbldmsg_0621
