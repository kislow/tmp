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
