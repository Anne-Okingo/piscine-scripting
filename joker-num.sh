#!/bin/bash

# Validate argument
if [ $# -ne 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ] || [ "$1" -gt 100 ]; then
  echo "Error: wrong argument"
  exit 1
fi

secret=$1
tries=5
attempts=0

# Loop while tries remain
while [ $tries -gt 0 ]; do
  echo "Enter your guess ($tries tries left):"
  read -r guess

  # If empty or not an integer -> ask again without decrementing tries
  if [[ -z "$guess" || ! "$guess" =~ ^-?[0-9]+$ ]]; then
    continue
  fi

  # Ensure it's within 1..100.
  if [ "$guess" -lt 1 ] || [ "$guess" -gt 100 ]; then
    continue
  fi

  # Valid guess: count the attempt
  attempts=$((attempts + 1))

  if [ "$guess" -eq "$secret" ]; then
    echo "Congratulations, you found the number in $attempts moves!"
    exit 0
  elif [ "$guess" -gt "$secret" ]; then
    echo "Go down"
  else
    echo "Go up"
  fi

  # Decrement tries after a valid (but incorrect) guess
  tries=$((tries - 1))
done

# Out of tries
echo "You lost, the number was $secret"