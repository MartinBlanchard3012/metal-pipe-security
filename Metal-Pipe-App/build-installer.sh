#!/bin/bash
# Dossiers
APP_NAME="MonInstalleur"
APP_PATH="$APP_NAME.app"
RESOURCES_SRC="Resources"
RESOURCES_DST="$APP_PATH/Contents/Resources"
MACOS_DST="$APP_PATH/Contents/MacOS"

# Créer la structure du bundle
mkdir -p "$MACOS_DST"
mkdir -p "$RESOURCES_DST"

# Copier les ressources
cp "$RESOURCES_SRC"/metal.mp3 "$RESOURCES_DST/"
cp "$RESOURCES_SRC"/play-sound.sh "$RESOURCES_DST/"
cp "$RESOURCES_SRC"/icone.icns "$RESOURCES_DST/"  # Optionnel

# Créer le binaire exécutable (MonInstalleur)
cat > "$MACOS_DST/$APP_NAME" << 'EOF'
#!/bin/bash
BUNDLE_PATH="$(dirname "$0")/../.."
RESOURCES_PATH="$BUNDLE_PATH/Contents/Resources"
"$RESOURCES_PATH/play-sound.sh" &
EOF

# Rendre exécutables
chmod +x "$MACOS_DST/$APP_NAME"
chmod +x "$RESOURCES_DST/play-sound.sh"

# Créer Info.plist
cat > "$APP_PATH/Contents/Info.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>MonInstalleur</string>
    <key>CFBundleName</key>
    <string>Mon Installeur</string>
    <key>CFBundleIdentifier</key>
    <string>com.monorg.moninstalleur</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleIconFile</key>
    <string>icone.icns</string> <!-- Optionnel -->
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOF

echo "Bundle créé : $APP_PATH"