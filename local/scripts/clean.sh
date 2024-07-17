#!/bin/bash

echo "--- Cleaning ---"
cd "$PATH_PARAM"

# Database
podman stop taskmanager-db
podman rm taskmanager-db

# Legacy
podman stop taskmanager-legacy
podman rm taskmanager-legacy
mvn clean -f task-manager-legacy/pom.xml

# Analytics
podman stop taskmanager-analytics
podman rm taskmanager-analytics

# Analytics ui
podman stop taskmanager-analytics-ui
podman rm taskmanager-analytics-ui