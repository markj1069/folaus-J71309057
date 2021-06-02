! After installation do a quick test.

program user_tst
    use      olflib
    implicit none

    logical  :: l = .TRUE.


    !               Set System Name
    !               !                          Set Component ID
    !               !                          !           Set Program ID
    !               !                          !           !
    call olf_begin( 'Olaus Fortran Utilities', "user-tst", "OLS" )

    call olf_tst_plan( 4 )

    call olf_err_msg( 7000, RC_OK, "Begin user_tst." )

    call olf_is( RC_OK, 0, "is RC_OK does have the value of 0." )

    call olf_isnt( RC_OK, 255, "isnt RC_OK does not have the value of 255." )

    call olf_ok( l, "call ok test." )

    call olf_pass( "This test should pass." )

    call olf_diag( "This is a diagnostic message." )

    call olf_err_msg( 7000, RC_OK, "End user_tst." )

    call olf_end

end program user_tst
