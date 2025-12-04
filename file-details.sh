#!/bin/bash

ls -l --time-style="+%F %R" hard-perm 2>/dev/null | sed '1d' | awk '{print $1, $6, $7, $5, $8}'