# .dotfiles
Contains a selection of configuration files so that can be easily tracked and updated.

### Installation
Clone the repository to any directory. Use [dotbot](https://github.com/anishathalye/dotbot) to install by running "./install" after cloning. This will create symlinks in the home directory for each of the config files and download any necessary plugins. Dotbot will display any errors in the output messages.

Included Configurations
-----------------------

### vimrc
Vim configuration.  Requires [vim-plug](https://github.com/junegunn/vim-plug) as a package manager; it will be automatically installed on first run.  Needs a powerline font for the theme. I use [Hack](https://sourcefoundry.org/hack/).

Plugins included and installed with vim-plug:
 - vim-fugitive
 - vim-obsession
 - ctrlp
 - nerdtree
 - delimitMate
 - vim-airline
 - vim-airline-themes
 - vim-colorschemes
 - vim-monokai
 - L9
 - syntastic
 - vim-tmux-navigator

### zshrc
Configuration for the ZSH shell. Uses Git submodules to download and install plugins to avoid framework overhead. Includes a powerline theme and uses the appropriate font.

Plugins included:
 - git-aliases
 - ls
 - tmux
 - history
 - zsh-autosuggestions
 - powerlevel9k
 - ssh
 - history-search-multi-word
 - zsh-syntax-highlighting

### tmux.conf
Configuration for Tmux. Updates a few key areas like keybindings for better vim integration.  Uses a powerline theme.
