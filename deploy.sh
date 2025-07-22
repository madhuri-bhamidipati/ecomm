#!/bin/bash

ENV=$1
echo "Deploying to $ENV environment..."

# Example commands:
docker stop ecomm-app || true
docker rm ecomm-app || true
docker run -d --name ecomm-app -p 80:80 ecomm-app:${BUILD_NUMBER}
