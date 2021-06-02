!   process date_stamp
    subroutine olf_date_stamp( ds )
        implicit none
    ! Arguments
        character( * ), intent( out ) :: ds    ! YYYY-MM-DD

    ! Variables
        character( 8 )                :: date  ! YYYYMMDD

        call date_and_time( date=date )

        ds = date(1:4) // "-" // date(5:6) // "-" // date(7:8)

    end subroutine olf_date_stamp
