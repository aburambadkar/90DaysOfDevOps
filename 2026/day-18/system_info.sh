#!/bin/bash

set -euo pipefail

# A function to print hostname and OS info

hostos() {

	echo "$(hostname)"
	echo "$(uname -a)"
}

# A function to print uptime

uptimefun() {
	
	echo "$(uptime)"
}

# A function to print disk usage (top 5 by size)

diskusage() {
	
	echo "$(df -h --total | head -n 6)"
}

# A function to print memory usage

mem() {

	echo "$(free -h)"
}

# A function to print top 5 CPU-consuming processes

topcpu() {
	
	echo "$(ps --sort=-pcpu | head -n 6)"		

}

main() {
	
	echo "=====System health info======"
	echo "DATE: $(date)"
	echo ""
	hostos
	echo ""

        uptimefun
	echo ""

	diskusage
	echo ""

	mem
	echo ""

	topcpu
	echo ""

}


main

