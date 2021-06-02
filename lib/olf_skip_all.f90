!        1         2         3         4         5         6         7         8
! 3456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789

! olf_skip_all -- Skip all testing for this program and terminate

subroutine olf_skip_all( reason )
implicit none

character( * ), intent( in ) :: reason

call olf_tst_plan( 0 )               ! Set the test plan to zero.
write( STDOUT, '(a)' ) reason
call olf_set_rc( RC_OK )             ! Set the return code to zero.
call olf_end                         ! Terminate this program

end subroutine olf_skip_all
