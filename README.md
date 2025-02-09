# CI/CD Pipeline with Jenkins & Docker

This project demonstrates a CI/CD pipeline that tests, builds, and deploys a containerized application using Jenkins, Docker, Kubernetes, and Ansible. The pipeline is designed to automate the full lifecycle of a sample application from source code to deployment.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [Pipeline Details](#pipeline-details)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository provides a fully automated CI/CD pipeline using Jenkins that:
1. Checks out code from a Git repository.
2. Builds a Docker image for the application.
3. Runs tests inside a container.
4. Pushes the Docker image to a container registry.
5. Deploys the application to a Kubernetes cluster via Ansible.

The pipeline is defined in the `Jenkinsfile`, and the sample application is provided under the `app/` directory. Kubernetes deployment manifests are located in the `k8s/` folder, and Ansible playbooks are used to handle deployment tasks.

## Features

- **Automated Builds:** Automatically build Docker images using Jenkins.
- **Continuous Testing:** Run tests within the Docker container to ensure code quality.
- **Container Registry Integration:** Push built images to a container registry.
- **Kubernetes Deployment:** Deploy the application to a Kubernetes cluster using a declarative manifest.
- **Ansible Automation:** Use Ansible playbooks to orchestrate deployment tasks.
- **Clean Workspace:** Automatically clean up the workspace after each build.

## Technologies Used

- **Jenkins:** Automation server for orchestrating CI/CD pipelines.
- **Docker:** Containerization platform for building and running applications.
- **Kubernetes:** Container orchestration platform for deploying and managing applications.
- **Ansible:** Automation tool to deploy the application to Kubernetes.
- **Git:** Version control system for source code management.

## Project Structure

ci-cd-jenkins-docker/ ├── README.md ├── Jenkinsfile ├── app/ │ ├── Dockerfile │ ├── requirements.txt │ ├── app.py │ └── test/ │ └── test_app.py ├── ansible/ │ ├── deploy.yml │ └── inventory.ini ├── k8s/ │ └── deployment.yaml └── scripts/ └── build.sh


## Prerequisites

Before you begin, ensure you have the following installed and configured:

- **Jenkins:** Installed with Docker capabilities and access to your source code repository.
- **Docker:** Installed on the Jenkins server or agent.
- **Kubernetes Cluster:** Access to a running Kubernetes cluster (e.g., Minikube, Kind, or a cloud provider cluster).
- **kubectl:** Configured to interact with your Kubernetes cluster.
- **Ansible:** Installed on the Jenkins server or agent.
- **Git:** For source code management and repository checkout.

## Installation & Setup

1. **Clone the Repository:**

   ```bash
   git clone <repository_url>
   cd ci-cd-jenkins-docker
   ```
Configure Jenkins:

Create a new pipeline job in Jenkins and point it to this repository.
Ensure that Jenkins has the necessary credentials to access your Docker registry (e.g., Docker Hub) and your Kubernetes cluster.
Install required plugins (Docker, Ansible, Git, etc.).
Update Configuration (if needed):

Modify the Jenkinsfile environment variables (e.g., REGISTRY, DOCKER_CREDENTIALS_ID) to match your environment.
Update the Kubernetes manifest in k8s/deployment.yaml with the correct image name and tag.
Adjust the Ansible inventory (ansible/inventory.ini) if deploying to a remote host.
Pipeline Details
The pipeline defined in the Jenkinsfile contains the following stages:

Checkout: Retrieves the source code from the repository.
Build Docker Image: Builds a Docker image using the Dockerfile from the app/ directory.
Test: Runs containerized tests to validate the build.
Push Docker Image: Pushes the Docker image to the container registry.
Deploy to Kubernetes: Uses an Ansible playbook to deploy the application using Kubernetes manifests.
Configuration
Jenkinsfile
Environment Variables:
REGISTRY: Your Docker registry (e.g., Docker Hub username).
IMAGE_NAME: The name of the Docker image.
IMAGE_TAG: The tag for the Docker image (e.g., latest).
DOCKER_CREDENTIALS_ID: The Jenkins credential ID for your Docker registry.
Dockerfile (app/Dockerfile)
Defines the base image, sets the working directory, installs dependencies, and specifies the startup command for the application.

Ansible Playbook (ansible/deploy.yml)
Runs a command to apply the Kubernetes manifest. You can extend this playbook with additional tasks as needed.

Kubernetes Manifest (k8s/deployment.yaml)
Defines a Kubernetes Deployment for the sample application. Adjust the container image and replica count as required.

Troubleshooting
Jenkins Build Failures:
Check the console output for error messages. Ensure that Jenkins has the required permissions to run Docker and Ansible commands.

Docker Image Issues:
Verify that the Dockerfile builds correctly locally before running in Jenkins.

Deployment Errors:
Use kubectl get pods and kubectl logs <pod-name> to diagnose issues with the deployed application.

Ansible Errors:
Run the playbook locally using ansible-playbook -i ansible/inventory.ini ansible/deploy.yml to debug.

Contributing
Contributions are welcome! If you have suggestions, bug fixes, or improvements, please open an issue or submit a pull request. Please follow the project’s code style guidelines and document your changes accordingly.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Happy Building and Deploying!


