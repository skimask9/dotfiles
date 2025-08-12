#!/bin/bash
# Move second Brave Browser window to workspace 4
aerospace list-windows --all | grep "Brave Browser" | awk '{print $1}' | sort -n | tail -1 | while read window_id; do
    if [ -n "$window_id" ]; then
        aerospace move-node-to-workspace --window-id "$window_id" "4"
    fi
done


