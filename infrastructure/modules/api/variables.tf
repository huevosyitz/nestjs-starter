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

variable "github_app_uuid" {
  type = string
}

variable "git_repository" {
  type = string
}

variable "git_branch" {
  type = string
}

variable "domain" {
  type = string
}

variable "build_pack" {
  type = string
}

variable "ports_exposes" {
  type = string
}

variable "database_url" {
  type      = string
  sensitive = true
}

variable "environment_name" {
  type = string
}

variable "deploy_on_apply" {
  type = bool
}

variable "deployment_commit_sha" {
  type = string
}

