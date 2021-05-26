! olsversion - Write system name, component, license and copywrite to STDOUT
subroutine olsversion( sys, comp, pgm )
implicit none

    character(*), intent(in)  :: sys   ! System Identification 
    character(*), intent(in)  :: comp  ! Component Identification
    character(3), intent(in)  :: pgm   ! Program Identification

!    call olsbldmsg( sys_msg, err_no, RC_OK, msg ) ! Build a system message from it constituent parts.

!    SYSID  = system
!    COMPID = component
!    PGMID  = pgm

!    sys, comp, version, date
!    copywrite
!    license

!    write( STDOUT, ) PGMID,

end subroutine olsversion
