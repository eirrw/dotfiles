#!/usr/bin/env bash
revert() {
    xset dpms 0 0 0
    xset dpms force on
    pkill -xu $EUID i3lock
}
trap revert EXIT

capture() {
    maim $1
    convert $1 -scale 10% -scale 1000% $1
}

IMG=/tmp/lock.png

xset dpms 30 30 30

if [ -n "${XSS_SLEEP_LOCK_FD}" ] && [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
    capture $IMG {XSS_SLEEP_LOCK_FD}<&-

    # we have to make sure the locker does not inherit a copy of the lock fd
    i3lock -ef -i $IMG -p default {XSS_SLEEP_LOCK_FD}<&-

    # now close our fd (only remaining copy) to indicate we're ready to sleep
    exec {XSS_SLEEP_LOCK_FD}<&-
else 
    capture $IMG
    i3lock -ef -i $IMG -p default
fi

# Wait for i3lock to exit.
tail --pid="$(pidof -s i3lock)" -f /dev/null
