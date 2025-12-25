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