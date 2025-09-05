#!/usr/bin/env bash

# Get cursor position
cursor_x=$(hyprctl cursorpos -j | jq -r '.x')

# Iterate through monitors
hyprctl monitors -j | jq -c '.[]' | while read -r monitor; do
    id=$(echo "$monitor" | jq -r '.id')
    x=$(echo "$monitor" | jq -r '.x')
    w=$(echo "$monitor" | jq -r '.width')

    if (( cursor_x >= x && cursor_x < x + w )); then
        echo "$id"
		exit 0;
    fi
done