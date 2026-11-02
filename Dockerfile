# 1. Start with a tiny Linux base
FROM alpine

# 2. Install a tool (curl) so we can test internet access
RUN apk add --no-cache curl

# 3. Copy a file from your laptop into the container
COPY README.md /app/README.md

# 4. When the container runs, print the file we copied
CMD ["cat", "/app/README.md"]