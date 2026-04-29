function __git_print_alias
    set -l abbrs (cat "$XDG_CONFIG_HOME/fish/conf.d/git.fish" | string match -e 'abbr*')

    printf "%s\n" (string pad -c '_' -w 80 '_')
    printf "|%13s|%64s|\n" ' ' ' '
    printf "| %-11s | %-62s |\n" Alias Command
    printf "|%s|%s|\n" (string pad -c_ -w13 _) (string pad -c_ -w64 _)
    printf "|%13s|%64s|\n" ' ' ' '

    for a in $abbrs
        set -l abbr (string match -gr 'abbr (.*?) (?:"|\')?(.*?)(?:"|\')?(?= #|$)' $a)
        printf "| %-11s | %-62s |\n" $abbr[1] (string shorten -m62 $abbr[2])
    end

    printf "|%s|%s|\n" (string pad -c_ -w13 _) (string pad -c_ -w64 _)
end
