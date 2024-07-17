#!/bin/bash

echo "--- Initializing ---"
cd "$PATH_PARAM"

# BD Initializar
git clone git@github.com:clbartolome/task-manager-db-initializer.git

# Main app
git clone git@github.com:clbartolome/task-manager-legacy.git

# Analytics app
git clone git@github.com:clbartolome/task-manager-analytics.git

# Analytics UI
git clone git@github.com:clbartolome/task-manager-analytics-ui.git