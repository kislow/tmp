variable "env" {
  description = "Deployment environment name"
  type        = string
}

variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "me-central-1"
}
