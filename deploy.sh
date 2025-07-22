#!/bin/bash

set -e  # Exit immediately on any error

ENV=$1
echo "Deploying to $ENV environment..."

APP_NAME="ecomm-app"
IMAGE_NAME="${APP_NAME}:${BUILD_NUMBER}"

# Stop and remove existing container
docker stop $APP_NAME || true
docker rm $APP_NAME || true

# Run new container
docker run -d --name $APP_NAME -p 80:80 $IMAGE_NAME
