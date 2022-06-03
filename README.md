# .dotfiles
Contains a selection of configuration files used across my systems.

### Installation
The dotfiles are managed by an Ansible playbook. Use `ansible-playbook -i hosts playbool.yml` to install.

Included Configurations
-----------------------

### neovim
Neovim configuration. See [plugins](neovim/lua/plugins.lua) and [settings](neovim/lua/settings.lua).

### zshrc
Configuration for the ZSH shell. Includes a powerline theme and is configured for the included font.

### i3
Configuration for i3 window manager

### kitty
Configuration for kitty terminal
