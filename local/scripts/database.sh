#!/bin/bash

echo "--- Creating Database ---"
cd "$PATH_PARAM"

# Start and configure DB container:
podman run -d \
  --name taskmanager-db \
  --network taskmanager-network \
  --env-file /tmp/.task-manager-env \
  registry.redhat.io/rhel9/mysql-80

# Build initializer image
podman build -t task_manager_db_initializer task-manager-db-initializer/.

# Run initializer
podman run --rm \
  --network taskmanager-network \
  --env-file /tmp/.task-manager-env \
  task_manager_db_initializer

# Validate 100 as expected result
podman run --rm \
  --name validate-data \
  --network taskmanager-network \
  --env-file /tmp/.task-manager-env \
  registry.redhat.io/rhel9/mysql-80 \
  sh -c 'exec mysql -h $DB_HOST -uroot -p"$MYSQL_ROOT_PASSWORD" -e "SELECT COUNT(*) FROM taskmanager.task;"'