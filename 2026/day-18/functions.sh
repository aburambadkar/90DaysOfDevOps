#!/bin/bash

greet() {

	echo "Hello, $name!"

}

add() {

	sum=$(($a + $b))
	echo "My total sum is '$sum'"

}

name=$1

read -p "Please enter you num1:" a
read -p "Please enter your num2:" b

greet
add


