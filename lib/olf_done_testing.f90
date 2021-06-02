! Set number of tests.
subroutine olf_done_testing( no_tsts )
implicit none

! Arguments
    integer, intent(in) :: no_tsts  ! Number of tests

! Variables
    character(10)       :: ctsts    ! Character form of number of tests

    ! Left justify plan_tests so that the output looks like "1..27".
    write( ctsts, '(i10)' ) TST_COUNT
    write( STDOUT, '(2a)' ) "1..",trim(adjustl(ctsts))

end subroutine olf_done_testing
