# Terraform Docker Infrastructure as Code (IaC) – DevOps Task 3

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage a local Docker container.

An existing Node.js Docker application image, `nodejs-demo-app:latest`, was reused. Terraform uses the Docker provider to create and manage the container.

## Objective

- Use the Terraform Docker provider.
- Provision a local Docker container.
- Use `terraform init`, `terraform plan`, and `terraform apply`.
- Verify Terraform state.
- Test the application.
- Destroy the infrastructure using `terraform destroy`.

## Technologies Used

- Terraform 1.16.5
- Docker 29.7.2
- Docker Provider `kreuzwerker/docker` v3.9.0
- Node.js 22
- Express.js
- Git and GitHub

## Architecture

```text
Terraform
    |
    v
Docker Provider
    |
    v
nodejs-demo-app:latest
    |
    v
terraform-nodejs-app
    |
    v
Host port 3001 -> Container port 3000
    |
    v
http://localhost:3001
```

## Project Structure

```text
terraform-docker-iac-task-3/
|
├── .github/
│   └── workflows/
│       └── main.yml
├── .dockerignore
├── .gitignore
├── .terraform.lock.hcl
├── Dockerfile
├── main.tf
├── package-lock.json
├── package.json
├── server.js
└── README.md
```

## Terraform Configuration

The `main.tf` file configures the Docker provider and creates the container.

```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
}

resource "docker_container" "nodejs_app" {
  name  = "terraform-nodejs-app"
  image = "nodejs-demo-app:latest"

  ports {
    internal = 3000
    external = 3001
  }
}
```

## Execution

### 1. Initialize Terraform

```bash
terraform init
```

Docker provider `kreuzwerker/docker` v3.9.0 was installed successfully.

### 2. Create the Terraform Plan

```bash
terraform plan
```

Result:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

### 3. Apply the Configuration

```bash
terraform apply
```

Enter:

```text
yes
```

Result:

```text
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

### 4. Check Terraform State

```bash
terraform state list
```

Result:

```text
docker_container.nodejs_app
```

### 5. Verify the Docker Container

```bash
docker ps
```

The Terraform-managed container was:

```text
terraform-nodejs-app
```

with:

```text
0.0.0.0:3001->3000/tcp
```

### 6. Test the Application

Open:

```text
http://localhost:3001
```

The application returned:

```text
Hello! Node.js CI/CD is working.
```

### 7. Destroy the Infrastructure

```bash
terraform destroy
```

Enter:

```text
yes
```

Result:

```text
Destroy complete! Resources: 1 destroyed.
```

After destruction, `docker ps` showed no running Terraform-managed container and `terraform state list` returned no resources.

## Terraform Workflow

```text
terraform init
      |
      v
terraform plan
      |
      v
terraform apply
      |
      v
Docker Container Created
      |
      v
terraform state list
      |
      v
Application Test
      |
      v
terraform destroy
      |
      v
Infrastructure Removed
```

## Task Requirements Completed

- [x] Docker provider configured
- [x] `main.tf` created
- [x] `terraform init`
- [x] `terraform plan`
- [x] `terraform apply`
- [x] Terraform state checked
- [x] Docker container verified
- [x] Application tested
- [x] `terraform destroy`
- [x] GitHub repository created

## Execution Evidence

Recommended screenshots for submission:

1. `terraform init` successful
2. `terraform plan` showing `Plan: 1 to add, 0 to change, 0 to destroy`
3. `terraform apply` showing successful creation
4. `terraform state list`
5. `docker ps` showing `terraform-nodejs-app`
6. Browser showing `http://localhost:3001`
7. `terraform destroy` showing `Destroy complete!`

## Interview Questions

### 1. What is IaC?

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using configuration files instead of manually configuring infrastructure.

### 2. How does Terraform work?

Terraform uses configuration files to define infrastructure. The normal workflow is:

```text
Configuration
    |
terraform init
    |
terraform plan
    |
terraform apply
    |
Infrastructure
```

### 3. What is a Terraform state file?

Terraform state keeps track of infrastructure resources managed by Terraform. In this task, Terraform tracked:

```text
docker_container.nodejs_app
```

### 4. Difference between `terraform plan` and `terraform apply`

`terraform plan` previews the changes Terraform intends to make.

`terraform apply` actually applies those changes and creates or modifies infrastructure.

### 5. What are Terraform providers?

Providers are plugins that allow Terraform to interact with external platforms and services. This task uses the Docker provider:

```text
kreuzwerker/docker
```

### 6. What is resource dependency?

A resource dependency is a relationship where one infrastructure resource depends on another resource. Terraform determines the appropriate order for resource operations.

### 7. How do you handle secret variables?

Secrets such as passwords, API keys, and tokens should not be hard-coded or committed to GitHub. They can be handled using Terraform variables, environment variables, secret managers, or CI/CD secret stores.

### 8. Explain the benefits of Terraform.

Terraform provides:

- Infrastructure as Code
- Repeatable provisioning
- Version-controlled infrastructure
- Preview of changes using `terraform plan`
- Automated infrastructure management
- Consistent deployments
- Infrastructure lifecycle management

## Author

**Sakthivel**

DevOps Internship – Task 3
