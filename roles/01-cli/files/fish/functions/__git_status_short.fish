function __git_status_short
    set gstatus "$(git -c color.status=always status --short)"
    if test -z $gstatus
        echo 'Nothing to commit, working tree clean\n'
    else
        echo "$gstatus\n"
    end
    set ccount 3
    if set -q argv[1]
        set ccount $argv[1]
    end
    git -c color.ui=always log -$ccount --oneline | cat
end
