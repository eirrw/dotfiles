function __git_main_branch
    if test -n "$(git branch --list main)"
        echo main
    else
        echo master
    end
end
