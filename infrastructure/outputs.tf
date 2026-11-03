output "project_uuid" {
  value = coolify_project.this.uuid
}

output "environment_uuid" {
  value = coolify_environment.this.uuid
}

output "application_uuid" {
  value = module.api.uuid
}

output "application_domain" {
  value = module.api.fqdn
}

output "database_uuid" {
  value = module.postgres.uuid
}

