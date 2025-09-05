#!/bin/bash

echo $PWD > ~/eww.log

if [[ -z $(eww active-windows | grep 'media') ]]; then
	eww open media --screen $(./bar/popup-menus/scripts/get-monitor.sh) && eww update mediarev=true
else
	eww update mediarev=false
	(sleep 0.2 && eww close media) &
fi
