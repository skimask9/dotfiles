#!/bin/bash

# Check if there's a Sidecar Display (AirPlay) monitor
# Sidecar displays typically have "iPad" or "Sidecar" in their name
sidecar_monitor=$(aerospace list-monitors --format '%{monitor-name}' | grep -i -E "(ipad|sidecar|airplay)")

if [ -n "$sidecar_monitor" ]; then
    # If Sidecar display is detected, move second Brave window to workspace 10
    target_workspace="10"
    echo "Sidecar display detected: $sidecar_monitor"
    echo "Moving second Brave Browser window to workspace $target_workspace"
else
    # If no Sidecar display, move to workspace 4 (original behavior)
    target_workspace="4"
    echo "No Sidecar display detected, moving to workspace $target_workspace"
fi

# Get second Brave Browser window and move it to the target workspace
aerospace list-windows --all | grep "Brave Browser" | awk '{print $1}' | sort -n | tail -1 | while read window_id; do
    if [ -n "$window_id" ]; then
        echo "Moving window ID $window_id to workspace $target_workspace"
        aerospace move-node-to-workspace --window-id "$window_id" "$target_workspace"
    else
        echo "No second Brave Browser window found"
    fi
done
