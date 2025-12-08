#!/bin/bash

# Check correct number of arguments
if [ "$#" -ne 1 ]; then
  echo "Error: expect 1 argument only!" >&2
  exit 1
fi

num_students="$1"

declare -a names
declare -a grades

# Loop to collect input
for ((i=1; i<=num_students; i++)); do
  read -p "Student Name #$i: " name
  read -p "Student Grade #$i: " grade

  # Validate grade: must be numeric (integer) and 0–100
  if ! [[ "$grade" =~ ^[0-9]+$ ]] || [ "$grade" -gt 100 ]; then
    echo "Error: The grade '$grade' is not a valid input. Only numerical grades between 0 and 100 are accepted." >&2
    exit 1
  fi

  names+=("$name")
  grades+=("$grade")
done

# Evaluation output
for ((i=0; i<num_students; i++)); do
  name="${names[$i]}"
  grade="${grades[$i]}"

  if [ "$grade" -ge 90 ]; then
    echo "$name: You did an excellent job!"
  elif [ "$grade" -ge 70 ]; then
    echo "$name: You did a good job!"
  elif [ "$grade" -ge 50 ]; then
    echo "$name: You need a bit more effort!"
  else
    echo "$name: You had a poor performance!"
  fi
done
