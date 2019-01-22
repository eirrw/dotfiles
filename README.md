# .dotfiles
Contains a selection of configuration files that can be easily tracked and updated, then symlinked to. Use dotbot to install by running "./install" after downloading.

## vimrc
Vim configuration.  Requires [vim-plug](https://github.com/junegunn/vim-plug) as a package manager; it will be automatically installed on first run.  Needs a powerline font for the theme. I use [Hack](https://sourcefoundry.org/hack/). 

## zshrc
Configuration for the ZSH shell. Uses Git submodules to download and install plugins to avoid framework overhead. Includes a powerline theme and uses the appropriate font.

## tmux.conf
Configuration for Tmux. Updates a few key areas like keybindings for better vim integration.  Uses a powerline theme.
