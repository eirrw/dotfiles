### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# environment
export PATH=$PATH:$HOME/scripts

# plugin options
TMUX_MOTD=false

# plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::lib/history.zsh

zinit load zdharma/history-search-multi-word

zinit ice blockf
zinit load zsh-users/zsh-completions

zinit load zpm-zsh/tmux
zinit load zpm-zsh/ssh
zinit load zpm-zsh/ls

zinit load romkatv/powerlevel10k

zinit wait lucid for \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  atinit"zicompinit; zicdreplay" \
    zsh-users/zsh-syntax-highlighting  
  

# Powerline10K options
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context root_indicator dir_writable dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs virtualenv background_jobs time)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u227B "

POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false
DEFAULT_USER=$USER

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='blue'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

POWERLEVEL9K_TRANSIENT_PROMPT=always
POWERLEVEL9K_INSTANT_PROMPT=verbose

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# aliasing
alias cp='rsync -ahP'

