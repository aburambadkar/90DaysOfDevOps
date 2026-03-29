#!/bin/bash
set -euo pipefail

source_dir=${1:-""}
backup_dir=${2:-""}
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')

backup_usage() {

if [ -z "$source_dir" ] && [ -z "$backup_dir" ]; then
	echo "both required arguments are empty."
	echo "Usage: script.sh <source directory> <backup_destination>"
	exit 1

elif [ -z "$source_dir" ] || [ -z "$backup_dir" ]; then
	echo "One of the argument is empty"
	echo "Please provide both the arg. Usage: script.sh <source directory> <backup_destination>"
        exit 1

elif [ ! -d "$source_dir" ]; then
	echo "Error: source directory does not exists"
	exit 1
elif [ ! -d "$backup_dir" ]; then
	echo "Error: backup directory does not exists"
	exit 1
else
	echo "All directories verified. Starting backup..."
fi
}


create_backup() {
        local backup_file="$backup_dir/backup_$timestamp.tar.gz"
	tar -cvzf "$backup_file" "$source_dir"
	if [ $? -eq 0 ]; then
		echo "Backup generated successfully"
		echo $(du -h "$backup_file")
        else
		echo "Backup Failed!"
		exit 1
fi
}

delete_olderbackups() {

if [ -d "$backup_dir" ] ; then
	find "$backup_dir" -name "*.tar.gz" -mtime +14 -delete
fi

}


#All the mines were commented for testing maintainance script. For individual run, please uncomment it.
#backup_usage
#delete_olderbackups
#create_backup



