!   Write a test diagnostic message
    subroutine diag( diagnostic_message )
        implicit none

        ! Argument
        character(len=*), intent(in) :: diagnostic_message

        write( *, '(a,a)' ) '# ', trim(diagnostic_message)

    end subroutine diag
