resource "docker_container" "postgres" {
  name  = "postgres"
  image = "postgres:15"

  env = [
    "POSTGRES_DB=users",
    "POSTGRES_USER=user",
    "POSTGRES_PASSWORD=password"
  ]

  ports {
    internal = 5432
    external = 5432
  }
}
