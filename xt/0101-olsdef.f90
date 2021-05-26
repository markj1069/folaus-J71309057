! Test olsdef.f90 inclusion into the Olaus Module 
program olsdef_0100
    use olaus
    implicit none

    call olsbegin('Olaus Fortran Utilities', '0101-olsdef.f90', "OLS")

    call setrc( RC_BASE )            ! Set the return code to RC_BASE.
    call olsend                      ! olsdef_0101 should exit 
                                     !      with a return code of 64.
end program olsdef_0100