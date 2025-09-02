#!/usr/bin/env bash
set -euo pipefail

# 1) Decide target workspace
monitor_count="$(aerospace list-monitors --count)"   # built-in counter
if [ "$monitor_count" -gt 1 ]; then
  target_workspace="4"
else
  target_workspace="$(aerospace list-workspaces --focused)"
fi

# Move PiP windows (handles both "Picture-in-Picture" and "Picture in Picture")
aerospace list-windows --all | grep -E "(Picture-in-Picture|Picture in Picture)" | awk '{print $1}' | while read -r window_id; do
    if [ -n "$window_id" ]; then
        aerospace move-node-to-workspace --window-id "$window_id" "$target_workspace"
    fi
done
