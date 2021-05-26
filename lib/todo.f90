!   todo.f90
    subroutine todo( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    call fail( "# TODO " // tst_name )

    end subroutine todo
