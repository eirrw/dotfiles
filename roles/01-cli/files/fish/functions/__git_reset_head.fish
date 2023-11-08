function __git_reset_head
    if git reset HEAD~$argv[2] $argv[1]
        if test $argv[1] = '--hard'
            echo -n 'HEAD is now at '
            git -c color.ui=always log -1 --oneline | cat
        end
    else
        echo -n 'HEAD remains at '
        git -c color.ui=always log -1 --oneline | cat
    end
end
