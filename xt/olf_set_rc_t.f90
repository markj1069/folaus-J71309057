! Fortran Assertion and Test: Test setrc

program olf_set_rc_t
    use      olflib
    implicit none

    integer rc

                    ! Set System Name
                    !                          ! Set Component ID
                    !                          !             Set Program ID
                    !                          !             !
    call olf_begin( 'Olaus Fortran Utilities', "olf_set_rc", "OLF" )

    call olf_tst_plan( 4 )

    call olf_get_rc( rc )
    call olf_is( rc, RC_OK, "Initial return code should be RC_OK.")
    
    call olf_set_rc( RC_WARNING )
    call olf_get_rc( rc )
    call olf_is( rc, RC_WARNING, "Return code set to warning.")

    call olf_set_rc( RC_ERROR )
    call olf_get_rc( rc )
    call olf_is( rc, RC_ERROR, "Return code set to error." )

    call olf_set_rc( RC_WARNING )
    call olf_get_rc( rc )
    call olf_is( rc, RC_ERROR, "Return code should remain as error." )

    call olf_set_rc( rc )
    call olf_end

end program olf_set_rc_t
