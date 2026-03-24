#!/bin/bash
#
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root or with sudo."
    exit 1
fi

packages=("nginx" "curl" "wget" "apline")

for package in "${packages[@]}"; do
	if  dpkg -s "$package" > /dev/null 2>&1 ; then
		echo "$package is already installed"
        else
		sudo apt-get install $package -y
		echo "'$package' is installed"
	fi
done
	



	


