#!/bin/bash

TMUX="/opt/homebrew/bin/tmux"

# Check if any tmux sessions exist
if $TMUX list-sessions >/dev/null 2>&1; then
  # Attach to the last used (default behaviour of tmux attach)
  exec $TMUX attach-session
else
  echo "No tmux sessions running. Dropping into normal shell..."
  exec $SHELL -l
fi
