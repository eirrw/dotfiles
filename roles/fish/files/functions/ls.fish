function ls
    if command -q eza
        eza --color=auto --git --icons $argv
    else if command -q exa
        exa --color=auto --git --icons $argv
    else
        command ls --color=auto $argv
    end
end
