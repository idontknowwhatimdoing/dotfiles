#!/usr/bin/env bash
killall -q polybar

for m in $(polybar --list-monitors | cut -d: -f1); do
    MONITOR=$m polybar -r bar >>/tmp/polybar1.log &
done
