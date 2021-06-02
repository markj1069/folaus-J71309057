! olf_date_stamp_t

program olf_date_stamp_t
use      olflib
implicit none

character( 256 ) :: ds

call olf_date_stamp( ds )


write( STDOUT, '(a)' ) trim(ds)

end program olf_date_stamp_t    
