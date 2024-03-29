#!/usr/local/bin/bash

# Terminate already running instances of the bar
killall -q polybar

# Wait for the processes to shut down
while pgrep -u $UID -x polybar  > /dev/null; do sleep 1; done

# Launch the bar
polybar morgareth -c .config/polybar/config   &

echo "Launched the main bar ..."
