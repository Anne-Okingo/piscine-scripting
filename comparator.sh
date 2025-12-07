#!/bin/bash

# Check number of arguments
if [[ $# -ne 2 ]]; then
    echo "Error: The script only works with two arguments!"
    exit 1
fi

# Assign arguments
arg1=$1
arg2=$2

# Check if both arguments are numbers
if ! [[ $arg1 =~ ^[0-9]+$ ]] || ! [[ $arg2 =~ ^[0-9]+$ ]]; then
    echo "Error: Only two numeric arguments are acceptable!"
    exit 1
fi

# Compare the numbers
if [[ $arg1 -gt $arg2 ]]; then
    echo "$arg1 > $arg2"
elif [[ $arg1 -lt $arg2 ]]; then
    echo "$arg1 < $arg2"
else
    echo "$arg1 = $arg2"
fi
