### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# 10ms wait for esc key sequences
KEYTIMEOUT=1

# Bash completions
autoload -U bashcompinit
bashcompinit

# clean up path var
typeset -U path

# plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::lib/history.zsh

zinit light zdharma-continuum/history-search-multi-word

zinit light zpm-zsh/ssh
zinit light zpm-zsh/ls

zinit light romkatv/powerlevel10k

zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-syntax-highlighting \
    blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions

# Powerline10K options
if [[ $(tty) =~ ^/dev/tty[0-9]+$ ]]; then
    source "$HOME/.config/zsh/p10k.tty.zsh"
else
    source "$HOME/.config/zsh/p10k.zsh"
fi

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# use rsync instead of cp
alias cp='rsync -ahPHAXSb --backup-dir=/tmp/rsync -e /dev/null'

# add userscripts location to path
path+=("${HOME}/bin")
