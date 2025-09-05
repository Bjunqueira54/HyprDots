#!/bin/bash

if [[ -z $(eww active-windows | grep 'calender') ]]; then
    eww open calender --screen $(./bar/popup-menus/scripts/get-monitor.sh) && eww update calrev=true
else
    eww update calrev=false
    (sleep 0.2 && eww close calender) &
fi
