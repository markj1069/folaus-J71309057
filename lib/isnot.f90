!   compare integers
    subroutine isnot( got, expected, test_name )

        implicit none

      ! Arguments
        integer, intent(in)          :: got
        integer, intent(in)          :: expected
        character(len=*), intent(in) :: test_name

        character(len=10) :: ctests

        TST_COUNT = TST_COUNT + 1

        write( ctests, '(i10)' ) TST_COUNT

        if( got /= expected ) then
            write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctests)), " ", trim(test_name)
        else
            write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctests)), " ", trim(test_name)
        end if

    end subroutine isnot
