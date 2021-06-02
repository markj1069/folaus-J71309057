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

    character( 3 ), private   :: OLFPGMID = "OLF"

  ! Command File Names can be at most 256 characters long.
    character(256), private   :: OLSLOGFILE = "logfile.txt"  ! Default logfile name.
    character(256), private   :: OLSINFILES(256)   ! Only supports 256 input files.
    character(256), private   :: OLSOUTPUT  ! Output file, default STDOUT

integer,        private   :: OLFWRITELVL
integer,        private   :: OLSVERBOSE        ! Verbose option
    integer,        parameter :: OLSQUITE   = 0    ! -q | --quiet | --verbose=0
    integer,        parameter :: OLSNORMAL  = 1    ! Default, --verbose=1
    integer,        parameter :: OLSVERB    = 2    ! -v | --verbose | --verbose=2
    integer,        private   :: OLSLOG            ! Log option
    integer,        parameter :: OLSNOLOG   = 0    ! Default to nolog file
    integer,        parameter :: OLSNORLOG  = 1    ! --log=[logfile]

    logical,        private   :: OLSWRITEOUT = .true.   ! Write to STDOUT
    logical,        private   :: OLSWRITEERR = .false.  ! Write to STDOUT
    logical,        private   :: OSLWRITELOG = .false.  ! Write to STDLOG
