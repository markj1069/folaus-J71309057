# Return the filename without suffix
#
function filexsf {            # What is the filename without suffix?
    local XF                  # Filename without suffix
    local BN                  # Base filename
    local FN                  # Filename without path
    local FL="$1"             # rrr/sss/ttt.uuu/vvv_www.yyy.zzz

    FN=${FL##*/}              # vvv_www.yyy.zzz
    FP=${FL%/*}               # rrr/sss/ttt.uuu

    # if the path is missing, set the path to .
    if [[ "$FP" = "$FL" ]]; then FP="$PWD"; fi

    BN=${FN%.*}               # vvv_www.yyy
    XF="$FP/$BN"              # rrr/sss/ttt.uuu/vvv_www.yyy

    builtin printf "%s" "$XF" # Return the filename w/o suffix
    return 0                  # Set return code
} # filexsf
