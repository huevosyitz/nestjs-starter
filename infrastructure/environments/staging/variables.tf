variable "coolify_endpoint" {
  type = string
}

variable "coolify_token" {
  type      = string
  sensitive = true
}

variable "project_name" {
  type    = string
  default = "nestjs-starter-staging"
}

variable "project_description" {
  type    = string
  default = "NestJS staging stack managed by Terraform"
}

variable "server_uuid" {
  type = string
}

variable "github_app_uuid" {
  type = string
}

variable "destination_uuid" {
  type    = string
  default = null
}

variable "git_repository" {
  type    = string
  default = "https://github.com/huevosyitz/nestjs-starter"
}

variable "postgres_user" {
  type    = string
  default = "nest_staging"
}

variable "postgres_password" {
  type      = string
  sensitive = true
}

variable "postgres_db" {
  type    = string
  default = "nest_staging"
}

variable "postgres_backup_frequency" {
  type    = string
  default = "0 2 * * *"
}

variable "deploy_on_apply" {
  type    = bool
  default = false
}

variable "deployment_commit_sha" {
  type    = string
  default = ""
}

