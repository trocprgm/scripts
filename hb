#!/bin/bash

DIR="/home/$USER/MEGA/vimwiki"
INPUT=$(echo "$1" | tr '[:upper:]' '[:lower:]')

rm "$DIR/bash"
cp ~/scripts/dot/vimrc "$DIR/vimrc"
cp ~/scripts/dot/tmux.conf "$DIR/tmux.conf"
cp ~/scripts/dot/xinitrc "$DIR/xinitrc"
cat ~/scripts/dot/bash_profile >> "$DIR/bash"
cat ~/scripts/dot/bashrc >> "$DIR/bash"
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
