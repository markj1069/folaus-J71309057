! olf_time_stamp_t

program olf_time_stamp_t
use      olflib
implicit none

character( 256 ) :: ts

call olf_time_stamp( ts )


write( STDOUT, '(a)' ) trim( ts )

end program olf_time_stamp_t    
