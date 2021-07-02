#!/bin/sh

charging=$(acpi | awk '{print $3}' | grep -o Charging)
percentage=$(acpi | awk '{print $4}' | tr -d ',%')

[ -z "$charging" ] && [ "$percentage" -le 5 ] && notify-send -u critical 'battery' 'yo bro wtf just plug the alimentation already'
