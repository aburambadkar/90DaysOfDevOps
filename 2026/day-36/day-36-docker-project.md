My Project Observations:

1) What app you chose and why?

I chose a 2-tier Python Flask application integrated with a PostgreSQL database.

While I have previously focused on 3-tier architectures (Web -> App -> DB), I chose a 2-tier setup this time to specifically master the direct integration and networking between a dynamic backend and a stateful database. This project allowed me to focus on high-level Docker concepts like:

Multi-stage builds for Python (slimming down from 700MB+ to ~90MB).

Service dependencies (using Healthchecks to ensure the DB is ready before the Flask app).

Non-root security (hardening the container by switching from root to a custom flaskuser).


2) Your Dockerfile (with comments explaining each line)

Please refer my docker file for line to line explanation. In this section, I will only be focussing on the doubts that I had while writing the file and why we did certain things.

We used the same python-alpine image from the builder in the next stage, instead of alpine lastest is because the alpine latest will not have python library and it will have to be added seperately. We also did not use slim images because they are debian based so it would have cause compile errors due to mismatch libraries.

```
If you compile your database driver (psycopg2) in the Builder stage using Alpine's tools, that driver is "expecting" to find musl to function. If you then try to run that same driver in a Slim image, it will look for those musl files, fail to find them, and your app will crash instantly with an error like File not found or Error loading shared library.
```

Why did we use a different user and why do we use it in the second phase?

Docker starts as root to provide the administrative power needed to install dependencies and configure the system during the Build Stage. However, running as root in the Runtime Stage creates a massive security risk.

```
COPY . . (This happens while you are still Root).

USER flaskuser (Everything after this is the new user).
```

Because Root "created" the files in /app, they are owned by Root. If flaskuser tries to run rm app.py, the Linux kernel will say: "Permission Denied." The user can read the code to run it, but they cannot delete or modify it

How to rm docker images using for loop in the terminal?

use image id instead of name. 

Final image size: 64.6MB


