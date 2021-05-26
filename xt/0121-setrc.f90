! Fortran Assertion and Test: Test setrc

program setrc_0121
    use      olaus
    implicit none

    integer rc

                    ! Set System Name
                    !                          ! Set Component ID
                    !                          !             Set Program ID
                    !                          !             !
    call olsbegin( 'Olaus Fortran Utilities', "0176-setrc", "OLS" )

    call tst_plan( 4 )

    call getrc( rc )
    call is( rc, RC_OK, "Initial return code should be RC_OK.")
    
    call setrc( RC_WARNING )
    call getrc( rc )
    call is( rc, RC_WARNING, "Return code set to warning.")

    call setrc( RC_ERROR )
    call getrc( rc )
    call is( rc, RC_ERROR, "Return code set to error." )

    call setrc( RC_WARNING )
    call getrc( rc )
    call is( rc, RC_ERROR, "Return code should remain as error." )

    call setrc( rc )
    call olsend

end program setrc_0121
