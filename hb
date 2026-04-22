#!/bin/bash

DIR="/home/$USER/MEGA/vimwiki"
INPUT=$(echo "$1" | tr '[:upper:]' '[:lower:]')

rm "$DIR/bash.wiki"
cat ~/scripts/dot/bashrc >> "$DIR/bash"
cat ~/scripts/dot/bash_profile >> "$DIR/bash"
# Find a file in the directory matching case-insensitively
FILENAME=$(find "$DIR" -maxdepth 1 -type f -iname "${INPUT}" | head -n 1)

if [ -n "$FILENAME" ]; then
    echo "File '$FILENAME' exists."
    bat --style=plain "$FILENAME"
    exit 0
fi
FILENAME=$(find "$DIR" -maxdepth 1 -type f -iname "${INPUT}.wiki" | head -n 1)
if [ -n "$FILENAME" ]; then
    echo "File '$FILENAME' exists."
    bat --style=plain "$FILENAME"
else
    ls "$DIR" | sed 's/.wiki//g' | bat
    # echo "File '$DIR/$1.wiki' does not exist (case-insensitive search)."
    exit 1
fi
