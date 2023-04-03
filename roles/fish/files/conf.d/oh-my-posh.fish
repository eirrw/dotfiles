if status is-interactive
    set dir (default $XDG_CONFIG_HOME ~/.config)

    command -q oh-my-posh
    and oh-my-posh init fish --config "$dir/oh-my-posh.toml" | source
end
