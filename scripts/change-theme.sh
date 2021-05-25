#!/bin/sh

theme=$(ls ~/.dotfiles/themes | rofi -dmenu -p '' -l 3 -width 20)
[ -n "$theme" ] && ~/.dotfiles/scripts/set-theme.sh $theme
