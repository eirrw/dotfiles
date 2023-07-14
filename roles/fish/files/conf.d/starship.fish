if status is-interactive
    command -q starship
    and starship init fish | source
end
