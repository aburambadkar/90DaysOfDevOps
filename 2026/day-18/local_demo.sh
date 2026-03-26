#!/bin/bash

name="Akshada"

local_function() {
	local name="Devops_Bot"
        echo "Inside local function name is $name"	

}

global_function() {
	name="Global_glitch"
	echo "Inside global function name is $name"
	

}


echo "Starting name is $name"

local_function

echo "After local: name is $name"  

global_function

echo "After global: name is $name"




