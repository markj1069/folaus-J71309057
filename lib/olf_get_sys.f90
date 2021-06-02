    ! Recall three system identifiers
    subroutine olf_get_sys( sys, comp, pgm )
      implicit none
  
          character(*), intent(out) :: sys   ! System Identification
          character(*), intent(out) :: comp  ! Component Identification
          character(*), intent(out) :: pgm   ! Program Identification
  
              sys    = SYSID
              comp   = COMPID
              pgm    = PGMID
  
    end subroutine olf_get_sys
