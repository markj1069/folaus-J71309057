!   Write error message to SYSERR
    subroutine olf_err_msg( prefix, err_no, rc, msg )
    implicit none

        ! Arguments

        character(*), intent(in)  :: prefix   ! Prefix for error message.
        integer,      intent(in)  :: err_no   ! This is the error number for this message.
        integer,      intent(in)  :: rc       ! Set return code for this message.
        character(*), intent(in)  :: msg      ! This is the error message

        ! Local Variables
        integer                   :: rcc      ! What is the current return code.
        character(256)            :: err_msg  ! Constructed 
        
        call olf_bld_msg( err_msg, prefix, err_no, rc, msg )
        write( STDERR, '(a)' ) err_msg

        call olf_get_rc( rcc )       ! Get the current return code.
        if( rcc >= RC_FATAL ) then   ! If the return code if fatal
            call olf_end             ! end the command.
        end if

    end subroutine olf_err_msg
