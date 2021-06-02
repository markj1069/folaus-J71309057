!   Write a test diagnostic message
    subroutine olf_diag( diagnostic_message )
        implicit none

        ! Argument
        character(*), intent(in) :: diagnostic_message

        write( STDERR, '(2a)' ) '# ', trim(diagnostic_message)

    end subroutine olf_diag
