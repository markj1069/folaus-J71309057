! 0801-date_and_time.f90

program date_and_time
use      olaus
implicit none

character( 10 ) :: ds
character(  8 ) :: ts

call date_stamp( ds )
call time_stamp( ts )

write( STDOUT, '(a,a,a)' ) ds, " ", ts

end program date_and_time