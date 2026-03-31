Task 1: Your First Dockerfile

Create a folder called my-first-image
Inside it, create a Dockerfile that:
Uses ubuntu as the base image
Installs curl
Sets a default command to print "Hello from my custom image!"
Build the image and tag it my-ubuntu:v1
Run a container from your image
Verify: The message prints on docker run
```
akshada@linux-practice:~/my-first-image$ cat Dockerfile
FROM ubuntu

RUN apt-get update && apt-get install curl -y

CMD ["echo","Hello from my custom image!"]


akshada@linux-practice:~/my-first-image$ docker run my-ubuntu:v1
Hello from my custom image!
```

Task 2: Dockerfile Instructions

Create a new Dockerfile that uses all of these instructions:

FROM — base image
RUN — execute commands during build
COPY — copy files from host to image
WORKDIR — set working directory
EXPOSE — document the port
CMD — default command
Build and run it. Understand what each line does.
```
akshada@linux-practice:~/my-first-image$ cat Dockerfile

FROM python:3.9-slim

WORKDIR /app

COPY index.html .

RUN touch /app/build_complete.txt

EXPOSE 8080

CMD ["python","-m", "http.server", "8080"]
akshada@linux-practice:~/my-first-image$
```

Task 3: Build Optimization

Build an image, then change one line and rebuild — notice how Docker uses cache

Changed content of index.html and rebuild the image with v2 and noticed the docker uses cache for layer 2:
```
akshada@linux-practice:~/my-first-image$ docker build -t my-greet-app:v2 .
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  3.072kB
Step 1/6 : FROM python:3.9-slim
 ---> 085da638e1b8
 
Step 2/6 : WORKDIR /app
 ---> Using cache ----------------------------->
 ---> 4fef82ee627a
 
Step 3/6 : COPY index.html .
 ---> 4598a0c598c2
 
Step 4/6 : RUN touch /app/build_complete.txt
 ---> Running in ce52f35579d6
 ---> Removed intermediate container ce52f35579d6
 ---> 93a30863199b
 
Step 5/6 : EXPOSE 8080
 ---> Running in a96a77414cd9
 ---> Removed intermediate container a96a77414cd9
 ---> 86302d2164af
 
Step 6/6 : CMD ["python","-m", "http.server", "8080"]
 ---> Running in cda8e10e1911
 ---> Removed intermediate container cda8e10e1911
 ---> 85fdcd3ca581
 
Successfully built 85fdcd3ca581
Successfully tagged my-greet-app:v2
akshada@linux-practice:~/my-first-image$
```
Reorder your Dockerfile so that frequently changing lines come last

Write in your notes: Why does layer order matter for build speed

Docker checks the FROM statement and sees that the python image is already present locally from the last build. On step 2, it uses cache because it sees that it has already ran same Workdir command on this image from the last build, so instead of creating a new layer it uses the same layer from last previous. It then proceeds to the copy index.html step and sees that the content has changed and starts creating new layers. At this point, cache chain is broken and docker recreates below layers. 

This is why we always put the things that change the least (like WORKDIR or installing heavy dependencies) at the top of the Dockerfile, 
and the things that change the most (like your source code) at the bottom.

Task 4: Build a Simple Web App Image

Create a small static HTML file (index.html) with any content
Write a Dockerfile that:
Uses nginx:alpine as base
Copies your index.html to the Nginx web directory
Build and tag it my-website:v1
Run it with port mapping and access it in your browser
```
Dockerfile

FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html

docker build -t my-website:v1 .
docker run -d -p 80:80 --name my-nginx my-website:v1
```

Task 5: .dockerignore
Create a .dockerignore file in one of your project folders
Add entries for: node_modules, .git, *.md, .env
Build the image — verify that ignored files are not included

Task 6: CMD vs ENTRYPOINT
Create an image with CMD ["echo", "hello"] — run it, then run it with a custom command. What happens?
```
akshada@linux-practice:~/my-first-image$ docker run image
hello

akshada@linux-practice:~/my-first-image$ docker run image world
/docker-entrypoint.sh: 47: exec: world: not found

```
Create an image with ENTRYPOINT ["echo"] — run it, then run it with additional arguments. What happens?
```
akshada@linux-practice:~/my-first-image$ docker run newimage

akshada@linux-practice:~/my-first-image$ docker run newimage hello
hello
```

Write in your notes: When would you use CMD vs ENTRYPOINT?

With CMD, it will not accept any arguments passed with docker commands. This is like a hardcoded command.
Entrypoint, you can define the binary and pass arguments during docker commands.
