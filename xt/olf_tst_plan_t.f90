! tst_plan fortran driver

program olf_tst_plan_t
use olflib
implicit none

integer        :: no_args
integer        :: plan_tsts
character(256) :: arg

call olf_begin('Olaus Fortran Utilities', 'olf_tst_plan_t', "OLF")

call get_command_argument( 1, arg )
read( arg, * ) plan_tsts

call olf_tst_plan( plan_tsts )

call olf_end                      ! Set the proper return code and exit.

end program olf_tst_plan_t