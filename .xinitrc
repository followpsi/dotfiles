#!/bin/sh

xrandr -r 120
xset -dpms m 0 0 s off
setxkbmap -layout us,ru -option grp:ctrl_shift_toggle,caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'

while true; do
    xsetroot -name "$(date +%T)"
    sleep 1
done &

exec dwm
