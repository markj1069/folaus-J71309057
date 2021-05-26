!   process time_stamp
    subroutine time_stamp( ts )
        implicit none
    ! Arguments
        character( 6 )                :: time  ! HHMMSS
        character( * ), intent( out ) :: ts    ! HH:MM:SS 

        call date_and_time( time=time )

        ts = time(1:2) // ":" // time(3:4) // ":" // time(5:6)

    end subroutine time_stamp
