if status is-interactive
    and command -q starship

    if string match -q -r '^/dev/tty[0-9]+$' (tty)
        # plaintext
        set -x STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/tty.toml"
    else
        # unicode / nerdfonts
        set -x STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/pts.toml"
    end

    # transient prompt leader
    function starship_transient_prompt_func
        starship module character
    end

    starship init fish | source
    enable_transience
end
