!====================Olaus Fortran Utility Routines=====================
module olaus
    use ISO_FORTRAN_ENV
    implicit none

!-h- olsdef.f90
!================== Olaus Fortran Symbol Definitions ===================

    integer, parameter :: RC_OK          =   0          ! Successful termination
    integer, parameter :: RC_WARNING     =   4          ! Warning
    integer, parameter :: RC_ERROR       =   8          ! Error
    integer, parameter :: RC_SEVERE      =  12          ! Severe error
    integer, parameter :: RC_FATAL       =  16          ! Fatal error
    integer, parameter :: RC_BASE        =  64          ! Base value for error messages
    integer, parameter :: RC_USAGE       =  64          ! Command line usage error
    integer, parameter :: RC_DATAERR     =  65          ! Data format error
    integer, parameter :: RC_NOINPUT     =  66          ! Cannot open input
    integer, parameter :: RC_NOUSER      =  67          ! Addressee unknown
    integer, parameter :: RC_NOHOST      =  68          ! Host name unknown
    integer, parameter :: RC_UNAVAILABLE =  69          ! Service unavailable
    integer, parameter :: RC_SOFTWARE    =  70          ! Internal software error
    integer, parameter :: RC_OSERR       =  71          ! System error (e.g., canon fork)
    integer, parameter :: RC_OSFILE      =  72          ! Critical OS file missing
    integer, parameter :: RC_CANTCREAT   =  73          ! Cannot create (user) output file
    integer, parameter :: RC_IOERR       =  74          ! Input/output error
    integer, parameter :: RC_TEMPFAIL    =  75          ! Temp failure; user is invited to retry
    integer, parameter :: RC_PROTOCOL    =  76          ! Remote error in protocol
    integer, parameter :: RC_NOPERM      =  77          ! Permission denied
    integer, parameter :: RC_CONFIG      =  78          ! Configuration error
    integer, parameter :: RC_MISSINGFILE =  79          ! A file is missing
    integer, parameter :: RC_CANTC8TEMP  =  80          ! Cannot create temporary file
    integer, parameter :: RC_ASSERTFAIL  =  81          ! Assertion failed
    integer, parameter :: RC_CANTC8LOCK  =  82          ! Cannot create lock file.
    integer, parameter :: RC_USERABORT   =  83          ! Aborted by user
    integer, parameter :: RC_TERMINATION =  84          ! Trapped termination interrupt
    integer, parameter :: RC_TRAPINT     =  85          ! Trapped interrupt
    integer, parameter :: RC_TESTMAXERR  = 254          ! Maximum error count for Olaus Test
    integer, parameter :: RC_TESTBAIL    = 255          ! BAIL_OUT function terminated script
    integer, private   :: RC_CODE        = RC_OK        ! Initialize Return Code to OK


! IO Files
    integer, parameter :: STDIN          = INPUT_UNIT   ! Standard In
    integer, parameter :: STDOUT         = OUTPUT_UNIT  ! Standard Out
    integer, parameter :: STDERR         = ERROR_UNIT   ! Standard Error

  ! Test harness definitions:
    integer, private   :: TST_NOPLAN=0          ! Signal no test plan
    integer, private   :: TST_COUNT=0           ! Initialize TST_COUNT. Each test increments TST_COUNT.

  ! System 
    character(256), private   :: SYSID
    character(256), private   :: COMPID
    character(3),   private   :: PGMID

  ! Command Variables

  ! Command File Names can be at most 256 characters long.
    character(256), private   :: OLSLOGFILE = "logfile.txt"  ! Default logfile name.
    character(256), private   :: OLSINFILES(256)   ! Only supports 256 input files.
    character(256), private   :: OLSOUTPUT  ! Output file, default STDOUT


    integer,        private   :: OLSVERBOSE        ! Verbose option
    integer,        parameter :: OLSQUITE   = 0    ! -q | --quiet | --verbose=0
    integer,        parameter :: OLSNORMAL  = 1    ! Default, --verbose=1
    integer,        parameter :: OLSVERB    = 2    ! -v | --verbose | --verbose=2
    integer,        private   :: OLSLOG            ! Log option
    integer,        parameter :: OLSNOLOG   = 0    ! Default to nolog file
    integer,        parameter :: OLSNORLOG  = 1    ! --log=[logfile]
    
    !-e- olsdef.f90

contains

!-h- bail_out.f90
! Bail Out of test
subroutine bail_out( diagnostic_message )
implicit none

! Argument
character(*), intent(in) :: diagnostic_message

write( *, '(a,a)' ) 'Bail out! ', trim(diagnostic_message)

call setrc( RC_TESTBAIL )            ! Set the Bail Out Fatal Return Code
call olsend                          ! Exit program setting the system Return Code
    
end subroutine bail_out
!-e- bail_out.f90
!-h- diag.f90
!   Write a test diagnostic message
    subroutine diag( diagnostic_message )
        implicit none

        ! Argument
        character(len=*), intent(in) :: diagnostic_message

        write( *, '(a,a)' ) '# ', trim(diagnostic_message)

    end subroutine diag
!-e- diag.f90
!-h- errmsg.f90
!   Write error message to SYSERR
    subroutine errmsg( err_no, rc, msg )
    implicit none

        ! Arguments
        integer, intent(in)          :: err_no  ! This is the error number for this message.
        integer, intent(in)          :: rc      ! Set return code for this message.
        character(len=*), intent(in) :: msg     ! This is the error message

        ! Local Variables
        character(265)               :: sys_msg
        character(len=1)             :: sev     ! Severity of message.
        character(len=10)            :: c_err_no ! Character form of err_no
        integer                      :: rcc     ! internal return code
        
 !       call olsbldmsg( )
        if( rc < RC_OK .or. RC_TESTBAIL < rc) then
            rcc = RC_FATAL
        else
            rcc = rc
        end if

        ! Left justify err_no.
        write( c_err_no, '(i10)' ) err_no
       
        ! Set the severity code

        select case ( rcc )
        case( RC_OK )                ! Information Message
            sev = "I"
        case( RC_WARNING )           ! Warning
            sev = "W"
        case( RC_ERROR )             ! Error
            sev = "E"
        case( RC_SEVERE )            ! Severe Error
            sev = "S"
        case default                 ! Fatal Error
            sev = "F"
        end select

        write( c_err_no, '(i10)' ) err_no  ! Convert irr_no into characters
        write( STDERR, '(a,a,a,a,a)'  ) PGMID, trim(adjustl(c_err_no)), sev, ' ', trim(msg)

        call setrc( rcc )
        if( sev == 'F' ) then
            call olsend
        end if

    end subroutine errmsg
!-e- errmsg.f90
!-h- fail.f90
!   Fail this test.
    subroutine fail( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    character(len=10) :: ctsts

    TST_COUNT = TST_COUNT + 1

    write( ctsts, '(i10)' ) TST_COUNT

    write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)

    end subroutine fail
!-e- fail.f90
!-h- getrc.f90

!   What is the current return code.
    subroutine getrc( rc )
    implicit none

        integer, intent(out) :: rc

        rc = RC_CODE

    end subroutine getrc
!-e- getrc.f90
!-h- olsgetsys.f90
    ! Recall three system identifiers
    subroutine olsgetsys( sys, comp, pgm )
      implicit none
  
          character(len=*), intent(out) :: sys   ! System Identification
          character(len=*), intent(out) :: comp  ! Component Identification
          character(3),     intent(out) :: pgm   ! Program Identification
  
              sys    = SYSID
              comp   = COMPID
              pgm    = PGMID
  
    end subroutine olsgetsys
!-e- olsgetsys.f90
!-h- is.f90
!   compare integers
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
            write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctests)), " ", trim(test_name)
        else
            write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctests)), " ", trim(test_name)
        end if

    end subroutine is
!-e- is.f90
!-h- isnot.f90
!   compare integers
    subroutine isnot( got, expected, test_name )

        implicit none

      ! Arguments
        integer, intent(in)          :: got
        integer, intent(in)          :: expected
        character(len=*), intent(in) :: test_name

        character(len=10) :: ctests

        TST_COUNT = TST_COUNT + 1

        write( ctests, '(i10)' ) TST_COUNT

        if( got /= expected ) then
            write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctests)), " ", trim(test_name)
        else
            write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctests)), " ", trim(test_name)
        end if

    end subroutine isnot
!-e- isnot.f90
!-h- ok.f90
!   process logical test
    subroutine ok( tst, tst_name )
        implicit none


      ! Arguments
        logical, intent(in)          :: tst
        character(len=*), intent(in) :: tst_name

        character(len=10) :: ctsts

        TST_COUNT = TST_COUNT + 1

        write( ctsts, '(i10)' ) TST_COUNT

        if( tst ) then
            write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)
        else
            write( *, '(a,a,a,a)' ) "not ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)
        end if

    end subroutine ok
!-e- ok.f90
!-h- olsbegin.f90
    ! Start a Fortran command
    subroutine olsbegin( sys, comp, pgm )
    implicit none

        character(*), intent(in)  :: sys    ! System Identification 
        character(*), intent(in)  :: comp   ! Component Identification
        character(3), intent(in)  :: pgm    ! Program Identification

            SYSID  = sys   ! Save arguments
            COMPID = comp  !   in olaus
            PGMID  = pgm   !   private storage.

    end subroutine olsbegin
!-e- olsbegin.f90
!-h- olsbldmsg.f90
! Build an error message with error number, return code and message.
subroutine olsbldmsg( err_msg, err_no, rc, msg )
implicit none

    ! Arguments
    character(*), intent(out)    :: err_msg
    integer, intent(in)          :: err_no  ! This is the error number for this message.
    integer, intent(in)          :: rc      ! Set return code for this message.
    character(len=*), intent(in) :: msg     ! This is the error message

    ! Local Variables
    character(len=1)             :: sev     ! Severity of message.
    character(len=10)            :: c_err_no ! Character form of err_no
    integer                      :: rcc     ! internal return code
        
    if( rc < RC_OK .or. RC_TESTBAIL < rc) then
        rcc = RC_FATAL               ! If rc is outside of the system range
    else                             ! set return code to fatal.
        rcc = rc   
    end if
       
    ! Set the severity code

    select case ( rcc )
    case( RC_OK )                ! Information Message
        sev = "I"
    case( RC_WARNING )           ! Warning
        sev = "W"
    case( RC_ERROR )             ! Error
        sev = "E"
    case( RC_SEVERE )            ! Severe Error
        sev = "S"
    case default                 ! Fatal Error
        sev = "F"
    end select

    write( c_err_no, '(i10)' ) err_no  ! Convert irr_no into characters

    err_msg = PGMID // trim(adjustl(c_err_no)) // sev // ' ' // trim(msg)

    call setrc( rcc )

end subroutine olsbldmsg
!-e- olsbldmsg.f90
!-h- olsend.f90
!   Exit this Fortran Program while setting the Return Code
subroutine olsend
implicit none

   integer :: rcc

!  Set the return code.
   call getrc( rcc )
   call exit( rcc )

end subroutine olsend
!-e- olsend.f90
!-h- olsinput.f90
! olsinput - Process command input files

subroutine olsinput

end subroutine olsinput
!-e- olsinput.f90
!-h- olslog.f90
!-e- olslog.f90
!-h- olsusage.f90
!# olsusage--Print Program Synopsys and Exit
subroutine olsusage
implicit none

!function olsusage()
!{
!    if [[ $# -eq 0 ]]        # At least one argument is required by olsusage
!    then
!        olserr 7000 $EX_SOFTWARE  "olsusage: Missing required synopsys argument"
!        olsend               # Exit program with EX_CODE of $EX_SOFTWARE
!    fi

!    printf "%s\n" "Usage:"   # Print usage tag
!    printf "%s\n" "$*"       # Print the usage string

!    olssetex $EX_OK
!    olsend                   # Exit program
    
!} # end olsusage

end subroutine olsusage
!-e- olsusage.f90
!-h- olsversion.f90
! olsversion - Write system name, component, license and copywrite to STDOUT
subroutine olsversion( sys, comp, pgm )
implicit none

    character(*), intent(in)  :: sys   ! System Identification 
    character(*), intent(in)  :: comp  ! Component Identification
    character(3), intent(in)  :: pgm   ! Program Identification

!    call olsbldmsg( sys_msg, err_no, RC_OK, msg ) ! Build a system message from it constituent parts.

!    SYSID  = system
!    COMPID = component
!    PGMID  = pgm

!    sys, comp, version, date
!    copywrite
!    license

!    write( STDOUT, ) PGMID,

end subroutine olsversion
!-e- olsversion.f90
!-h- olswrite.f90
! olswrite - Write to

subroutine olswrite

end subroutine olswrite
!-e- olswrite.f90
!-h- pass.f90
!   Pass this test.
    subroutine pass( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    character(len=10) :: ctsts

    TST_COUNT = TST_COUNT + 1

    write( ctsts, '(i10)' ) TST_COUNT

    write( *, '(a,a,a,a)' ) "ok - ", trim(adjustl(ctsts)), " ", trim(tst_name)

    end subroutine pass
!-e- pass.f90
!-h- setrc.f90
!   Set system return code
    subroutine setrc( rc )
    implicit none

      ! Argument
        integer, intent(in)  :: rc

      ! Remember this return code if it is greater then RC_CODE.
        if( rc > RC_CODE ) then
            RC_CODE = rc
        end if

    end subroutine setrc
!-e- setrc.f90
!-h- tst_plan.f90
!   Set number of tests.
    subroutine tst_plan( no_tests )
    implicit none

    ! Arguments
        integer, intent(in) :: no_tests  ! Number of tests

        character(10)       :: ctests    ! Character form of number of tests

        if( no_tests < 1 ) then
            call errmsg( 7002, RC_SOFTWARE, "Number of plan tests less than one. Fatal Error." )
        else
            ! Left justify plan_tests so that the output looks like "1..27".
            write( ctests, '(i10)' ) no_tests
            write(  *, '(a,a)' ) "1..",trim(adjustl(ctests))
        end if

    end subroutine tst_plan
!-e- tst_plan.f90
!-h- date_stamp.f90
!   process date_stamp
    subroutine date_stamp( ds )
        implicit none
    ! Arguments
        character( 8 )                :: date  ! YYYYMMDD
        character( * ), intent( out ) :: ds    ! YYYY-MM-DD

        call date_and_time( date=date )

        ds = date(1:4) // "-" // date(5:6) // "-" // date(7:8)

    end subroutine date_stamp
!-e- date_stamp.f90
!-h- skip.f90
!   skip this test.
    subroutine skip( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    character(len=10) :: ctsts

    TST_COUNT = TST_COUNT + 1

    write( ctsts, '(i10)' ) TST_COUNT

    call pass( "# SKIP " // tst_name)

    end subroutine skip
!-e- skip.f90
!-h- time_stamp.f90
!   process time_stamp
    subroutine time_stamp( ts )
        implicit none
    ! Arguments
        character( 6 )                :: time  ! HHMMSS
        character( * ), intent( out ) :: ts    ! HH:MM:SS 

        call date_and_time( time=time )

        ts = time(1:2) // ":" // time(3:4) // ":" // time(5:6)

    end subroutine time_stamp
!-e- time_stamp.f90
!-h- todo.f90
!   todo.f90
    subroutine todo( tst_name )
    implicit none

    ! Argument
    character(len=*), intent(in) :: tst_name

    call fail( "# TODO " // tst_name )

    end subroutine todo
!-e- todo.f90

end module olaus
