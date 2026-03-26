#!/bin/bash

set -euo pipefail


# This is an example of set -e flag

echo "Step 1: This will work."
ls /folder-that-does-not-exist  # This command will fail
echo "Step 2: You will never see this message!"

#This is an example of set -u flag 

GREETING="Hello"

# Notice the typo in the variable name below (GREETIN instead of GREETING)
echo "$GREETIN Akshada"


#This is an example of set -o pipeline

# 'nosuchcommand' doesn't exist, but 'echo' always works.
nosuchcommand | echo "I am a pipe"

echo "The exit status was: $?"

