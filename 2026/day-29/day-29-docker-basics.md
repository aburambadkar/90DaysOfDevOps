Task 1: 

Please refer this link for interview prep: https://github.com/iam-veeramalla/Docker-Zero-to-Hero/blob/main/README.md

1) What is a container and why do we need them?

Container is a standard unit of a software that packages up code along with its dependencies so that the application runs quickly and reliably
from one computing environment to another. 

2) Why we need them?
VMs have a full-fledged OS and hypervisor, making them more resource-intensive. While Containers share the host operating system kernel, 
making them lighter and faster than VMs. Containers are designed to be portable and can run on any system with a compatible host operating system.
Managing containers is typically easier than managing VMs, as containers are designed to be lightweight and fast-moving.

Containers are lightweight because they use a technology called containerization, which allows them to share the host operating system's kernel
and libraries, while still providing isolation for the application and its dependencies. This results in a smaller footprint compared to traditional virtual machines,
as the containers do not need to include a full operating system. Additionally, Docker containers are designed to be minimal, only including what is necessary 
for the application to run, further reducing their size.

3) Difference between VM's and Containers?
Please refer above points for the distinction. One more point- VMs provide a higher level of security as each VM has its own operating system 
and can be isolated from the host and other VMs. Containers provide less isolation, as they share the host operating system.

4) What is docker and docker architecture?
Docker is a containerization platform that provides easy way to containerize your applications, which means, using Docker you can build
container images, run the images to create containers and also push these containers to container regestries such as DockerHub, Quay.io and so on.

Refer the github link for the architecture and explanation.

Task 2: Install Docker

Install Docker on your machine (or use a cloud instance) - sudo apt-get install docker.io -y
Verify the installation - systemctl status docker
Run the hello-world container - docker run hello-world
Read the output carefully — it explains what just happened

1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

Task 3: Run Real containers

Run an Nginx container and access it in your browser - docker run -d -p 80:80 --name mynginx nginx
Run an Ubuntu container in interactive mode — explore it like a mini Linux machine - docker run -it --name ubuntumachine ubuntu
List all running containers - docker ps 
List all containers (including stopped ones)- docker ps -a
Stop and remove a container - docker stop 27655549a6dd && docker rm 27655549a6dd

Task 4: Explore

Run a container in detached mode — what's different? You do not get a shell. 

docker run -d --name ubuntumachine ubuntu
7d13534e4725e9b6350292ffa7c3606f4f6295c8bee43835970485ff30f3f9d9

Give a container a custom name - docker run -it --name ubuntumachine ubuntu
Map a port from the container to your host - docker run -d -p 80:80 --name mynginx nginx
Check logs of a running container - docker logs containerID
Run a command inside a running container - you can also use docker exec -it containerID /bin/bash





