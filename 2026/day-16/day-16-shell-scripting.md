#This file containes scripts and its outputs:

1) Check if the number entered is positive,negative or zero and print the results likewise.
```
#!/bin/bash

read -p "Please enter your number:" my_num

if [ $my_num -gt 0 ]; then
	echo "$my_num is a positive number"
elif [ $my_num -lt 0 ]; then
	echo "$my_num is a negative number"
else
	echo "$my_num is equal to zero"
fi
```

Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-16$ ./check_number.sh

Please enter your number:0

0 is equal to zero

2) Checks if the file entered exists on the system.

```
#!/bin/bash

read -p "Please enter your file name:" file_name

if [ -f $file_name ]; then
	echo "$file_name exists"
else
	echo "$file_name does not exists"
fi
```

Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-16$ ./file_check.sh

Please enter your file name:server_check.sh

server_check.sh exists

3) Gets input of name and favorite too and prints the output.

```
#!/bin/bash

read -p "What is your name:" name
read -p "What is your favorite tool:" fav_tool

echo "Hello $name, your favorite tool is $fav_tool"
```

Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-16$ ./greet.sh

What is your name:Akshada

What is your favorite tool:Python

Hello Akshada, your favorite tool is Python

4) Sets variables and then prints it.

```
#!/bin/bash

NAME="Akshada"
ROLE="DevOps Engineer"

echo Hello, I am "$NAME" and I am a "$ROLE"
```

Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-16$ ./variables.sh

Hello, I am Akshada and I am a DevOps Engineer

5) Gets inputs of the service name and checks if it is active or not.

```
#!/bin/bash

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
```

Output:

akshada@linux-practice:~/devops/90DaysOfDevOps/2026/day-16$ ./server_check.sh

Please enter your service name: nginx

Do you want to check the status of your service name (Please enter yes or no): yes
Service is not running


From this exercise, I learned variables, nested loops and inputs.

