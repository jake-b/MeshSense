#!/bin/bash

# Set environment variables
export DEV_API_URL=http://localhost:5920
export DEV_UI_URL=http://localhost:5921

# Start UI service
echo "Starting UI service..."
cd /app/MeshSense/ui
PORT=5921 npm run dev &

# Start API service
echo "Starting API service..."
cd /app/MeshSense/api
if [[ -z "${DEPLOY_ENV}" ]]; then
  PORT=5920 npm run dev &
else
  ACCESS_KEY=${ACCESS_KEY} PORT=5920 npm run dev &
fi

# Keep container running
wait
