#!/usr/bin/bash

killall -q polybar

for m in $(polybar --list-monitors | awk -F: '{print $1}'); do
    MONITOR=$m polybar -r bar >>/tmp/polybar1.log &
done
