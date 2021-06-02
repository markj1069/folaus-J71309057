!   Pass this test.
    subroutine olf_pass( tst_name )
    implicit none

    ! Argument
    character(*), intent(in) :: tst_name

    character(10) :: ctsts

    TST_COUNT = TST_COUNT + 1

    write( ctsts, '(i10)' ) TST_COUNT

    write( *, '(4a)' ) "ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)

    end subroutine olf_pass
