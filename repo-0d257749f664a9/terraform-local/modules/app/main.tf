terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "database_url" {
  type = string
}

variable "internal_port" {
  type    = number
  description = "DECIDE ON PORT FOR THE APPS 🙂‍↔️"
}

variable "external_port" {
  type = number
}


resource "docker_container" "this" {
  name  = var.name
  image = var.image

  env = [
    "DATABASE_URL=${var.database_url}"
  ]

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  restart = "unless-stopped"
}

output "container_name" {
  value = docker_container.this.name
}
