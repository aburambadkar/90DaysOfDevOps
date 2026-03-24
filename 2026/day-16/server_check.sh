#!/bin/bash
#
read -p "Please enter your service name: " service_name
read -p  "Do you want to check the status of your service name (Please enter yes or no): " status_check

if [ $status_check == yes ]; then
	running=$(systemctl is-active $service_name) 
        if [ $running == active ]; then	
		echo "The service is active"
        else
		echo "Service is not running"
	fi
           
else
	echo "Skipped"
fi


