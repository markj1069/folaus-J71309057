!   process logical test
    subroutine olf_ok( tst, tst_name )
        implicit none


      ! Arguments
        logical, intent(in)          :: tst
        character(*), intent(in) :: tst_name

        character(10) :: ctsts

        TST_COUNT = TST_COUNT + 1

        write( ctsts, '(i10)' ) TST_COUNT

        if( tst ) then
            write( *, '(4a)' ) "ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)
        else
            write( *, '(4a)' ) "not ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)
        end if

    end subroutine olf_ok
