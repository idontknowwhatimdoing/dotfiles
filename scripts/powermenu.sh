#!/bin/sh

THEME=$(cat ~/.dotfiles/.current)
cmd=$(echo "\tpoweroff\n痢\treboot" | rofi -theme $THEME -theme-str 'inputbar { enabled: false; }' -dmenu -p '' -l 2 -width 30 | awk '{print $2}')

[ -n "$cmd" ] && sh -c $cmd
