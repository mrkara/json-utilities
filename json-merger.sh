#!/bin/bash

# Check if at least one json file is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <jsonFile1.json> [jsonFile2.json] ..."
    exit 1
fi

echo "[" > merged.json # Start of the JSON array

# Iterate over all arguments
for file in "$@"
do
    if [ ! -f "$file" ]; then
        echo "File $file not found!"
        exit 1
    fi

    # Add comma between files, except for the first one
    if [ "$file" != "$1" ]; then
        echo "," >> merged.json
    fi

    # Remove the last character (newline) from the json file and append it to the merged file
    cat "$file" | head -c -1 >> merged.json
done

echo "]" >> merged.json # End of the JSON array

echo "JSON files have been merged into merged.json"

