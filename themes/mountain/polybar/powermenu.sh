#!/bin/sh

cmd=$(echo -e "\tpoweroff\n痢\treboot" | rofi -dmenu -p '' -l 2 -width 30 | awk '{print $2}')

[[ -n $cmd ]] && sh -c $cmd
