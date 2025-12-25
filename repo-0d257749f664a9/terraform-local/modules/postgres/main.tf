resource "docker_container" "this" {
  name  = var.name
  image = "postgres:16"

  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.user}",
    "POSTGRES_PASSWORD=${var.password}"
  ]

  ports {
    internal = var.port
    external = 5432
  }

  restart = "unless-stopped"
}
