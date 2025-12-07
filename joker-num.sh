#!/bin/bash

# --- Validate argument count ---
if [ $# -ne 1 ]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

SECRET=$1

# --- Check secret number is numeric and between 1 and 100 ---
if ! [[ $SECRET =~ ^[0-9]+$ ]] || [ "$SECRET" -lt 1 ] || [ "$SECRET" -gt 100 ]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

TRIES=5
MOVE_COUNT=0

while [ $TRIES -gt 0 ]; do
    echo "Enter your guess ($TRIES tries left):"
    read guess

    # Validate guess (must be numeric)
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        continue  # invalid input, try again without reducing TRIES
    fi

    MOVE_COUNT=$((MOVE_COUNT + 1))

    # Compare guess with secret
    if [ "$guess" -eq "$SECRET" ]; then
        echo "Congratulations, you found the number in $MOVE_COUNT moves!"
        exit 0
    elif [ "$guess" -lt "$SECRET" ]; then
        echo "Go up"
    else
        echo "Go down"
    fi

    # Reduce remaining tries after valid guess
    TRIES=$((TRIES - 1))
done

# If player runs out of tries
echo "You lost, the number was $SECRET"
