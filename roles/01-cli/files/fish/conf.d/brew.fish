if test -e "/home/linuxbrew/.linuxbrew/bin/brew"
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)

    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    set -x HOMEBREW_NO_ENV_HINTS 1
    set -x HOMEBREW_AUTO_UPDATE_SECS 25200
end
