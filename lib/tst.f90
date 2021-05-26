program main
use ISO_FORTRAN_ENV
integer STDIN, STDOUT, STDERR
STDIN  = INPUT_UNIT
STDOUT = OUTPUT_UNIT
STDERR = ERROR_UNIT

print *, ERROR_UNIT
print *, REAL32
print *, REAL64
print *, REAL128

write( STDOUT, '(a)') "This is a test write to unit 6."
write( STDERR, '(a)') "This is a test write to unit 7."
write( ERROR_UNIT, '(a)') "This is a test write to unit 2."
write( *, * )    "This is a test write to star."


end program main
