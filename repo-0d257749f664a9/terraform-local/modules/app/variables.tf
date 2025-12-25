variable "name" {
  type        = string
  description = "Container name"
}

variable "image" {
  description = "Container image"
  type        = string
  default     = ""
}

variable "database_url" {
  description = "Database connection URL"
  type        = string
  default     = ""
}

variable "internal_port" {
  type        = number
  description = "DECIDE ON PORT FOR THE APPS 🙂‍↔️"
  default     = 3000
}

variable "external_port" {
  description = "Port exposed to the host machine"
  type        = number
}
