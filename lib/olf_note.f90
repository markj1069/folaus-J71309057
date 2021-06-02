!   Write a test diagnostic message to STDERR.
    subroutine olf_note( message )
    implicit none

        character(*), intent(in) :: message

        write( STDOUT, '(2a)' ) '# ', trim( message )

    end subroutine olf_note
