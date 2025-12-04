#!/bin/bash

# List contents of hard-perm with date/time formatted as YYYY-MM-DD HH:MM,
# remove the "total" header, then print: permissions date time filename
ls -l --time-style="+%F %R" hard-perm \
  | sed '1d' \
  | awk '{print $1, $6, $7, $8}'
