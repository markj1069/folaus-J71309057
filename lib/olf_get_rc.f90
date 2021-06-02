
!   What is the current return code.
    subroutine olf_get_rc( rc )
    implicit none

        integer, intent(out) :: rc

        rc = RC_CODE

    end subroutine olf_get_rc
