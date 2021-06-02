!   Exit this Fortran Program while setting the Return Code
subroutine olf_end
implicit none

   integer :: rcc

!  Set the return code.
   call olf_get_rc( rcc )
   call exit( rcc )

end subroutine olf_end
