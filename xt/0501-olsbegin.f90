! 0501-olsbegin.f90

program olsbegin_0501
use olaus
implicit none

    character(256) :: system,    sys
    character(256) :: component, comp
    character(  3) :: program,   pgm

    call get_command_argument( 1, system )
    call get_command_argument( 2, component )
    call get_command_argument( 3, program )

    call olsbegin( system, component, program )

    call olsgetsys( sys, comp, pgm )

    call olsend

end program olsbegin_0501
