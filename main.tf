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