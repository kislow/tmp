output "connection_string" {
  value = "postgresql://${var.user}:${var.password}@localhost:${var.port}/${var.db_name}"
}
