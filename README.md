# dotfiles
Contains a selection of configuration files used across my systems.

### Installation
The dotfiles are managed by an Ansible playbook. Use `./install` to install. The script will soucre the included env
file so that the installation evironment is set up as expected, then execute the playbook. The `config` file or a comma-
separated list of Ansible tags can be passed to the script to limit or otherwise change what is installed.

Configurations
--------------

### fish
A custom config setup for the fish shell.

### profile
Basic [environment](roles/profile/files/environment.sh) and login shell setup

### prompt
Installation and configuration for a cross-shell prompt built on
[oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh). Used by [fish](#fish) if installed.

### neovim
Neovim configuration. See [init](roles/config/files/nvim/init.lua) and
[plugins](roles/config/files/nvim/lua/plugins.lua) for basic config.

### fnm
Installation of the [fnm](https://github.com/Schniz/fnm) version manager for node. Cross-shell compatible and set up for
fish.

### i3
Configuration for i3 window manager. Uses [py3status](https://github.com/ultrabug/py3status) for a status line.

#### py3status
Configs to provide a customizable status bar for i3.

#### rofi
Configs for [rofi](https://github.com/davatorium/rofi), used as an application launcher and switcher.

#### gui-scripts
Supporting scripts for i3 and rofi.

### kitty
Configuration for the [kitty](https://sw.kovidgoyal.net/kitty/) terminal.

### utils
Installs several supporting utilities for both GUI and CLI.

Deprecated
----------

### zsh
Configuration for the ZSH shell. See [zshrc](roles/config/files/zsh/.zshrc) for base configuration.

### vim
A basic vimrc is included for use on machines where neovim is unavailable.

### nvm
An easy installation method for the [nvm](https://github.com/nvm-sh/nvm) version manager for node. Usable by [zsh](#zsh).
