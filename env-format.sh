#!/bin/bash

# 1. Print the PWD value
printenv PWD

# 2. Print all environment variable NAMES that contain H
printenv | grep H | cut -d= -f1
