output "uuid" {
  value = coolify_database_postgresql.this.uuid
}

output "host" {
  value = coolify_database_postgresql.this.name
}

output "port" {
  value = 5432
}

output "username" {
  value = var.postgres_user
}

output "password" {
  value     = var.postgres_password
  sensitive = true
}

output "database" {
  value = var.postgres_db
}

