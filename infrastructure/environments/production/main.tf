terraform {
  backend "s3" {}
}

module "stack" {
  source = "../.."

  coolify_endpoint = var.coolify_endpoint
  coolify_token    = var.coolify_token

  environment         = "production"
  project_name        = var.project_name
  project_description = var.project_description
  environment_name    = "production"

  server_uuid      = var.server_uuid
  github_app_uuid  = var.github_app_uuid
  destination_uuid = var.destination_uuid

  application_name = "api-production"
  git_repository   = var.git_repository
  git_branch       = "main"
  domain           = "api.lumiovera.com"

  postgres_name             = "postgres-production"
  postgres_image            = "postgres:16"
  postgres_user             = var.postgres_user
  postgres_password         = var.postgres_password
  postgres_db               = var.postgres_db
  postgres_backup_frequency = var.postgres_backup_frequency
  postgres_backup_enabled   = true

  deploy_on_apply       = var.deploy_on_apply
  deployment_commit_sha = var.deployment_commit_sha
}

