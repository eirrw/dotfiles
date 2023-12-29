# dotfiles
Setup scripts and configuration files used across my systems. Designed for use on modern versions (37+) of Fedora Linux,
though the config files themselves should be fairly cross-compatible.

## Installation
The dotfiles are managed by an Ansible playbook. Use `./install` to install. The script will soucre the included env
file so that the installation evironment is set up as expected, then execute the playbook. A comma-separated list of
Ansible tags can be passed to the script to limit or otherwise change what is installed. Use the environment variables
`DOT_XORG` or `DOT_WAYLAND` to specify the desktop environment to install.

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
Sets up a tiling window manager, either either [i3]  (Xorg) or [Sway]  (Wayland). Uses one of [py3status] or [Waybar]
for a status line and [rofi] as an app launcher and switcher, along with a number of custom supporting scripts.

### kitty
Configuration for the [Kitty] terminal.

<!--- external links --->
[starship]: https://starship.rs/ "Starship"
[fnm]: https://github.com/Schniz/fnm "FNM"
[i3]: https://i3wm.org/ "i3 WM"
[sway]: https://swaywm.org/ "Sway"
[rofi]: https://github.com/davatorium/rofi "rofi"
[py3status]: https://github.com/ultrabug/py3status "py3status"
[waybar]: https://github.com/Alexays/Waybar "Waybar"
[kitty]: https://sw.kovidgoyal.net/kitty/ "Kitty"
[fish]: https://fishshell.com/ "fish shell"
[neovim]: https://neovim.io/ "Neovim"
[lazy.nvim]: https://github.com/folke/lazy.nvim "lazy.nvim"
