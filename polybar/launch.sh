#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch example
#polybar TopLeft &
polybar -l info FullBottom &
polybar -l info top &

echo "Bars launched..."
