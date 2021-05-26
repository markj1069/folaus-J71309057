!   Write error message to SYSERR
    subroutine errmsg( err_no, rc, msg )
    implicit none

        ! Arguments
        integer, intent(in)          :: err_no  ! This is the error number for this message.
        integer, intent(in)          :: rc      ! Set return code for this message.
        character(len=*), intent(in) :: msg     ! This is the error message

        ! Local Variables
        character(265)               :: sys_msg
        character(len=1)             :: sev     ! Severity of message.
        character(len=10)            :: c_err_no ! Character form of err_no
        integer                      :: rcc     ! internal return code
        
 !       call olsbldmsg( )
        if( rc < RC_OK .or. RC_TESTBAIL < rc) then
            rcc = RC_FATAL
        else
            rcc = rc
        end if

        ! Left justify err_no.
        write( c_err_no, '(i10)' ) err_no
       
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
        write( STDERR, '(a,a,a,a,a)'  ) PGMID, trim(adjustl(c_err_no)), sev, ' ', trim(msg)

        call setrc( rcc )
        if( sev == 'F' ) then
            call olsend
        end if

    end subroutine errmsg
