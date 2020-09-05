#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
MONITOR="DP-0" polybar --reload main &
MONITOR="DP-4" polybar --reload secondary &
MONITOR="DVI-I-0" polybar --reload vertical &

echo "Polybar launched..."
