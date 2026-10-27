#!/usr/bin/env bash
# Usage: ./14-count-files.sh [folder]

# Use the first argument, or "." (current folder) if none was given
folder="${1:-.}"

# -d tests "is this a directory?"
if [[ ! -d "$folder" ]]; then
  echo "Not a folder: $folder"
  exit 1
fi

count=0
# "$folder"/* expands to every item inside the folder
for item in "$folder"/*; do
  # -f = regular file (skips subfolders)
  if [[ -f "$item" ]]; then
    count=$((count + 1))     # add 1 to the counter
  fi
done

echo "$count files in $folder"
