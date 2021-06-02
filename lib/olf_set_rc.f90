!   Set system return code
    subroutine olf_set_rc( rc )
    implicit none

      ! Argument
        integer, intent(in)  :: rc

      ! Remember this return code if it is greater then RC_CODE.
        if( rc > RC_CODE ) then
            RC_CODE = rc
        end if

    end subroutine olf_set_rc
