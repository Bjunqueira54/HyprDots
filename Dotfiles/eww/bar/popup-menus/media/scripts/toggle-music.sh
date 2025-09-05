#!/bin/bash

SCREEN=0
read CX CY <<< "$(hyprctl cursorpos | sed 's/,/ /')"

if [[ $CX -lt 0 ]]; then
	SCREEN=1
elif [[ $CX -gt 1920 ]]; then
	SCREEN=2
fi

if [[ -z $(eww active-windows | grep 'media') ]]; then
	eww open media --screen $SCREEN && eww update mediarev=true
else
	eww update mediarev=false
	(sleep 0.2 && eww close media) &
fi
