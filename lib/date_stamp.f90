!   process date_stamp
    subroutine date_stamp( ds )
        implicit none
    ! Arguments
        character( 8 )                :: date  ! YYYYMMDD
        character( * ), intent( out ) :: ds    ! YYYY-MM-DD

        call date_and_time( date=date )

        ds = date(1:4) // "-" // date(5:6) // "-" // date(7:8)

    end subroutine date_stamp
