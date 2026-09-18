#!/bin/bash
# Chemin absolu vers la musique (à adapter selon l'emplacement final dans le bundle)
# 1. Trouver le chemin ABSOLU du script lui-même
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 2. Chemin vers le fichier MP3 (dans le même dossier que le script)
MUSIQUE_PATH="$SCRIPT_DIR/metal.mp3"

osascript -e 'set volume output volume 100'

# Vérifier que le fichier existe
if [ -f "$MUSIQUE_PATH" ]; then
    afplay "$MUSIQUE_PATH" >/dev/null 2>&1 &
else
    echo "Fichier metal.mp3 introuvable à $MUSIQUE_PATH"
    exit 1
fi