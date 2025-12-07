#!/bin/bash

# --- Validate argument count ---
if [ $# -ne 1 ]; then
       >&2 echo "Error: wrong argument"
    exit 1
fi

SECRET=$1

# --- Check secret number is between 1 and 100 ---
if ! [[ $SECRET =~ ^[0-9]+$ ]] || [ "$SECRET" -lt 1 ] || [ "$SECRET" -gt 100 ]; then
        >&2 echo "Error: wrong argument"
    exit 1
fi

TRIES=5
MOVE_COUNT=0

for ((i=TRIES; i>0; )); do
    echo "Enter your guess ($i tries left):"
    read guess || exit 1

    # If empty or non-numeric → ask again WITHOUT reducing tries
    if [[ -z "$guess" ]] || ! [[ $guess =~ ^[0-9]+$ ]]; then
        continue
    fi

    MOVE_COUNT=$((MOVE_COUNT + 1))

    # Compare
    if [ "$guess" -eq "$SECRET" ]; then
        echo "Congratulations, you found the number in $MOVE_COUNT moves!"
        exit 0
    elif [ "$guess" -gt "$SECRET" ]; then
        echo "Go down"
    else
        echo "Go up"
    fi

    # Only decrease tries AFTER a valid guess
    i=$((i - 1))
done

# If loop ends without finding the number
echo "You lost, the number was $SECRET"
