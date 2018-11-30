#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found
#antigen bundle tmux
#antigen bundle vi-mode

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting

source ~/.dotfiles/powerlevel9k/powerlevel9k.zsh-theme
source ~/.dotfiles/git-aliases/git-aliases.zsh
source ~/.dotfiles/ls/ls.plugin.zsh

# set path
export PATH=$HOME/scripts:$PATH

# powerline9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

DEFAULT_USER=$USER

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"

# set keymaps
bindkey -v
