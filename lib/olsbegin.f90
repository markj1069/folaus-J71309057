    ! Start a Fortran command
    subroutine olsbegin( sys, comp, pgm )
    implicit none

        character(*), intent(in)  :: sys    ! System Identification 
        character(*), intent(in)  :: comp   ! Component Identification
        character(3), intent(in)  :: pgm    ! Program Identification

            SYSID  = sys   ! Save arguments
            COMPID = comp  !   in olaus
            PGMID  = pgm   !   private storage.

    end subroutine olsbegin
