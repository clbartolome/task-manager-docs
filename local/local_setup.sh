#!/bin/bash

# Function to display help message
show_help() {
    echo "Usage: $0 --path <path> --action <action>"
    echo ""
    echo "Options:"
    echo "  --path      Specify the path to use for running commands"
    echo ""
    echo "  --action    Specify the action to perform:"
    echo "                  init"
    echo "                  clone-repos"
    echo "                  database"
    echo "                  legacy"
    echo "                  analytics"
    echo "                  analytics-ui"
    echo "                  clean"
    echo ""
    echo "  -h, --help  Show this help message"
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --path) 
            if [ -n "$2" ] && [[ $2 != --* ]]; then
                PATH_PARAM="$2"
                shift 2
            else
                echo "Error: --path requires a non-empty argument."
                show_help
                exit 1
            fi
            ;;
        --action) 
            if [ -n "$2" ] && [[ $2 != --* ]]; then
                ACTION_PARAM="$2"
                shift 2
            else
                echo "Error: --action requires a non-empty argument."
                show_help
                exit 1
            fi
            ;;
        -h|--help) 
            show_help
            exit 0
            ;;
        *) 
            echo "Unknown parameter passed: $1"
            show_help
            exit 1
            ;;
    esac
done

# Check if path and action are provided
if [ -z "$PATH_PARAM" ]; then
    echo "Error: --path parameter is required."
    show_help
    exit 1
fi

if [ -z "$ACTION_PARAM" ]; then
    echo "Error: --action parameter is required."
    show_help
    exit 1
fi

# Check if the action script exists
ACTION_SCRIPT="scripts/${ACTION_PARAM}.sh"
if [ ! -f "$ACTION_SCRIPT" ]; then
    echo "Error: Script for action '$ACTION_PARAM' not found in the 'scripts' folder."
    exit 1
fi

# Execute the action script
echo "Executing action: $ACTION_PARAM"
echo "Using path: $PATH_PARAM"
source "$ACTION_SCRIPT"
