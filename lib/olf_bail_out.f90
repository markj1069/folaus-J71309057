!        1         2         3         4         5         6         7         8
! 3456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789

! Bail Out of test
subroutine olf_bail_out( reason )
implicit none

! Argument
character(*), intent(in) :: reason

! write( *, '(2a)' ) 'Bail out! ', trim(diagnostic_message)
call olf_err_msg( OLFPGMID,    7000, &
                  RC_TESTBAIL, 'Bail out! ' // trim( reason ) )

! call olf_set_rc( RC_TESTBAIL )  ! Set the Bail Out Fatal Return Code
! call olf_end                    ! Exit program setting the Return Code
    
end subroutine olf_bail_out
