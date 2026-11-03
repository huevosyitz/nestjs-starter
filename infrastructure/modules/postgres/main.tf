terraform {
  required_providers {
    coolify = {
      source = "coolify-terraform/coolify"
    }
  }
}

resource "coolify_database_postgresql" "this" {
  name             = var.name
  project_uuid     = var.project_uuid
  environment_uuid = var.environment_uuid
  server_uuid      = var.server_uuid
  destination_uuid = var.destination_uuid

  image             = var.image
  postgres_user     = var.postgres_user
  postgres_password = var.postgres_password
  postgres_db       = var.postgres_db
  is_public         = false
}

resource "coolify_database_backup" "this" {
  database_uuid         = coolify_database_postgresql.this.uuid
  frequency             = var.backup_frequency
  enabled               = var.backup_enabled
  retain_days_locally   = var.retain_days_locally
  retain_amount_locally = 7
  save_s3               = false
}
