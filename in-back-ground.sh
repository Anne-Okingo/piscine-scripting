#!/bin/bash

# Run with nohup, redirect stderr to stdout
# The grep output goes to stdout, echo appends to file
nohup bash -c 'cat facts | grep "moon" && echo "The moon fact was found!" >> output.txt' 2>&1 &
