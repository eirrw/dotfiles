# initialize completions
autoload -Uz compinit
compinit

# bash
autoload bashcompinit
bashcompinit

# environment
export PATH=$PATH:$HOME/scripts

# tmux plugin config
export ZSH_TMUX_AUTOSTART=true

# plugins
source ~/.dotfiles/zsh/git-aliases/git-aliases.zsh
source ~/.dotfiles/zsh/ls/ls.plugin.zsh
source ~/.dotfiles/zsh/zsh-tmux/tmux.plugin.zsh
source ~/.dotfiles/zsh/omz-plugins/history.zsh
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# completions
source ~/.dotfiles/zsh/completions/ssh/ssh.plugin.zsh

# powerline9k
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir_writable dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs virtualenv background_jobs context)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u227B "

POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
DEFAULT_USER=$USER

source ~/.dotfiles/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# set keymaps
bindkey -v

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# syntax highlighting at end
source ~/.dotfiles/zsh/history-search-multi-word/history-search-multi-word.plugin.zsh
source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# aliasing
alias please='sudo $(fc -nl -1)'
alias cp='rsync -ahP'
