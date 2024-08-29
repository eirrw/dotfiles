function __create_abbr -a prefix starter
    if test (count $argv) -lt 3
        exit 1
    end

    for cmd in $argv[3..]
        set -l suffix $(string trim -c '-' -- "$cmd")
        if string match -q -- '* *' $suffix
            set -l split (string split ' ' $suffix)
            for i in (seq (count $split))
                set split[$i] (string trim -c '-' -- "$split[$i]")
            end
            set suffix (string join '-' -- $split)
        end

        abbr "$prefix-$suffix" "$starter $cmd"
    end
end
