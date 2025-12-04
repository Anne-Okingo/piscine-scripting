#!/bin/bash

find . -maxdepth 1 -type f ! -name "*.txt" -exec basename {} \; > filtered_files.txt
