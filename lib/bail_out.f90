! Bail Out of test
subroutine bail_out( diagnostic_message )
implicit none

! Argument
character(*), intent(in) :: diagnostic_message

write( *, '(a,a)' ) 'Bail out! ', trim(diagnostic_message)

call setrc( RC_TESTBAIL )            ! Set the Bail Out Fatal Return Code
call olsend                          ! Exit program setting the system Return Code
    
end subroutine bail_out
