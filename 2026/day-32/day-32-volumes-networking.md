Task 1: The Problem

Run a Postgres or MySQL container: 
```
docker run -d --name my-db -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=test_db -e MYSQL_USER=akshada -e MYSQL_PASSWORD=password123 
-p 3306:3306 mysql:8.0
  ```
Create some data inside it (a table, a few rows — anything):
```
docker exec -it my-db mysql -u root -p
USE test_db;
CREATE TABLE users (id INT, name VARCHAR(20));
INSERT INTO users VALUES (1, 'Akshada');
SELECT * FROM users;
EXIT;
```
Stop and remove the container
```
docker stop container
docker rm container
```
Run a new one — is your data still there?

The data is gone.

Write what happened and why- The data is not present because containers are ephemeral. For the data to be persistent, we need to attach a volume
to the container.

Task 2: Named Volumes

Create a named volume:
```
docker volume create mysql_data
```
Run the same database container, but this time attach the volume to it
```
docker run -d --name my-persistent-db -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=inventory -v mysql_data:/var/lib/mysql mysql:8.0
```
Add some data, stop and remove the container
```
docker stop container
docker rm container
```
Run a brand new container with the same volume
```
docker run -d --name my-new-db -e MYSQL_ROOT_PASSWORD=my-secret-pw -v mysql_data:/var/lib/mysql mysql:8.0
```
Is the data still there? Yes, the data persisted.

Task 3: Bind Mounts

Create a folder on your host machine with an index.html file
```
mkdir ~/my-web-site

touch index.html
```
Run an Nginx container and bind mount your folder to the Nginx web directory
```
docker run -d --name live-web -p 8081:80 -v $(pwd)/my-web-site:/usr/share/nginx/html nginx:alpine
```
Access the page in your browser
Edit the index.html on your host — refresh the browser

Write in your notes: What is the difference between a named volume and a bind mount?

Named volume is used when you want to keep the data persistent even after the container is dead. We can simply spin up a new container
with the same volume and see out old data in it.

Bind mounts are basically mounting your directory locally inside the container. So when you make any changes to the folder locally, you will
see the same changes inside the container. Mostly use case seems of testing.

Task 4: Docker Networking Basics

List all Docker networks on your machine- docker network ls

Inspect the default bridge network- docker inspect networkID

Run two containers on the default bridge — can they ping each other by name? - No, they cannot as no name resolution in bridge net
```
docker run -d --name c1 alpine sleep 1000

docker run -d --name c2 alpine sleep 1000
```
Run two containers on the default bridge — can they ping each other by IP?- only ping with IP works.

Task 5- Custom Networks

Create a custom bridge network called my-app-net- docker network create my-app-net

Run two containers on my-app-net
```
docker run -d --name app1 --network my-app-net alpine sleep 1000

docker run -d --name app2 --network my-app-net alpine sleep 1000
```
Can they ping each other by name now?
```
docker exec app1 ping app2
```
Write in your notes: Why does custom networking allow name-based communication but the default bridge doesn't?

Docker doesn't provide a built-in DNS resolver for the default bridge for security and legacy reasons.

Task 6: Putting it all together

Create a custom network- docker network create my-app-stack and volume docker volume create db_data

Run a database container (MySQL/Postgres) on that network with a volume for data 
```
docker run -d --name mysql-db --network my-app-stack -v db_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=my_app_db mysql:8.0
```
Run an app container (use any image) on the same network
```
docker run -d --name web-app --network my-app-stack alpine sleep 1000
```
Verify the app container can reach the database by container name - Yes it can ping each other.
```
docker exec web-app ping mysql-db
```
