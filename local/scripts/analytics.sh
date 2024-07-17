#!/bin/bash

echo "--- Initializing ---"
cd "$PATH_PARAM"

# Build initializer image
podman build -t task_manager_analytics task-manager-analytics/.

# Create analytics container
podman run -d \
  --name taskmanager-analytics \
  --network taskmanager-network \
  --env-file /tmp/.task-manager-env \
  -p 8082:5000 \
  task_manager_analytics