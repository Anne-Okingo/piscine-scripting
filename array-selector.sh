#!/usr/bin/env bash

array=("red" "blue" "green" "white" "black")

if [[ "$#" -ne 1 ]] || ! [[ $1 =~ ^-?[0-9]+$ ]]; then
    echo "Error"
else
    index=$(($1 - 1))

    if [[ $index -lt 0 ]] || [[ $index -ge ${#array[@]} ]]; then
        echo "Error"
    else
        echo "${array[$index]}"
    fi
fi