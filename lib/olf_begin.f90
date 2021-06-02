    ! Start a Fortran command
    subroutine olf_begin( sys, comp, pgm )
    implicit none

        character(*), intent(in)  :: sys    ! System Identification 
        character(*), intent(in)  :: comp   ! Component Identification
        character(*), intent(in)  :: pgm    ! Program Identification

            SYSID  = sys   ! Save arguments
            COMPID = comp  !   in olaus
            PGMID  = pgm   !   private storage.

    end subroutine olf_begin
