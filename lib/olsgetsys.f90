    ! Recall three system identifiers
    subroutine olsgetsys( sys, comp, pgm )
      implicit none
  
          character(len=*), intent(out) :: sys   ! System Identification
          character(len=*), intent(out) :: comp  ! Component Identification
          character(3),     intent(out) :: pgm   ! Program Identification
  
              sys    = SYSID
              comp   = COMPID
              pgm    = PGMID
  
    end subroutine olsgetsys
