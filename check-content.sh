#!/bin/sh
# Usage: ./check-content.sh <directory>
# Prints the name of any file larger than 50MB within the given directory.

large_files=$(find "assets/" -type f -size +50M)

if [ -n "$large_files" ]; then
    echo "The following files are too large and will be deleted if you commit."
    echo "$large_files"
fi
