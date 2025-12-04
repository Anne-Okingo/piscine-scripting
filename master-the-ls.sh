O
#!/bin/bash

# List files and directories, ignoring hidden files
# -p adds '/' after directories automatically
# -A ignores . and ..
# -u sorts by access time (newest first)
ls -Aup | tr '\n' ',' | sed 's/,$//'

