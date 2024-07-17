#!/bin/bash

echo "--- Initializing ---"
cd "$PATH_PARAM"

# Build initializer image
podman build -t task_manager_analytics_ui task-manager-analytics-ui/.

# Create analytics container
podman run -d \
  --name taskmanager-analytics-ui \
  --network taskmanager-network \
  --env-file /tmp/.task-manager-env \
  -p 3000:5000 \
  task_manager_analytics_ui