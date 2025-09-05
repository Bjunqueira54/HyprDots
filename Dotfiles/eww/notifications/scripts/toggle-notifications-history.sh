#!/usr/bin/env sh

if [[ -z $(eww active-windows | grep 'history-frame') ]]; then
	eww open history-frame --screen $(./bar/popup-menus/scripts/get-monitor.sh) && eww update notifhisrev=true
else
	eww update notifhisrev=false
	(sleep 0.5 && eww close history-frame) &
fi
