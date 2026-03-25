#This file contains scripts and its outputs.

1) Create forloop.sh that:
Loops through a list of 5 fruits and prints each one

Script:

```
#!/bin/bash

for fruit in apples oranges banana cherry grapes; do
	echo "$fruit"
done
```
Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-17$ ./forloop.sh
apples
oranges
banana
cherry
grapes

2) Create count.sh that:
Prints numbers 1 to 10 using a for loop

Script:
```
#!/bin/bash

for i in {1..10}; do
	echo $i
done
```
Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-17$ ./count.sh
1
2
3
4
5
6
7
8
9
10

3)Create countdown.sh that:
Takes a number from the user
Counts down to 0 using a while loop
Prints "Done!" at the end

Script:
```
#!/bin/bash

read -p "Please provide a number: " mynum

while [ "$mynum" -ge 0 ]; do
      echo "$mynum"

      my_num=$((my_num - 1))
      sleep 1
done
```
Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-17$ ./countdown.sh
Please provide a number: 10
10
9
8
7
6
5
4
3
2
1
0

4) Create greet.sh that:

Accepts a name as $1
Prints Hello, <name>!
If no argument is passed, prints "Usage: ./greet.sh "

Script:
```
#!/bin/bash

myname=$1

if [ -n "$myname" ]; then
	echo "Hello, $myname!"
else
	echo "Usage: ./greet.sh name"
fi
```
Output:

./greet.sh

Usage: ./greet.sh name

./greet.sh aksh

Hello, aksh!

5) Create argsdemo.sh that:

Prints total number of arguments 
Prints all arguments 
Prints the script name 

Script:
```
#!/bin/bash

Totalnumber=$#
allarg=$@
scriptname=$0

echo "The total number of arguments is '$Totalnumber'"
echo "list of arguments passed is '$allarg'"
echo "The script name is '$scriptname'"
```
Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-17$ ./argsdemo.sh
The total number of arguments is '0'
list of arguments passed is ''
The script name is './argsdemo.sh'

6) Create installpackages.sh that:
Defines a list of packages: nginx, curl, wget
Loops through the list
Checks if each package is installed (use dpkg -s or rpm -q)
Installs it if missing, skips if already present
Prints status for each package
Modify your installpackages.sh to check if the script is being run as root — exit with a message if not.

Script:
```
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
```

Output:
Not adding the output because of the EUID condition.


7) Create safescript.sh that:
Uses set -e at the top (exit on error)
Tries to create a directory /tmp/devops-test
Tries to navigate into it
Creates a file inside
Uses || operator to print an error if any step fails

Script:
```
#!/bin/bash

set -e
mkdir -d /tmp/devops-test || {echo "Failed to create a directory"; exit 1;}
cd /tmp/devops-test || {echo "Failed to enter in the directory"; exit 1;}
touch test.txt || {echo "Failed to create a file"; exit 1;}

echo "Success! File created"
```
Output:

Its better to rrun the script as it can have different outputs.


From this exercise, I learned how to use arguments, how to check if a variable is empty or not and error handling.








