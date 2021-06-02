! olf_begin_t

program olf_usage_t
use olflib
implicit none

    character(256) :: system,    sys
    character(256) :: component, comp
    character(  3) :: program,   pgm

    call get_command_argument( 1, system )
    call get_command_argument( 2, component )
    call get_command_argument( 3, program )

    call olf_begin( system, component, program )

    call olf_todo( "Add developer test for ols_usage.")

    call olf_end

end program olf_usage_t
