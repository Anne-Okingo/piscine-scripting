#!/bin/bash

# Change size to 1000 bytes
truncate -s 1000 file1.txt

# Change permissions to rw-------
chmod 600 file1.txt

# Update Access and Modify times to 2022-01-01 00:00:00
touch -a -m -d "2022-01-01 00:00:00" file1.txt
