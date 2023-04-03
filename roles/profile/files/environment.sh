# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export PATH="${PATH}:${HOME}/.local/bin"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# style
export QT_STYLE_OVERRIDE=Adwaita-dark

# man
export MANPAGER='nvim +Man!'

# golang
export GOPATH="${XDG_DATA_HOME}/go"
export PATH="${PATH}:${GOPATH}"
export PATH="${PATH}:/usr/local/go/bin/"

# rust
export CARGO_HOME="${XDG_CACHE_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export PATH="${PATH}:${CARGO_HOME}/bin"

# ssh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
