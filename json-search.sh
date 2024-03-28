#!/bin/bash

# json-search.sh

# Check for jq installation
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install jq to use this script."
    exit 1
fi

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <jsonFile.json> <searchTerm>"
    exit 1
fi

# Variables for script arguments
json_file=$1
search_term=$2

# Search the JSON file for the search term
jq --arg term "$search_term" '.. | select(type == "string" and contains($term))' "$json_file"

