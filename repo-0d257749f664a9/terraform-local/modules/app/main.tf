
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

