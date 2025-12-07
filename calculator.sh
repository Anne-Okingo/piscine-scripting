#!/bin/bash

# Functions for each operation
do_add() {
    echo $(( $1 + $2 ))
}

do_sub() {
    echo $(( $1 - $2 ))
}

do_mult() {
    echo $(( $1 * $2 ))
}

do_divide() {
    if [[ $2 -eq 0 ]]; then
        >&2 echo "Error: division by 0"
        exit 2
    fi
    echo $(( $1 / $2 ))
}

# Check number of arguments
if [[ $# -ne 3 ]]; then
    >&2 echo "Error: expect 3 arguments"
    exit 1
fi

# Assign arguments
num1=$1
operator=$2
num2=$3

# Validate numbers
if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
    >&2 echo "Error: invalid number"
    exit 4
fi

# Call the correct function
case $operator in
    "+")
        do_add "$num1" "$num2"
        ;;
    "-")
        do_sub "$num1" "$num2"
        ;;
    "*")
        do_mult "$num1" "$num2"
        ;;
    "/")
        do_divide "$num1" "$num2"
        ;;
    *)
        >&2 echo "Error: invalid operator"
        exit 3
        ;;
esac
