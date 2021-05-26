! Build an error message with error number, return code and message.
subroutine olsbldmsg( err_msg, err_no, rc, msg )
implicit none

    ! Arguments
    character(*), intent(out)    :: err_msg
    integer, intent(in)          :: err_no  ! This is the error number for this message.
    integer, intent(in)          :: rc      ! Set return code for this message.
    character(len=*), intent(in) :: msg     ! This is the error message

    ! Local Variables
    character(len=1)             :: sev     ! Severity of message.
    character(len=10)            :: c_err_no ! Character form of err_no
    integer                      :: rcc     ! internal return code
        
    if( rc < RC_OK .or. RC_TESTBAIL < rc) then
        rcc = RC_FATAL               ! If rc is outside of the system range
    else                             ! set return code to fatal.
        rcc = rc   
    end if
       
    ! Set the severity code

    select case ( rcc )
    case( RC_OK )                ! Information Message
        sev = "I"
    case( RC_WARNING )           ! Warning
        sev = "W"
    case( RC_ERROR )             ! Error
        sev = "E"
    case( RC_SEVERE )            ! Severe Error
        sev = "S"
    case default                 ! Fatal Error
        sev = "F"
    end select

    write( c_err_no, '(i10)' ) err_no  ! Convert irr_no into characters

    err_msg = PGMID // trim(adjustl(c_err_no)) // sev // ' ' // trim(msg)

    call setrc( rcc )

end subroutine olsbldmsg
