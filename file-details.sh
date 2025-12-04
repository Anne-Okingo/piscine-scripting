#!/bin/bash

DIR="hard-perm"

if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' folder not found. Run this script from the directory containing '$DIR'."
    exit 1
fi

ls -l --time-style="+%F %R" "$DIR" \
    | sed '1d' \
    | awk '{print $1, $6, $7, $8}'
