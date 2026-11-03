variable "coolify_endpoint" {
  type = string
}

variable "coolify_token" {
  type      = string
  sensitive = true
}

provider "coolify" {
  endpoint = var.coolify_endpoint
  token    = var.coolify_token
}

data "coolify_servers" "all" {}

data "coolify_destinations" "all" {}

data "coolify_projects" "all" {}

data "coolify_applications" "all" {}

data "coolify_databases" "all" {}

data "coolify_github_apps" "all" {}

output "servers" {
  value = data.coolify_servers.all.servers
}

output "destinations" {
  value = data.coolify_destinations.all.destinations
}

output "projects" {
  value = data.coolify_projects.all.projects
}

output "applications" {
  value = data.coolify_applications.all.applications
}

output "databases" {
  value = data.coolify_databases.all.databases
}

output "github_apps" {
  value = data.coolify_github_apps.all.github_apps
}

