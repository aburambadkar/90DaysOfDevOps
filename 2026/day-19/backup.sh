#!/bin/bash

source_dir=$1
backup_dir=$2
timestamp=$(date '+%Y-%m-%d')

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
else
	echo "Error: backup destination directory does not exists"
	exit 1
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
	find "$backup_dir" -name "*.tar.gz" -mtime +14 --delete
fi

}


backup_usage
delete_backup
create_backup



