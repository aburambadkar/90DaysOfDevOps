Before building the Docker image or writing the Compose file, I follow this architectural checklist to ensure the deployment is Optimized, Secure, and Reliable.

Phase 1: The "Heavy" Builder Stage (Compilation)

[ ] Q1: Primary Language? 
* Action: Select the appropriate "Full" base image (e.g., python:3.9-alpine).

[ ] Q2: Native Extensions Required? 
* Action: Identify if the app needs C-compilers (gcc, g++, make) or headers (postgresql-dev) to build drivers like psycopg2.

[ ] Q3: Dependency Manifest? 
* Action: Identify requirements.txt, package.json, or go.mod.

Optimization: Copy this file before the source code to leverage Docker layer caching.

Phase 2: The "Tiny" Runner Stage (Execution)

[ ] Q4: Runtime vs. Web Server? 
* Action: Decide if the final stage needs a language runtime (python-alpine) or just a static server (nginx-alpine).

[ ] Q5: Shared Runtime Libraries? 
* Action: Identify and install only the minimal runtime packages (e.g., libpq) instead of the full dev-headers.

[ ] Q6: Artifact Transfer? 
* Action: Locate the build output (e.g., /install folder or a binary) and use COPY --from=builder to move it to the final stage.

Phase 3: Security & Image Hygiene

[ ] Q7: Non-Root User? 
* Action: Implement adduser -D and USER to prevent privilege escalation attacks.

[ ] Q8: Public Gate (Port)? 
* Action: Match the EXPOSE instruction to the application's internal listening port (e.g., 5000).

[ ] Q9: Build Context Noise? 
* Action: Configure .dockerignore to exclude .git, .txt, .md, and local virtual environments.

Phase 4: Orchestration & Reliability (Docker Compose)

[ ] Q10: Service Dependencies? 
* Action: Use depends_on with the service_healthy condition to prevent race conditions.

[ ] Q11: Availability Check? 
* Action: Define a healthcheck (e.g., pg_isready) for the database so the application only starts when the DB is truly ready.
