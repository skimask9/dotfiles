#!/bin/bash
set -e

# Get all monitors
all_monitors=$(aerospace list-monitors | awk '{print $1}')
focused_monitor=$(aerospace list-monitors --focused | awk '{print $1}')

# Find the unfocused monitor
unfocused_monitor=""
for monitor in $all_monitors; do
    if [ "$monitor" != "$focused_monitor" ]; then
        unfocused_monitor="$monitor"
        break
    fi
done

if [ -z "$unfocused_monitor" ]; then
    echo "Only one monitor detected or unable to find unfocused monitor"
    exit 1
fi

echo "Focused monitor: $focused_monitor"
echo "Unfocused monitor: $unfocused_monitor"

# Find PiP windows on the FOCUSED monitor only
# This prevents moving windows back and forth
pip_windows=$(aerospace list-windows --monitor "$focused_monitor" | grep -iE "(pip|picture.in.picture|floating)" | awk '{print $1}' || true)

if [ -z "$pip_windows" ]; then
    echo "No PiP windows found on focused monitor $focused_monitor"
    exit 0
fi

echo "Found PiP windows on focused monitor: $pip_windows"

# Move each PiP window from focused monitor to unfocused monitor
echo "$pip_windows" | while IFS= read -r window_id; do
    if [ -n "$window_id" ]; then
        echo "Moving PiP window $window_id from focused monitor $focused_monitor to unfocused monitor $unfocused_monitor"
        aerospace move-node-to-monitor --window-id "$window_id" "$unfocused_monitor" < /dev/null
        echo "Moved window $window_id"
    fi
done

echo "PiP windows moved to unfocused monitor"
