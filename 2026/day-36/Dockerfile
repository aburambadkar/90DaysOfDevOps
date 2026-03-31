# Stage 1 : Builder logic

FROM python:3.9-alpine AS builder

WORKDIR /app

# Installs the system packages required by the libraries mentioned in requirements.txt

RUN apk add --update \
    postgresql-dev \
    gcc \
    musl-dev 

# Copying only the requirements file because we only want this image to have the dependencies and the code file will be called
# in the second phase.

COPY requirements.txt .

# Install dependencies into a specific folder (/install)
# This makes it easier to copy to the next stage

RUN pip install --prefix=/install -r requirements.txt

# Stage: 2

FROM python:3.9-alpine

WORKDIR /app

# Install ONLY the runtime library needed for Postgres (libpq)
# This replaces the heavy 'postgresql-dev' and 'gcc'

RUN apk add --no-cache libpq

# Copy the libraries from the builder stage
COPY --from=builder /install /usr/local

# Copy your code now
COPY . .

# Create a non-root user
RUN adduser -D flaskuser
USER flaskuser

EXPOSE 5000

CMD ["python", "app.py"]

