#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch example
#polybar TopLeft &
#polybar -l info FullBottom &
#polybar -l info mainBar &

# Multi monitor setup
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainBar &
  done
else
  polybar --reload example &
fi

echo "Bars launched..."
