!   process logical test
    subroutine ok( tst, tst_name )
        implicit none


      ! Arguments
        logical, intent(in)          :: tst
        character(len=*), intent(in) :: tst_name

        character(len=10) :: ctsts

        TST_COUNT = TST_COUNT + 1

        write( ctsts, '(i10)' ) TST_COUNT

        if( tst ) then
            write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)
        else
            write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)
        end if

    end subroutine ok
