#!/usr/bin/env bash

monitor="${WAYBAR_OUTPUT_NAME:-}"

# Don't display anything if Waybar hasn't supplied a monitor.
[[ -n "$monitor" ]] || exit 0

hyprctl monitors -j |
    jq -r --arg monitor "$monitor" \
    '.[] | select(.name == $monitor) | .activeWorkspace.name'
