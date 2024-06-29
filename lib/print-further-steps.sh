#!/usr/bin/env bash

LIBDIR="$(dirname "${BASH_SOURCE[0]}")"
filename="$LIBDIR/further-steps.txt"

# Check if the file exists
if [ -f "$filename" ]; then
    cat "$filename"
else
    echo "File $filename does not exist."
fi
echo
