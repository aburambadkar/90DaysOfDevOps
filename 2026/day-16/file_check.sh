#!/bin/bash
#
read -p "Please enter your file name:" file_name

if [ -f $file_name ]; then
	echo "$file_name exists"
else
	echo "$file_name does not exists"
fi
