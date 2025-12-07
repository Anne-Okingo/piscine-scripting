#!/bin/bash

largest=0
count=0

while [ $count -lt 10 ]
do
    read -p "Enter a number: " num

    # Validate numeric using regex (only digits)
    if ! [[ $num =~ ^[0-9]+$ ]]; then
        echo "ERROR: Invalid input only positive numerical characters are allowed"
        exit 1
    fi

    # Check if negative (should never happen if regex passed, but required by instructions)
    if [ "$num" -lt 0 ]; then
        echo "ERROR: Invalid input only positive numerical characters are allowed"
        exit 1
    fi

    # Check upper limit
    if [ "$num" -gt 10000 ]; then
        echo "ERROR: The number entered is too large"
        exit 1
    fi

    # Update largest number
    if [ "$num" -gt "$largest" ]; then
        largest=$num
    fi

    count=$((count + 1))
done

echo "The largest number is: $largest"

