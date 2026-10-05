# Node.js Demo App

### Automated CI/CD Pipeline with GitHub Actions and Docker

A lightweight Node.js application demonstrating an automated **Test → Build → Publish** CI/CD workflow using GitHub Actions and Docker Hub.

[![CI/CD Pipeline](https://github.com/sakthi2300/nodejs-demo-app/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/sakthi2300/nodejs-demo-app/actions/workflows/main.yml)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-Public%20Image-blue?logo=docker)](https://hub.docker.com/r/sakthi2300/nodejs-demo-app)
[![Node.js](https://img.shields.io/badge/Node.js-22-339933?logo=node.js\&logoColor=white)](https://nodejs.org/)

**Repository:** [GitHub](https://github.com/sakthi2300/nodejs-demo-app) | **Docker Image:** [Docker Hub](https://hub.docker.com/r/sakthi2300/nodejs-demo-app)

---

## Overview

This project demonstrates how to automate the testing, containerization, and publishing of a Node.js application using **GitHub Actions** and **Docker**.

Whenever code is pushed to the `main` branch, GitHub Actions automatically executes the configured workflow to:

* Check out the source code.
* Set up Node.js 22.
* Install dependencies using `npm ci`.
* Run application tests.
* Build a Docker image.
* Authenticate securely with Docker Hub.
* Publish the Docker image to Docker Hub.

This project demonstrates the fundamentals of CI/CD automation and Docker-based application delivery.

## CI/CD Workflow

```text
       Code Push to Main
               |
               v
      GitHub Actions Runner
               |
               v
      Checkout Source Code
               |
               v
       Set Up Node.js 22
               |
               v
     Install Dependencies
           (npm ci)
               |
               v
         Run Tests
         (npm test)
               |
               v
      Build Docker Image
               |
               v
    Authenticate with Docker Hub
        (GitHub Secrets)
               |
               v
     Publish Image to Docker Hub
```

### Pipeline Stages

| Stage    | Description                                                    |
| -------- | -------------------------------------------------------------- |
| Trigger  | Automatically starts when code is pushed to the `main` branch. |
| Checkout | Retrieves the source code from GitHub.                         |
| Setup    | Configures Node.js 22 on the GitHub-hosted runner.             |
| Install  | Installs dependencies using `npm ci`.                          |
| Test     | Executes the application tests using `npm test`.               |
| Build    | Builds the Docker image using the project's Dockerfile.        |
| Publish  | Authenticates securely and pushes the image to Docker Hub.     |

## Technology Stack

| Technology     | Purpose                      |
| -------------- | ---------------------------- |
| Node.js 22     | JavaScript runtime           |
| Express.js     | Web application framework    |
| Docker         | Application containerization |
| Git            | Version control              |
| GitHub         | Source code hosting          |
| GitHub Actions | CI/CD automation             |
| Docker Hub     | Container image registry     |

## Application Endpoints

| Method | Endpoint  | Response                           |
| ------ | --------- | ---------------------------------- |
| `GET`  | `/`       | `Hello! Node.js CI/CD is working.` |
| `GET`  | `/health` | `{"status":"OK"}`                  |

## Getting Started

### Prerequisites

Ensure the following tools are installed:

* Node.js 22 and npm
* Git
* Docker (for container-based execution)

### 1. Clone the Repository

```bash
git clone https://github.com/sakthi2300/nodejs-demo-app.git
cd nodejs-demo-app
```

### 2. Install Dependencies

```bash
npm ci
```

### 3. Run Tests

```bash
npm test
```

### 4. Start the Application

```bash
npm start
```

The application will be available at:

* **Application:** http://localhost:3000
* **Health Check:** http://localhost:3000/health

## Run with Docker

### 1. Build the Docker Image

```bash
docker build -t nodejs-demo-app .
```

### 2. Start a Container

```bash
docker run -d --name nodes-test -p 3000:3000 nodejs-demo-app
```

### 3. Verify the Container

Check whether the container is running:

```bash
docker ps
```

View the application logs:

```bash
docker logs nodes-test
```

Check the container's health endpoint:

```bash
curl http://localhost:3000/health
```

To stop the container:

```bash
docker stop nodes-test
```

To remove the container:

```bash
docker rm nodes-test
```

If the container name `nodes-test` is already in use, choose a different name or inspect the existing container before removing it.

## Docker Hub

The GitHub Actions workflow publishes the Docker image to the following public repository:

**Docker Hub:** https://hub.docker.com/r/sakthi2300/nodejs-demo-app

**Image:** `sakthi2300/nodejs-demo-app:latest`

### Pull the Published Image

```bash
docker pull sakthi2300/nodejs-demo-app:latest
```

### Run the Published Image

```bash
docker run -d --name nodes-test -p 3000:3000 sakthi2300/nodejs-demo-app:latest
```

The application will be accessible at http://localhost:3000.

> Note: The `latest` tag assumes that the GitHub Actions workflow publishes the image with that tag.

## GitHub Actions Configuration

The CI/CD workflow is defined in:

```text
.github/workflows/main.yml
```

The workflow is configured to execute automatically when code is pushed to the `main` branch.

### Required GitHub Secrets

Configure the following secrets in:

**GitHub → Repository → Settings → Secrets and variables → Actions**

| Secret               | Description             |
| -------------------- | ----------------------- |
| `DOCKERHUB_USERNAME` | Docker Hub username     |
| `DOCKERHUB_TOKEN`    | Docker Hub access token |

These secrets allow GitHub Actions to authenticate with Docker Hub without exposing credentials in the source code.

**Security:** Never commit passwords, access tokens, or other sensitive credentials to the repository.

## Repository Links

* **GitHub Repository:** https://github.com/sakthi2300/nodejs-demo-app
* **GitHub Actions:** https://github.com/sakthi2300/nodejs-demo-app/actions
* **Docker Hub:** https://hub.docker.com/r/sakthi2300/nodejs-demo-app

## Key Outcomes

* Automated testing through GitHub Actions.
* Docker image creation using a Dockerfile.
* Secure Docker Hub authentication using GitHub Secrets.
* Automated publishing of Docker images to Docker Hub.
* CI/CD workflow triggered by pushes to the `main` branch.
* Containerized application execution using Docker.

## Deployment Scope

This pipeline automates application testing, Docker image building, and publishing to Docker Hub.

It does not deploy a continuously running application to a cloud hosting environment. The published Docker image can be pulled and run on any compatible Docker host.

---

**Node.js Demo App | DevOps Internship — Task 1**
