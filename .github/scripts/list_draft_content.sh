#!/bin/bash

CONTENT_DIR=${1:-"content"}
OUTPUT_FILE=${2:-"draftStatus.txt"}

echo "Listing *only* draft markdown files in $CONTENT_DIR..."

> "$OUTPUT_FILE"

find "$CONTENT_DIR" -name '*.md' | while read -r file; do
  if grep -iqE "^draft *= *true" "$file"; then
    echo "$file" >> "$OUTPUT_FILE"
  fi
done

echo "Draft status saved in $OUTPUT_FILE"
