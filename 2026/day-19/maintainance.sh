#!/bin/bash
set -euo pipefail


#Source my scripts which had the functions defined
source /home/akshada/devops/90DaysOfDevOps/2026/day-19/log_rotate.sh
source /home/akshada/devops/90DaysOfDevOps/2026/day-19/backup.sh

#Sets variables 

log_dir=/var/log/myapp
source_dir=/home/akshada/data
backup_dir=/home/akshada/backup
date=$(date '+%Y-%m-%d_%H-%M-%S')

#Calls your log rotation and backup function and Logs all output to /var/log/maintenance.log with timestamps:
{
	echo "----Starting my maintainance: $date----"

	log_usage
	log_cleanup
	log_backup

	backup_usage
	delete_olderbackups
	create_backup

	echo "----Maintainance fnished: $(date '+%Y-%m-%d_%H-%M-%S')----"
} >> /home/akshada/logs/maintenance.log 2>&1



