!   Fail this test.
    subroutine fail( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    character(len=10) :: ctsts

    TST_COUNT = TST_COUNT + 1

    write( ctsts, '(i10)' ) TST_COUNT

    write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)

    end subroutine fail
