function ls
    if command -q eza
        eza --color=auto --git --icons=auto $argv
    else
        command ls --color=auto $argv
    end
end
