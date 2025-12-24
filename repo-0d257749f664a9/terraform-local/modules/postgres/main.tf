terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_container" "this" {
  name  = var.name
  image = "postgres:16"

  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.user}",
    "POSTGRES_PASSWORD=${var.password}"
  ]

  ports {
    internal = FIND_MY_DEFAULT_PORT_😏
    external = var.port
  }

  restart = "unless-stopped"
}

variable "name" {
  type        = string
  description = "Container name"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "user" {
  type        = string
  description = "Database user"
}

variable "password" {
  type        = string
  description = "Database password"
}

variable "port" {
  type        = number
  description = "Exposed port on localhost"
}

output "connection_string" {
  value = "postgresql://${var.user}:${var.password}@localhost:${var.port}/${var.db_name}"
}
