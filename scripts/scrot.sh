#!/bin/env bash

usage() {
    echo "scrot: takes screenshots"
    echo ""
    echo "Screenshots are placed in \${XDG_PICTURES_DIR}/screenshots, named as a datetime stamp"
    echo ""
    echo "One of the following options is required"
    echo "  screen"
    echo "    takes a screenshot of the entire display"
    echo ""
    echo "  select"
    echo "    takes a screenshot of a drawn selection"
    echo ""
    echo "  window"
    echo "    takes a screenshot of the currently active window"
}


source ~/.config/user-dirs.dirs

FILE_NAME=$(date +%Y%m%d%H%M%S).png
SCREENSHOTS_DIR=${XDG_PICTURES_DIR}/screenshots

if [[ ! -e ${SCREENSHOTS_DIR} ]]; then
    mkdir -p ${SCREENSHOTS_DIR}
fi

if [[ 'screen' == $1 ]]; then
    # screen
    maim_opt=""
elif [[ 'select' == $1 ]]; then
    # select
    maim_opt="-s"
elif [[ 'window' == $1 ]]; then
    # window
    maim_opt="-i $(xdotool getactivewindow)"
else
    usage
    exit 1
fi

maim ${maim_opt} | tee ${SCREENSHOTS_DIR}/${FILE_NAME} | xclip -selection clipboard -t image/png
