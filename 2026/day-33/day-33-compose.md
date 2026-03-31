Task 1: Install & Verify:

Check if Docker Compose is available on your machine:
```
apt-get install docker-compose -y
```
Verify the version:
```
docker-compose version
```

Task 2: Your First Compose File

Create a folder compose-basics

Write a docker-compose.yml that runs a single Nginx container with port mapping

Start it with docker compose up - docker-compose up -d

Access it in your browser

Stop it with docker compose down- docker-compose down

```
services:
  web-server:
     image: nginx
     ports:
     - 8080:80
```


Task 3: Two-Container Setup

Write a docker-compose.yml that runs:

A WordPress container
A MySQL container
They should:
Be on the same network (Compose does this automatically)
MySQL should have a named volume for data persistence
WordPress should connect to MySQL using the service name
Start it, access WordPress in your browser, and set it up.

Verify: Stop and restart with docker compose down and docker compose up — is your WordPress data still there?- Yes because of the volume.

```services:
  wordpress:
    image: wordpress:latest
    networks:
    - app-network
    ports:
    - 8080:80
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: akshada
      WORDPRESS_DB_PASSWORD: password123

  mysql:
    image: mysql:8.0
    networks:
    - app-network
    volumes:
      - my-data:/var/lib/mysql
    environment:
      MYSQL_USER: akshada
      MYSQL_PASSWORD: password123
      MYSQL_ROOT_PASSWORD: my-secret-pw

volumes:
  my-data:

networks:
  app-network:
```


Task 4: Compose Commands

Start services in detached mode:
```
docker compose up -d
```
View running services:
```
docker-compose ps
```
View logs of all services:
```
docker-compose logs
```
View logs of a specific service:
```
docker-compose logs wordpress
```
Stop services without removing:
```
docker-compose stop
```
Remove everything (containers, networks):
```
docker-compose down
```
Rebuild images if you make a change:
```
docker compose up --build

services:
  my-app:
    build: .   # This tells Compose: "Look for a Dockerfile in this folder"
    ports:
      - "8080:80"
```


Task 5: Environment Variables

Add environment variables directly in your docker-compose.yml
Create a .env file and reference variables from it in your compose file
Verify the variables are being picked up

Create an .env file in the same directory:
```
DB_ROOT_PASSWORD=topsecret-root
DB_NAME=wordpress_db
DB_USER=akshada
DB_PASS=password123
```

Referring the env values in the docker-compose file:
```
  mysql:
    image: mysql:8.0
    volumes:
      - my-data:/var/lib/mysql
    environment:
      MYSQL_DATABASE: ${DB_NAME}
      MYSQL_USER: ${DB_USER}
      MYSQL_PASSWORD: ${DB_PASS}
      MYSQL_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}
    networks:
      - app-network
```
