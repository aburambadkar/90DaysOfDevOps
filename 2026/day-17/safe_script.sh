#!/bin/bash
#
set -e
mkdir -d /tmp/devops-test || {echo "Failed to create a directory"; exit 1;} 
cd /tmp/devops-test || {echo "Failed to enter in the directory"; exit 1;}
touch test.txt || {echo "Failed to create a file"; exit 1;}

echo "Success! File created"


