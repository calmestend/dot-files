#!/usr/bin/env bash
# Parse Unity's arguments: filepath:line:column
file="$1"

# Extract line number if provided (Unity format: file.cs:line:column)
if [[ "$file" =~ ^(.+):([0-9]+):([0-9]+)$ ]]; then
    filepath="${BASH_REMATCH[1]}"
    line="${BASH_REMATCH[2]}"
    column="${BASH_REMATCH[3]}"
    
    # Open Ghostty with neovim at the specific line
    ghostty -e nvim "+$line" "$filepath"
else
    # No line number, just open the file
    ghostty -e nvim "$file"
fi
