# .dotfiles
Contains a selection of configuration files used across my systems.

### Installation
Clone the repository to any directory. Use [dotbot](https://github.com/anishathalye/dotbot) to install by running "./install" after cloning. This will create symlinks in the home directory for each of the config files and download any necessary plugins. Dotbot will display any errors in the output messages.

Included Configurations
-----------------------

### neovim
Neovim configuration. Uses [packer](https://github.com/wbthomason/packer.nvim) as a package manager. See [plugins](neovim/lua/plugins.lua) and [settings](neovim/lua/settings.lua).

### zshrc
Configuration for the ZSH shell. Uses [zinit](https://github.com/zdharma/zinit) for plugin management. Includes a powerline theme and is configured for the included font. Uses a custom file as a symlink to allow for local editing and adjustment of some options.

Tweaks:
 - Use rsync for local copies
 - Autoload zsh completions
 - Use PowerLevel10K 2-line prompt

Plugins:
 - [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
 - [systemd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd)
 - [history](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh)
 - [history-search-multi-word](https://github.com/zdharma/history-search-multi-word)
 - [zsh-completions](https://github.com/zsh-users/zsh-completions)
 - [ls](https://github.com/zpm-zsh/ls)
 - [ssh](https://github.com/zpm-zsh/ssh)
 - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
 - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
 - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### i3
I use i3wm as my window manager, so I keep my config for that here. My statusbar is provided by py3status.

### kitty
Configuration for kitty terminal


### scripts
Wrapper scripts for various functions
