# dotfiles
Contains a selection of configuration files used across my systems.

### Installation
The dotfiles are managed by an Ansible playbook. Use `./install` to install. The script will soucre the included zshenv
so that the installation evironment is set up as expected, then execute the playbook. A comma-separated list of Ansible
tags can be passed to the script to limit or otherwise change what is installed.

Included Configurations
-----------------------

### neovim
Neovim configuration. See [init](roles/config/files/nvim/init.lua) and [plugins](roles/config/files/nvim/lua/plugins.lua) for basic config.

### vim
A basic vimrc is included for use on machines where neovim is unavailable.

### zshrc
Configuration for the ZSH shell. See [zshrc](roles/config/files/zsh/.zshrc) for base configuration.

### i3
Configuration for i3 window manager. Uses [py3status](https://github.com/ultrabug/py3status) for a status line.

### kitty
Configuration for kitty terminal.
