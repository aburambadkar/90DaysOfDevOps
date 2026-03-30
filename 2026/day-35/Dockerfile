# STAGE 1: The "Build" Stage
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 go build -o hello-app main.go

#STAGE 2: The "Final stage"

FROM alpine:latest

# 1. Create a non-root user
# -S creates a system user
# -D skips creating a password
RUN adduser -S -D appuser

WORKDIR /app

# 2. Copy the binary
COPY --from=builder /app/hello-app .

# 3. Change ownership so the new user can actually run the file
RUN chown appuser hello-app

# 4. Switch to the non-root user
USER appuser

CMD ["./hello-app"]
