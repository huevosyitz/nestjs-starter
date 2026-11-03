variable "project_uuid" {
  type = string
}

variable "environment_uuid" {
  type = string
}

variable "server_uuid" {
  type = string
}

variable "destination_uuid" {
  type    = string
  default = null
}

variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "postgres_user" {
  type = string
}

variable "postgres_password" {
  type      = string
  sensitive = true
}

variable "postgres_db" {
  type = string
}

variable "backup_frequency" {
  type = string
}

variable "backup_enabled" {
  type = bool
}

variable "retain_days_locally" {
  type = number
}

