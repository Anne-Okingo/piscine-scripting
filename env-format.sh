#!/bin/bash

# 1. Print the PWD value
printenv PWD

# 2. Print all environment variable NAMES that contain H
printenv | awk -F= '/H/ {print $1}'
