Refer this link for docker restart policies: https://docs.docker.com/engine/containers/start-containers-automatically/

For Task 4, I made changes to the app.py to print something else. 
After running docker-compose up -d --build, it was not picking up my changes.

To fix this, I had to comment out image from compose file and add the following

```
  my-app-service:
    build: .
```

Task 6:

The below command fails, because we have port mapping enabled and it wont spin up replicas using the same port on the same host.

docker compose up --scale
