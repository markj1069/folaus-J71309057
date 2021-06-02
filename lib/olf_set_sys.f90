! Set three system identifiers

!        1         2         3         4         5         6         7         8
! 3456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789

subroutine olf_set_sys( sys, comp, pgm )
implicit none

! Arguments
character(*), intent(out) :: sys   ! System Identification
character(*), intent(out) :: comp  ! Component Identification
character(*), intent(out) :: pgm   ! Program Identification

! Variables

SYSID  = sys   ! Save arguments
COMPID = comp  !   in Olaus
PGMID  = pgm   !   private storage.

end subroutine olf_set_sys
