#!/bin/bash

# json-linter.sh

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install jq to use this script."
    exit 1
fi

# Check for the right usage and if the file exists
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <jsonFile.json>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File $1 not found!"
    exit 1
fi

# Lint JSON file
if jq empty "$1" > /dev/null 2>&1; then
    echo "Valid JSON"
else
    echo "Invalid JSON"
fi

