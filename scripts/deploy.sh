#!/bin/bash
set -e

# Define the repository path
REPO_PATH="/home/ubuntu/velocity-tasks"

# Clone the repo if it doesn't exist. Otherwise, pull the latest changes.
if [ ! -d "$REPO_PATH" ]; then
    echo "Cloning the repository into $REPO_PATH..."
    mkdir -p "$REPO_PATH"
    git clone https://github.com/PottaAkhil/velocity-tasks.git "$REPO_PATH"
else
    echo "Repository already exists. Pulling latest changes..."
    cd "$REPO_PATH"
    git pull origin main
fi

# The rest of the script is now guaranteed to be in the correct directory.
cd "$REPO_PATH"

# Build Go application
go build -o velocity-tasks ./cmd/featherjet

# ... (the rest of your script for systemd service)
