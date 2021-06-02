!   Set number of tests.
    subroutine olf_tst_plan( no_tests )
    implicit none

    ! Arguments
        integer, intent(in) :: no_tests  ! Number of tests

        character(10)       :: ctests    ! Character form of number of tests

        if( no_tests < 1 ) then
            call olf_err_msg( OLFPGMID, 7002, RC_SOFTWARE, "Number of plan tests less than one. Fatal Error." )
        else
            ! Left justify plan_tests so that the output looks like "1..27".
            write( ctests, '(i10)' ) no_tests
            write(  *, '(a,a)' ) "1..",trim(adjustl(ctests))
        end if

    end subroutine olf_tst_plan
