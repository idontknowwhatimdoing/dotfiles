#!/usr/bin/bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d: -f1); do
    MONITOR=$m polybar -r mybar >>/tmp/polybar1.log &
done
