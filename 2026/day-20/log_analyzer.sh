#!/bin/bash

file=$1
date=$(date '+%Y-%m-%d')



log_analysis() {
        
	echo "----CHECKING ERROR COUNTS----"
	ERROR_COUNT=$(grep -Ei 'ERROR|FAILED' $file | wc -l)
	echo "The total number of error count is $ERROR_COUNT"
	echo ""
        
	CRITICAL_ERROR=$(grep -i "CRITICAL" $file)
	echo "----CRITICAL EVENTS----"
	echo "$CRITICAL_ERROR"
        echo ""

	echo "----TOP 5 ERROR MESSAGES----"
	top_five=$(grep -i 'CRITICAL' $file | awk '{print $4 $5 $6}' | uniq -c | sort -r | head -5)
	echo "$top_five"
	echo ""

	echo "----GENERATING SYSTEM REPORT----"
	REPORT_NAME="log_report_$date.txt"
	{
	        echo "Date of analysis: $date"
		echo ""
		echo "Log file name: $file"
		echo ""
		echo "Total error count:"
	       	echo "$ERROR_COUNT"
		echo ""
		echo "Top 5 error messages with their occurrence count:"
	        echo "$top_five"
		echo ""
		echo "List of critical events with line numbers:" 
		echo "$CRITICAL_ERROR"

	} > log_report_$date.txt 

        echo "----REPORT COMPLETED----"
	echo "File generated: $REPORT_NAME"

}


if [ -z $file ];then
        echo "arg is not provided"
        exit 1

elif [ ! -f $file ];then
        echo "file does not exists"
        exit 1
else
        log_analysis
fi
