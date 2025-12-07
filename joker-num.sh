#!/bin/bash

# Validate argument count and value
if [[ $# -ne 1 ]] || ! [[ $1 =~ ^[0-9]+$ ]] || [[ $1 -lt 1 ]] || [[ $1 -gt 100 ]]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

secret=$1
max_tries=5

for (( i=1; i<=max_tries; i++ )); do
    tries_left=$(( max_tries - i + 1 ))

    # Prompt for guess
    echo -n "Enter your guess ($tries_left tries left): "
    read guess

    # Check if input is a valid number
    while ! [[ "$guess" =~ ^[0-9]+$ ]]; do
        echo -n "Enter your guess ($tries_left tries left): "
        read guess
    done

    # Compare guess with secret
    if [[ $guess -eq $secret ]]; then
        echo "Congratulations, you found the number in $i moves!"
        exit 0
    elif [[ $guess -lt $secret ]]; then
        echo "Go up"
    else
        echo "Go down"
    fi
done

# If player runs out of tries
echo "You lost, the number was $secret"
