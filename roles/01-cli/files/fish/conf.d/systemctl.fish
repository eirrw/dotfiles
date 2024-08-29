if status --is-interactive
    # regular aliases
    set -l sc_aliases \
        cat "--failed" help is-active is-enabled list-jobs list-timers \
        list-unit-files list-units show show-environment status
    __create_abbr sc systemctl $sc_aliases
    abbr sc systemctl

    # sudo aliases
    set -l ssc_aliases \
        cancel disable "disable --now" edit enable "enable --now" isolate \
        kill link load mask "mask --now" preset reenable reload restart \
        set-environment start stop try-restart unmask unset-environment \
        reset-failed daemon-reload daemon-restart
    __create_abbr sc "sudo systemctl" $ssc_aliases
    abbr ssc sudo systemctl

    # user aliases
    __create_abbr scu "systemctl --user" $sc_aliases $ssc_aliases
    abbr scu systemctl --user
end
