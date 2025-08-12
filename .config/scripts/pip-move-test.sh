#!/bin/bash

# Get current focused workspace
current_workspace=$(aerospace list-workspaces --focused)

# Get all monitors
monitors=$(aerospace list-monitors | wc -l)

if [ "$monitors" -ge 2 ]; then
    # Multi-monitor setup: Smart PiP handling
    
    # Get the focused monitor ID and its workspace
    focused_monitor_info=$(aerospace list-monitors --focused)
    focused_monitor=$(echo "$focused_monitor_info" | awk '{print $1}')
    
    # Check if this script was triggered by monitor focus change
    # We detect this by checking command line argument
    if [ "$1" = "--monitor-focus-changed" ]; then
        # Monitor focus changed - move PiP to the newly focused workspace
        target_workspace="$current_workspace"
        echo "Monitor focus changed - moving PiP to focused workspace: $target_workspace"
    else
        # Regular execution - keep PiP on unfocused monitor
        unfocused_workspace=""
        while IFS= read -r monitor_line; do
            monitor_id=$(echo "$monitor_line" | awk '{print $1}')
            if [ "$monitor_id" != "$focused_monitor" ]; then
                unfocused_workspace=$(echo "$monitor_line" | awk '{print $2}')
                break
            fi
        done < <(aerospace list-monitors)
        
        if [ -n "$unfocused_workspace" ]; then
            target_workspace="$unfocused_workspace"
            echo "Regular execution - keeping PiP on unfocused monitor: $target_workspace"
        else
            echo "Could not determine unfocused monitor workspace"
            exit 1
        fi
    fi
    
    # Move all PiP windows to the target workspace
    aerospace list-windows --all | grep -E "(Picture-in-Picture|Picture in Picture)" | while IFS= read -r window_line; do
        window_id=$(echo "$window_line" | awk '{print $1}')
        current_pip_workspace=$(echo "$window_line" | awk '{print $2}')
        
        if [ -n "$window_id" ] && [ "$current_pip_workspace" != "$target_workspace" ]; then
            aerospace move-node-to-workspace --window-id "$window_id" "$target_workspace"
            echo "Moved PiP window $window_id from workspace $current_pip_workspace to $target_workspace"
        fi
    done
    
else
    # Single monitor setup: move PiP to current focused workspace
    aerospace list-windows --all | grep -E "(Picture-in-Picture|Picture in Picture)" | while IFS= read -r window_line; do
        window_id=$(echo "$window_line" | awk '{print $1}')
        if [ -n "$window_id" ]; then
            aerospace move-node-to-workspace --window-id "$window_id" "$current_workspace"
            echo "Moved PiP window $window_id to focused workspace $current_workspace (single monitor)"
        fi
    done
fi
