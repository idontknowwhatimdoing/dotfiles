#!/bin/sh

killall -q polybar

echo $THEME

if [ $THEME = 'mountain' ]; then
	for m in $(polybar --list-monitors | awk -F: '{print $1}'); do
		MONITOR=$m polybar -r workspaces >>/tmp/polybar1.log &
		MONITOR=$m polybar -r datetime >>/tmp/polybar1.log &
		MONITOR=$m polybar -r others >>/tmp/polybar1.log &
	done
else
	for m in $(polybar --list-monitors | awk -F: '{print $1}'); do
		MONITOR=$m polybar -r bar >>/tmp/polybar1.log &
	done
fi
