#!/bin/bash

# Configuration
NAME="MyScript"
EXEC_PATH="/path/to/your/script.sh"
ICON_PATH="/path/to/icon.png"
DESKTOP_FILE="$HOME/Desktop/$NAME.desktop"

# Create the .desktop file
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=$NAME
Comment=Run my custom script
Exec=$EXEC_PATH
Icon=$ICON_PATH
Terminal=true
Categories=Application;" > "$DESKTOP_FILE"

# Make it executable
chmod +x "$DESKTOP_FILE"

echo "Shortcut created at $DESKTOP_FILE"