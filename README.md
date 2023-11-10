# dotfiles
Contains a selection of configuration files used across my systems.



## Installation
The dotfiles are managed by an Ansible playbook. Use `./install` to install. The script will soucre the included env
file so that the installation evironment is set up as expected, then execute the playbook. A comma-separated list of
Ansible tags can be passed to the script to limit or otherwise change what is installed.

### Requirements
- Fedora Linux
- ansible

## Configurations

### fish shell
A custom config setup for the [fish shell][fish].

### starship prompt
Installation and configuration for a cross-shell prompt built on [starship].

### neovim
Featureful [Neovim] configuration using [lazy.nvim].

### fnm
Installation of the [fnm] version manager for node.

### i3 / swaywm
Sets up a tiling window manager, allowing either Xorg ([i3]) or Wayland ([sway]). Uses [py3status] for a status line and
[rofi] as an app launcher and switcher.

### kitty
Configuration for the [Kitty] terminal.

<!--- external links --->
[starship]: https://starship.rs/ "Starship"
[fnm]: https://github.com/Schniz/fnm "FNM"
[i3]: https://i3wm.org/ "i3 WM"
[sway]: https://swaywm.org/ "Sway"
[rofi]: https://github.com/davatorium/rofi "rofi"
[py3status]: https://github.com/ultrabug/py3status "py3status"
[kitty]: https://sw.kovidgoyal.net/kitty/ "Kitty"
[fish]: https://fishshell.com/ "fish shell"
[neovim]: https://neovim.io/ "Neovim"
[lazy.nvim]: https://github.com/folke/lazy.nvim "lazy.nvim"
