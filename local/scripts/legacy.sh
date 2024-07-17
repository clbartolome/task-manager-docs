#!/bin/bash

echo "--- Initializing ---"
cd "$PATH_PARAM"

# Build legacy application WAR
mvn clean package -f task-manager-legacy/pom.xml

# Build legacy app image
podman build -t task_manager_legacy task-manager-legacy/.

# Create tomcat container
podman run -d \
  --name taskmanager-legacy \
  --network taskmanager-network \
  --env-file /tmp/.task-manager-env \
  -p 8080:8080 \
  task_manager_legacy
