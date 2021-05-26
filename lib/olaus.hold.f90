
!====================Olaus Fortran Utility Routines=====================
module olaus
    implicit none

!================== Olaus General Symbol Definitions ===================
  ! Return code definitions:
    integer, parameter :: RC_OK=0               ! Successful termination
    integer, parameter :: RC_WARNING=4          ! Warning
    integer, parameter :: RC_ERROR=8            ! Error
    integer, parameter :: RC_SEVERE=12          ! Severe error
    integer, parameter :: RC_FATAL=16           ! Fatal error
    integer, parameter :: RC_BASE=64            ! Base value for error messages
    integer, parameter :: RC_USAGE=64           ! Command line usage error
    integer, parameter :: RC_DATAERR=65         ! Data format error
    integer, parameter :: RC_NOINPUT=66         ! Cannot open input
    integer, parameter :: RC_NOUSER=67          ! Addressee unknown
    integer, parameter :: RC_NOHOST=68          ! Host name unknown
    integer, parameter :: RC_UNAVAILABLE=69     ! Service unavailable
    integer, parameter :: RC_SOFTWARE=70        ! Internal software error
    integer, parameter :: RC_OSERR=71           ! System error (e.g., canon fork)
    integer, parameter :: RC_OSFILE=72          ! Critical OS file missing
    integer, parameter :: RC_CANTCREAT=73       ! Cannot create (user) output file
    integer, parameter :: RC_IOERR=74           ! Input/output error
    integer, parameter :: RC_TEMPFAIL=75        ! Temp failure; user is invited to retry
    integer, parameter :: RC_PROTOCOL=76        ! Remote error in protocol
    integer, parameter :: RC_NOPERM=77          ! Permission denied
    integer, parameter :: RC_CONFIG=78          ! Configuration error
    integer, parameter :: RC_MISSINGFILE=79     ! A file is missing
    integer, parameter :: RC_CANTC8TEMP=80      ! Cannot create temporary file
    integer, parameter :: RC_ASSERTFAIL=81      ! Assertion failed
    integer, parameter :: RC_CANTC8LOCK=82      ! Cannot create lock file.
    integer, parameter :: RC_USERABORT=83       ! Aborted by user
    integer, parameter :: RC_TERMINATION=84     ! Trapped termination interrupt
    integer, parameter :: RC_TRAPINT=85         ! Trapped interrupt
    integer, parameter :: RC_TESTMAXERR=254     ! Maximum error count for Olaus Test
    integer, parameter :: RC_TESTBAIL=255       ! BAIL_OUT function terminated script
    integer, private   :: RC_CODE=RC_OK         ! Initialize Return Code to OK


  ! Test harness definitions:
    integer, private   :: TST_NOPLAN=0          ! Signal no test plan
    integer, private   :: TST_COUNT=0           ! Initialize TST_COUNT. Each test increments TST_COUNT.

  ! System 
    character(256), private :: SYSID
    character(256), private :: COMPID
    character(3),   private :: PGMID

contains

    ! Save three system identifiers
    subroutine setsys( system, component, pgm )
    implicit none

        character(len=*), intent(in)  :: system    ! System Identification 
        character(len=*), intent(in)  :: component ! Component Identification
        character(3),     intent(in)  :: pgm       ! Program Identification

            SYSID  = system
            COMPID = component
            PGMID  = pgm

    end subroutine setsys

    ! Recall three system identifiers
    subroutine getsys( system, component, pgm )
      implicit none
  
          character(len=*), intent(out) :: system    ! System Identification
          character(len=*), intent(out) :: component ! Component Identification
          character(3),     intent(out) :: pgm       ! Program Identification
  
              system    = SYSID
              component = COMPID
              pgm       = PGMID
  
    end subroutine getsys
  

    subroutine tst_plan( no_tests )
    implicit none

    ! Arguments
        integer, intent(in) :: no_tests

        character(10) :: ctests

        if( no_tests < 0 ) then
            ! call errmsg( 7002, RC_SOFTWARE, "Number of plan tests less than zero. Fatal Error." )
            print *
        else
            ! Left justify plan_tests so that the output looks like "1..27".
            write( ctests, '(i10)' ) no_tests
            write(  *, '(a,a)' ) "1..",adjustl(ctests)
        end if

    end subroutine tst_plan

    subroutine is( got, expected, test_name )

        implicit none

      ! Arguments
        integer, intent(in)          :: got
        integer, intent(in)          :: expected
        character(len=*), intent(in) :: test_name

        character(len=10) :: ctests

        TST_COUNT = TST_COUNT + 1

        write( ctests, '(i10)' ) TST_COUNT

        if( got == expected ) then
            write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctests)), " ", test_name
        else
            write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctests)), " ", test_name
        end if

    end subroutine is

    subroutine isnot( got, expected, test_name )

        implicit none

      ! Arguments
        integer   :: got
        integer   :: expected
        character :: test_name

        TST_COUNT = TST_COUNT + 1

        if( got /= expected ) then
            write( *, '(a,a,a)' ) "ok - ", TST_COUNT, test_name
        else
            print *, "not ok - ", TST_COUNT, test_name
        end if

    end subroutine isnot

    subroutine setrc( rc )
    implicit none

      ! Argument
        integer, intent(in)  :: rc

      ! Remember this return code if it is greater then RC_CODE.
        if( rc > RC_CODE ) then
            RC_CODE = rc
        end if

    end subroutine setrc

    subroutine getrc( rc )
    implicit none

        integer, intent(out) :: rc

        rc = RC_CODE

    end subroutine getrc

    subroutine ok( test_result, test_name )

    end subroutine ok

    subroutine diag( msg )

    end subroutine diag

    subroutine pass( msg )

    end subroutine plan

    subroutine fail( msg )

    end subroutine fail


    subroutine BAIL_OUT( msg )
    

    end subroutine BAIL_OUT





    subroutine errmsg( err_no, rc_code, msg )
    intrinsic none

        ! Arguments
        integer, intent(in)          :: err_no  ! This is the error number for this message.
        integer, intent(in)          :: rc_code ! Set return code for this message.
        character(len=*), intent(in) :: msg     ! This is the error message

        ! Set the severity code


    end subroutine errmsg
end module olaus