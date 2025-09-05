#!/bin/bash

if [[ -z $(eww active-windows | grep 'dash') ]]; then
	eww open dash --screen $(./bar/popup-menus/scripts/get-monitor.sh) && eww update dashrev=true
else
	eww update dashrev=false
	(sleep 0.5 && eww close dash) &
fi
