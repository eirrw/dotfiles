# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export PATH="${PATH}:${HOME}/.local/bin"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME-:${HOME}/.config}/zsh"
export ZCOMPDUMP="${XDG_CACHE_HOME}/zsh/zcompdump"
export HISTFILE="${XDG_CACHE_HOME}/zsh/zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# man
export MANPAGER='nvim +Man!'

# ls
export LS_COLORS="rs=0:di=01;33:ln=target:or=41:ex=32"

# golang
export GOPATH="${XDG_DATA_HOME}/go"
export PATH="${PATH}:${GOPATH}"

# rust
export CARGO_HOME="${XDG_CACHE_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export PATH="${PATH}:${CARGO_HOME}/bin"

# ssh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
