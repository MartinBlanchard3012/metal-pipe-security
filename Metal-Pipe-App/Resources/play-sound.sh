#!/bin/bash
# Chemin absolu vers la musique (à adapter selon l'emplacement final dans le bundle)
MUSIQUE_PATH="$(dirname "$0")/Resources/metal.mp3"

osascript -e 'set volume output volume 100'

# Vérifier que le fichier existe
if [ -f "$MUSIQUE_PATH" ]; then
    afplay "$MUSIQUE_PATH" &
else
    echo "Fichier metal.mp3 introuvable à $MUSIQUE_PATH"
    exit 1
fi