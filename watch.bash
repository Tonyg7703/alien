#!/bin/bash

inotifywait -q -m -r -e modify,create,delete "$ALIEN_DIR" \
  --exclude "modules" | while read -r dir event file; do
  clear
  echo "👁️  watching $dir$file"

  if [[ "$event" == *"MODIFY"* ]]; then
    bash "$dir$file"
  fi
done
