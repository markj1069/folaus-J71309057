!   skip this test.
    subroutine skip( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    character(len=10) :: ctsts

    TST_COUNT = TST_COUNT + 1

    write( ctsts, '(i10)' ) TST_COUNT

    call pass( "# SKIP " // tst_name)

    end subroutine skip
