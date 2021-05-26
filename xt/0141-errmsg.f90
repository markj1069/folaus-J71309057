! 0141-errtst.f90

program errmsg_0141
use olaus
implicit none

    integer        :: err_no
    character(256) :: c_err_no
    integer        :: return_code
    character(256) :: c_return_code
    character(256) :: error_message

    call get_command_argument( 1, c_err_no )
    call get_command_argument( 2, c_return_code )
    call get_command_argument( 3, error_message )

    read( c_err_no, * ) err_no              ! Convert from character to integer.
    read( c_return_code, * ) return_code    ! Do it a second time.

    call olsbegin('Olaus Fortran Utilities', '0141-errmsg.f90', "OLS")

    call errmsg( err_no, return_code, error_message )

    call olsend

end program errmsg_0141