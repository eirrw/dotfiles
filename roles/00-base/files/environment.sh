# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export PATH="${PATH}:${HOME}/.local/bin"

# terminal
export TERMINAL="kitty"

# less - see https://github.com/ryanoasis/nerd-fonts/issues/1337
export LESSUTFCHARDEF="23fb-23fe:p,2665:p,26a1:p,2b58:p,e000-e00a:p,e0a0-e0a2:p,e0a3:p,e0b0-e0b3:p,e0b4-e0c8:p,e0ca:p,e0cc-e0d4:p,e200-e2a9:p,e300-e3e3:p,e5fa-e6ac:p,e700-e7c5:p,ea60-ebeb:p,f000-f2e0:p,f300-f32f:p,f400-f532:p,f500-fd46:p,f0001-f1af0:p"

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
# use with user unit (https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
