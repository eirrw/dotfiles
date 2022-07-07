# +---------+
# | options |
# +---------+
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

setopt ALWAYS_TO_END                    # Move cursor after completion.
setopt APPEND_HISTORY                   # Append to $HISTFILE, not replace.
setopt AUTO_LIST                        # List choices on ambiguous completion.
setopt AUTO_MENU                        # Show completion menu on tab press.
#setopt AUTO_NAME_DIRS                   # Allows 'cd ~borntyping' (see below).
setopt AUTO_PARAM_KEYS                  # Intelligent handling of characters
setopt AUTO_PARAM_SLASH                 #   after a completion.
setopt AUTO_REMOVE_SLASH                # Remove trailing slash when needed.
#setopt COMPLETE_ALIASES                 # Allow custom autocompletion for aliases.
setopt COMPLETE_IN_WORD                 # Allow completion from middle of word
setopt EXTENDED_HISTORY                 # Record additional information.
setopt HIST_EXPIRE_DUPS_FIRST           # Remove duplicate entries first.
setopt HIST_FIND_NO_DUPS                # Never find duplicates when searching.
setopt HIST_IGNORE_ALL_DUPS             # Remove old duplicate entries first.
setopt HIST_IGNORE_DUPS                 # Ignore adjacent repeated entries.
setopt HIST_IGNORE_SPACE                # Skip if the line starts with space.
setopt HIST_SAVE_NO_DUPS                # Never save duplicate commands.
setopt HIST_VERIFY                      # Don't immediately run history commands.
setopt INC_APPEND_HISTORY               # Append to $HISTFILE while running.
setopt INTERACTIVE_COMMENTS             # Allow comments in interactive mode.
setopt LIST_PACKED                      # Smallest completion menu.
setopt RM_STAR_WAIT                     # Force the user to wait before 'rm *'.
setopt SHARE_HISTORY                    # Share history between ZSH instances.
unsetopt FLOW_CONTROL                   # Disable start/stop characters.
unsetopt MENU_COMPLETE                  # Don't autoselect completions.

# get external config
source "${ZDOTDIR}/keybind.zsh"
source "${ZDOTDIR}/alias.zsh"
source "${ZDOTDIR}/functions.zsh"

# 10ms wait for esc key sequences
KEYTIMEOUT=1

# clean up path var
typeset -U path

# plugins are loaded in list order
plugins=(
    romkatv/powerlevel10k
    skywind3000/z.lua
    eirrw/zsh-systemd
    eirrw/zsh-git
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
)
plugin-load $plugins

# Powerline10K options
if [[ $(tty) =~ ^/dev/tty[0-9]+$ ]]; then
    source "$HOME/.config/zsh/p10k.tty.zsh"
else
    source "$HOME/.config/zsh/p10k.zsh"
fi

# load fzf if available
if [ $(command -v fzf) ]; then
    source /usr/share/(doc/)#fzf/(examples/)#key-bindings.zsh
    source /usr/share/(doc/)#fzf/(examples/)#completion.zsh
fi

# completion
autoload -U bashcompinit
autoload -U compinit
zstyle ':completion:*:*:*:*:*' menu select                          # Select completions with an interactive menu.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'              # Case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"             # Set list-colors to enable filename colorizing.
zstyle ':completion:*:descriptions' format '[%d]'                   # Set descriptions format to enable group support.
zstyle ':completion:*:git-checkout:*' sort false                    # Disable sort when completing `git checkout`.
zstyle -e ':completion:*:hosts' hosts 'reply=()'                    # dont autocomplete from hostsfile
zstyle -e ':completion:*:ssh:*:users' users 'reply=()'                    # dont 
compinit -d $ZCOMPDUMP
bashcompinit

# nvm
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh --no-use

# syntax highlighting - must be last
plugin-load "zsh-users/zsh-syntax-highlighting"