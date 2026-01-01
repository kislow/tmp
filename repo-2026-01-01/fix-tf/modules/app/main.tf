variable "name" {}
variable "db_url" {}

resource "docker_container" "app" {
  name  = var.name
  image = "nginx:alpine"

  env = [
    "DATABASE_URL=${var.db_url}"
  ]

  ports {
    internal = 80
    external = 8080
  }
}
