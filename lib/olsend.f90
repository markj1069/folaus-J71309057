!   Exit this Fortran Program while setting the Return Code
subroutine olsend
implicit none

   integer :: rcc

!  Set the return code.
   call getrc( rcc )
   call exit( rcc )

end subroutine olsend
