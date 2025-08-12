#!/bin/bash

mapfile -t sinks < <(pw-adump | jq -r ' 
    . [] | select(.type == "Pipewire:Node") |
    select(.info.props."media.class" == "Audio/Sink") |
    "\(.id)|\(.info.props."node.description")"
')

CHOICE=$(printf "%s\n" "${sinks[@]}" | sed 's/|/ - /' | wofi --dmenu --cache-file /dev/null --prompt "Select Audio Output")

DEVICE_ID=$(printf "%s" "$CHOICE" | awk -F ' - ' '{print $1}')

[ -n "$DEVICE_ID" ] && wpctl set-default "$DEVICE_ID"
