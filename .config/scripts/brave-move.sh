#!/bin/bash
# Move the second *real* Brave Browser window (ignores PiP) to workspace 4

aerospace list-windows --all \
| grep "Brave Browser" \
| grep -v "Picture in Picture" \
| sort -n \
| awk '{print $1}' \
| sed -n '2p' \
| while read -r window_id; do
    if [ -n "$window_id" ]; then
        aerospace move-node-to-workspace --window-id "$window_id" 4
    fi
done
