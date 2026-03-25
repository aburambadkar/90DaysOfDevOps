#!/bin/bash

check_disk() {

	disk_con=$(df -h /)

}

check_memory() {
	
	free_mem=$(free -h) 

}

check_disk
echo "$disk_con"



echo ""

check_memory
echo "$free_mem"
