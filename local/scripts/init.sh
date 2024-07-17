#!/bin/bash

echo "--- Initializing ---"
cd "$PATH_PARAM"

# Configure environment variables:
cat <<EOF > /tmp/.task-manager-env
MYSQL_ROOT_PASSWORD=h4rdpa55
MYSQL_DATABASE=taskmanager
MYSQL_USER=user
MYSQL_PASSWORD=c00lpa55
DB_USER=user
DB_PASSWORD=c00lpa55
DB_HOST=taskmanager-db
DB_PORT=3306
DB_NAME=taskmanager
MYSQL_ROOT_PASSWORD=h4rdpa55
EOF

# Create podman network:
podman network create taskmanager-network

