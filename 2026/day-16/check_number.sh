#!/bin/bash
#
read -p "Please enter your number:" my_num

if [ $my_num -gt 0 ]; then
	echo "$my_num is a positive number"
elif [ $my_num -lt 0 ]; then
	echo "$my_num is a negative number"
else
	echo "$my_num is equal to zero"
fi

