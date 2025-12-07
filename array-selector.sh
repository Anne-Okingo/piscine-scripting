#!/bin/bash

# Define array
colors=("red" "blue" "green" "white" "black")

# Error if number of arguments is not 1
if [[ $# -ne 1 ]]; then
    echo "Error"
fi

arg="$1"

re='^[+-]?[0-9]+$'


# Check if argument is a number (integer only)
if ! [[ "$arg" =~ $re ]]; then
    echo "Error"

fi

# Convert 1-based input to 0-based index
index=$((arg - 1))

# Check range
if [[ $index -lt 0 || $index -ge ${#colors[@]} ]]; then
    echo "Error"
fi

# Print element
echo "${colors[$index]}"
