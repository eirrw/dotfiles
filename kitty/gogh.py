"""
Download themes from Gogh (https://github.com/Mayccoll/Gogh) formatted for kitty.

Usage:
    python gogh-to-kitty.py {theme}

Example:
    $ python gogh-to-kitty.py maia
    DONE -> theme.maia.conf
"""
import os
import re
import requests
import sys

GOGH_URL = 'https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/{theme}.sh'

REGEX_COLOR = r" COLOR.*\"(#[A-Fa-f0-9]{6})\""
REGEX_BG = r"BACKGROUND_COLOR.*\"(#[A-Fa-f0-9]{6})\""
REGEX_FG = r"FOREGROUND_COLOR.*\"(#[A-fa-f0-9]{6})\""
REGEX_CC = r"CURSOR_COLOR.*\"(#[A-Fa-f0-9]{6})\""

FILE_FORMAT = 'theme.{theme}.conf'
KITTY_CONF = 'theme.conf'

COLOR_X  = 'color{x:<5}  {color}\n'
COLOR_BG = 'background  {color}\n'
COLOR_FG = 'foreground  {color}\n'
COLOR_CC = 'cursor      {color}\n'

if len(sys.argv) != 2:
    print('Invalid arguments')
    exit(1)

theme = sys.argv[1]

r = requests.get(GOGH_URL.format(theme = theme))
if r.status_code != 200:
    print("Error retreiving theme. Reason: {reason}".format(reason = r.reason))
    exit(r.status_code)

gogh_data = r.text

colors = re.findall(REGEX_COLOR, gogh_data)
bg_color = re.findall(REGEX_BG, gogh_data)[0]
fg_color = re.findall(REGEX_FG, gogh_data)[0]
cc_color = re.findall(REGEX_CC, gogh_data)
if len(cc_color) == 0:
    cc_color = fg_color
else:
    cc_color = cc_color[0]

with open(FILE_FORMAT.format(theme = theme), 'x') as f:
    for i in range(len(colors)):
        f.write(COLOR_X.format(x = i, color = colors[i]))
    f.write("\n")
    f.write(COLOR_BG.format(color = bg_color))
    f.write(COLOR_FG.format(color = fg_color))
    f.write(COLOR_CC.format(color = cc_color))

conf = input(f"Add to kitty config file ({KITTY_CONF})? [Y/n] ")
if (conf in 'Yy' or conf == ''):
    with open(os.path.expanduser(KITTY_CONF), 'a') as f:
        f.write("#include $HOME/.dotfiles/theme/" + FILE_FORMAT.format(theme = theme) + "\n")

print("DONE -> " + FILE_FORMAT.format(theme = theme))
