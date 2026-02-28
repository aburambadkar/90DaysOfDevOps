The core components of Linux :

Linux architecture consists of layers which include hardware, kernel, shell and applications.
Applications are ran under user space so that they do not interfere with the system functions. Shell is a interactive tool used by the user to navigate or perform certain tasks. 
Exp- When you type ls, the shell looks for a compiled binary file (already 1010101) under /bin and asks the Kernel to run it.
When a user Powers on the system, the BIOS loads the hardware. Which then starts the grub (first software) which loads the kernel in to the RAM. At this point, once the operating system is loaded, we see the first process init/systemd starts running followed by other processes.

How processes are created and managed:

every shell command that we run is converted into a process and we can list that using ps -aux

What systemd does and why it matters:

systemd is the first process with PID 1 that starts after kernel is loaded. It is the parent of all system processes as it is responsible to start all system services. if any system service is crash such as docker, we use systemctl command to check its logs or any other info. More info: https://medium.com/@Adewuumii/why-systemd-matters-and-how-to-effectively-use-it-without-losing-your-mind-3386872a6555


Explain process states (running, sleeping, zombie, etc.)

https://www.cbtnuggets.com/blog/certifications/open-source/what-are-the-5-linux-process-states
https://www.baeldung.com/linux/process-states

List 5 commands you would use daily:

top
vim
ls
df
cd
