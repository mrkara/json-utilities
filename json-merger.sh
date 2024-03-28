#!/bin/bash

# Check if at least one json file is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <jsonFile1.json> [jsonFile2.json] ..."
    exit 1
fi

# Start the merged JSON array
echo -n "[" > merged.json

# Track the first file to handle comma insertion
first_file=1

# Iterate over all arguments
for file in "$@"
do
    if [ ! -f "$file" ]; then
        echo "File $file not found!"
        exit 1
    fi

    # Add comma before the current file if it's not the first one
    if [ "$first_file" -ne 1 ]; then
        echo -n "," >> merged.json
    else
        first_file=0
    fi

    # Append the content of the current file to merged.json
    cat "$file" >> merged.json
done

# Close the JSON array
echo "]" >> merged.json

echo "JSON files have been merged into merged.json"

