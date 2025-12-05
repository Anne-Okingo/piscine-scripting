#!/usr/bin/env bash

# 1. Check if exactly two arguments are provided
# We use [[ ]] because the 'test' command ( [ ] ) is not allowed.
if [[ "$#" -ne 2 ]]; then
    echo "Error: two numbers must be provided."
    exit
fi

# 2. Check if both arguments are integers
# We assign the regex to a variable to ensure compatibility across different Bash versions.
# Pattern matches:
# ^       : Start of string
# [+-]?   : Optional plus or minus sign
# [0-9]+  : One or more digits
# $       : End of string
re='^[+-]?[0-9]+$'

if ! [[ "$1" =~ $re ]] || ! [[ "$2" =~ $re ]]; then
    echo "Error: both arguments must be integers."
    exit
fi

# 3. Check for division by zero
# We use 'bc' for the comparison to handle very large integers correctly.
# This also handles numbers with leading zeros (e.g., 00) correctly as decimal, not octal.
if [[ $(echo "$2 == 0" | bc) -eq 1 ]]; then
    echo "Error: division by zero is not allowed."
    exit
fi

# 4. Perform the division
# 'bc' performs integer division by default when scale is not set.
echo "$1 / $2" | bc
