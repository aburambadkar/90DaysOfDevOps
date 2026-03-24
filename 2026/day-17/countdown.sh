#!/bin/bash
#
read -p "Please provide a number: " my_num

while [ "$my_num" -ge 0 ]; do
      echo "$my_num"
      
      my_num=$((my_num - 1))
      sleep 1
done


