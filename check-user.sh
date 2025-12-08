#!/bin/bash

# Error: wrong number of arguments
if [ "$#" -ne 2 ]; then
  echo "Error: expect 2 arguments" >&2
  exit 1
fi

flag="$1"
user="$2"

# Validate flag
if [ "$flag" != "-e" ] && [ "$flag" != "-i" ]; then
  echo "Error: unknown flag" >&2
  exit 1
fi

# Get user info from passwd database
info=$(getent passwd "$user")

# Behavior depending on flag
if [ "$flag" = "-e" ]; then
  if [ -n "$info" ]; then
    echo "yes"
  else
    echo "no"
  fi
elif [ "$flag" = "-i" ]; then
  # Print info only if it exists
  if [ -n "$info" ]; then
    echo "$info"
  fi
fih