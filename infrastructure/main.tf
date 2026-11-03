resource "coolify_project" "this" {
  name        = var.project_name
  description = var.project_description
}

resource "coolify_environment" "this" {
  project_uuid = coolify_project.this.uuid
  name         = var.environment_name
}

locals {
  database_url = format(
    "postgresql://%s:%s@%s:%d/%s",
    var.postgres_user,
    urlencode(var.postgres_password),
    var.postgres_name,
    5432,
    var.postgres_db,
  )
}

module "postgres" {
  source = "./modules/postgres"

  project_uuid        = coolify_project.this.uuid
  environment_uuid    = coolify_environment.this.uuid
  server_uuid         = var.server_uuid
  destination_uuid    = var.destination_uuid
  name                = var.postgres_name
  image               = var.postgres_image
  postgres_user       = var.postgres_user
  postgres_password   = var.postgres_password
  postgres_db         = var.postgres_db
  backup_frequency    = var.postgres_backup_frequency
  backup_enabled      = var.postgres_backup_enabled
  retain_days_locally = var.postgres_retain_days_locally
}

module "api" {
  source = "./modules/api"

  project_uuid          = coolify_project.this.uuid
  environment_uuid      = coolify_environment.this.uuid
  server_uuid           = var.server_uuid
  destination_uuid      = var.destination_uuid
  name                  = var.application_name
  github_app_uuid       = var.github_app_uuid
  git_repository        = var.git_repository
  git_branch            = var.git_branch
  domain                = var.domain
  build_pack            = var.build_pack
  ports_exposes         = var.ports_exposes
  database_url          = local.database_url
  environment_name      = var.environment
  deploy_on_apply       = var.deploy_on_apply
  deployment_commit_sha = var.deployment_commit_sha

  depends_on = [module.postgres]
}

