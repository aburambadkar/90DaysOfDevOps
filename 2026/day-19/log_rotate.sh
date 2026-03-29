#!/bin/bash
set -euo pipefail

log_dir=${1:-""}
date=$(date '+%Y-%m-%d_%H-%M-%S')
backup_dir=/home/akshada/backup/

log_cleanup() {

	if [ -d "$log_dir" ]; then
		echo "Checking log files older than 30 days under $log_dir for deletion"
        	count_30=$(find $log_dir -name '*.log' -mtime +30 | wc -l)
        	find $log_dir -name '*.log' -mtime +30 -delete
	fi
	
}


log_backup() {
       
	if [ -d "$log_dir" ]; then
                echo "Checking log files older that 7 days  under $log_dir for backup"
                count_7=$(find $log_dir -name '*.log' -mtime +7 | wc -l)
                find $log_dir -name '*.log' -mtime +7 | xargs tar -czvf "$backup_dir/backup_$date.tar.gz"
        fi

}

log_usage() {
	#This should only run if the directory DOES NOT exist or no input
	if [ -z "$log_dir" ] || [ ! -d "$log_dir" ]; then
	 	echo "Either directory does not exists or Usage is incorrect"
		echo "Usage: script.sh <path of the folder>" 
		exit 1
	fi


}

#----------Execution flow---------
#All the mines were commented for testing maintainance script. For individual run, please uncomment it.
#log_usage
#log_cleanup
#log_backup



