Task 1: Docker images

Pull the nginx, ubuntu, and alpine images from Docker Hub - docker pull <image name>
List all images on your machine — note the sizes

akshada@linux-practice:~$ docker images | grep -E 'nginx|ubuntu|alpine'

nginx                latest     0cf1d6af5ca7   17 hours ago   161MB
ubuntu               latest     f794f40ddfff   4 weeks ago    78.1MB
alpine               latest     a40c03cbb81c   8 weeks ago    8.44MB
akshada@linux-practice:~$

Compare ubuntu vs alpine — why is one much smaller? I assume that the ubuntu has more layers compared to alpine.

Inspect an image — what information can you see? Metadata about the image

Remove an image you no longer need - docker image rm imageID

Task 2: Image Layers

Run docker image history nginx — what do you see? 

We notice all the build steps of this nginx image
akshada@linux-practice:~$ docker image history nginx

IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
0cf1d6af5ca7   17 hours ago   CMD ["nginx" "-g" "daemon off;"]                0B        buildkit.dockerfile.v0

<missing>      17 hours ago   STOPSIGNAL SIGQUIT                              0B        buildkit.dockerfile.v0

<missing>      17 hours ago   EXPOSE map[80/tcp:{}]                           0B        buildkit.dockerfile.v0

<missing>      17 hours ago   ENTRYPOINT ["/docker-entrypoint.sh"]            0B        buildkit.dockerfile.v0

<missing>      17 hours ago   COPY 30-tune-worker-processes.sh /docker-ent…   4.62kB    buildkit.dockerfile.v0

<missing>      17 hours ago   COPY 20-envsubst-on-templates.sh /docker-ent…   3.02kB    buildkit.dockerfile.v0


Each line is a layer. Note how some layers show sizes and some show 0B

Write in your notes: What are layers and why does Docker use them?

Each command you include in docker file to build this image is converted into one layer of some size. If another build has a layer in common, docker will not create another layer, instead with cache this layer and build other layers on top of it. This caching makes images small in sizeand consume less resources.

Task 3: Container Lifecycle

Practice the full lifecycle on one container:

Create a container (without starting it) - docker create --name mycontainer nginx

Start the container - docker start containername

Pause it and check status - 

akshada@linux-practice:~$ docker pause mycon
mycon

 docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                   PORTS     NAMES
d9cf2530d0b7   nginx     "/docker-entrypoint.…"   31 seconds ago   Up 18 seconds (Paused)   80/tcp    mycon
akshada@linux-practice:~$

Unpause it - docker unpause d9cf2530d0b7

Stop it - docker stop containerID (brings the container in exited state with 0 code)

Restart it - docker restart containername

Kill it - (brings the container in exited state with 137 code)

akshada@linux-practice:~$ docker ps -a

CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                       PORTS     NAMES
d9cf2530d0b7   nginx     "/docker-entrypoint.…"   3 minutes ago   Exited (137) 6 seconds ago             mycon
akshada@linux-practice:~$

Remove it - docker stop id && docker rm id

Task 4: Working with Running Containers

Run an Nginx container in detached mode -  docker run -d nginx

View its logs - docker logs ID

View real-time logs (follow mode) - docker logs -f ID

Exec into the container and look around the filesystem - docker exec -it ID /bin/bash

Run a single command inside the container without entering it

docker exec -it 77a94c9ce958  df -h
Filesystem      Size  Used Avail Use% Mounted on
overlay          48G  3.0G   45G   7% /
tmpfs            64M     0   64M   0% /dev
shm              64M     0   64M   0% /dev/shm
/dev/sda1        48G  3.0G   45G   7% /etc/hosts
tmpfs           3.9G     0  3.9G   0% /proc/acpi
tmpfs           3.9G     0  3.9G   0% /proc/scsi
tmpfs           3.9G     0  3.9G   0% /sys/firmware
akshada@linux-practice:~$

Inspect the container — find its IP address, port mappings, and mounts - docker inspect containerID

Task 5: Cleanup

Stop all running containers in one command: for i in $(docker ps | awk 'NR > 1 {print $1}'); do docker stop $i; done
Remove all stopped containers in one command: for i in $(docker ps -a | awk 'NR > 1 {print $1}'); do docker stop $i; done
Remove unused images- docker image prune
Check how much disk space Docker is using - docker system df





