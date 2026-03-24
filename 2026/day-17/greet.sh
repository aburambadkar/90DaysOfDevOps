#!/bin/bash

my_name=$1


if [ -n "$my_name" ]; then
	echo "Hello, $my_name!"
else
	echo "Usage: ./greet.sh name"
fi



