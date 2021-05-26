! tst_plan fortran driver

program tst_plan_0211
use olaus
implicit none

integer        :: no_args
integer        :: plan_tsts
character(256) :: arg

call olsbegin('Olaus Fortran Utilities', '0161-tst_plan.f90', "OLS")

call get_command_argument( 1, arg )
read( arg, * ) plan_tsts

call tst_plan( plan_tsts )

call olsend                      ! Set the proper return code and exit.

end program tst_plan_0211