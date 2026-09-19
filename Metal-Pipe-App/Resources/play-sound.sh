#!/bin/bash

# Resolve all paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"  # Chemin vers MonInstalleur.app
RESOURCES_DIR="$BUNDLE_DIR/Contents/Resources"
MUSIQUE_PATH="$RESOURCES_DIR/metal.mp3"

# Verify presence of our MP3 file
if [ ! -f "$MUSIQUE_PATH" ]; then
    echo "❌ ERREUR : Fichier introuvable à $MUSIQUE_PATH" >&2
    osascript -e 'display alert "Erreur" message "Fichier metal.mp3 introuvable."'
    exit 1
fi

# Volume to the max
osascript -e 'set volume output volume 100'

# Let the metal pipe fall and destroy your victim's ears
afplay "$MUSIQUE_PATH" >/dev/null 2>&1 &

# Unclosable window
MESSAGE="You got trapped by .... This message will stay on your computer. Thanks a lot for participating to this test."
osascript -e '
tell application "System Events"
    activate
    display dialog "'"$MESSAGE"'" ¬
        with title "IT\'S A TRAP !!!!!" ¬
        with icon note ¬
        buttons {"OK"} ¬
        default button 1 ¬
        giving up after 86400 -- 24 heures
end tell
' &