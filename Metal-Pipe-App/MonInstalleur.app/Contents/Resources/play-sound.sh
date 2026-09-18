#!/bin/bash
# Absolute path to the mp3 file

# Find the absolute path of the script itself
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the MP3 file (same folder as the script)
MUSIQUE_PATH="$SCRIPT_DIR/metal.mp3"

# Set volume to maximum
osascript -e 'set volume output volume 100'

# Check if the file exists
if [ -f "$MUSIQUE_PATH" ]; then
    afplay "$MUSIQUE_PATH" >/dev/null 2>&1 &
else
    echo "metal.mp3 file not found at $MUSIQUE_PATH"
    exit 1
fi