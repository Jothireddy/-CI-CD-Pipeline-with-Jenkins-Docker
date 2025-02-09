#!/bin/bash
# Build the Docker image locally for testing purposes
docker build -t mydockerhubusername/sample-app:latest -f app/Dockerfile app/
