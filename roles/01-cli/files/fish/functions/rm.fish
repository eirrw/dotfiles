function rm --wraps=rm
    if set -q ALLOW_RM; and test "$ALLOW_RM" -eq 1
        echo "permanently deleting files..."
        command rm $argv
        return
    end

    echo "Do not use rm! Use trash-put instead: trash-put $argv"
    echo "Use 'command rm' if absolutely necessary, or set ALLOW_RM=1"
end
