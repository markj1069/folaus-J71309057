
!   What is the current return code.
    subroutine getrc( rc )
    implicit none

        integer, intent(out) :: rc

        rc = RC_CODE

    end subroutine getrc
