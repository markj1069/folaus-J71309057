! Test ols_def_t.f90 inclusion into the Olaus Module 
program olf_def_t
use olflib
implicit none

    call olf_begin( 'Olaus Fortran Utilities', 'olf_def', "OLF" )
    call olf_set_rc( RC_BASE )       ! Set the return code to RC_BASE.
    call olf_end                     ! olf_def_t should exit 
                                     !      with a return code of 64.
end program olf_def_t