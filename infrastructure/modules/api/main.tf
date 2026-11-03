terraform {
  required_providers {
    coolify = {
      source = "coolify-terraform/coolify"
    }
  }
}

resource "coolify_application_github_app" "this" {
  name             = var.name
  project_uuid     = var.project_uuid
  environment_uuid = var.environment_uuid
  server_uuid      = var.server_uuid
  destination_uuid = var.destination_uuid

  github_app_uuid = var.github_app_uuid
  git_repository  = var.git_repository
  git_branch      = var.git_branch
  build_pack      = var.build_pack
  ports_exposes   = var.ports_exposes

  domains                   = "https://${var.domain}"
  health_check_enabled      = true
  health_check_type         = "http"
  health_check_method       = "GET"
  health_check_scheme       = "http"
  health_check_path         = "/health"
  health_check_port         = "3000"
  health_check_retries      = 5
  health_check_timeout      = 5
  health_check_interval     = 15
  health_check_start_period = 10
}

resource "coolify_environment_variable" "database_url" {
  application_uuid = coolify_application_github_app.this.uuid
  key              = "DATABASE_URL"
  value            = var.database_url
  is_build         = false
  is_runtime       = true
  is_literal       = true
}

resource "coolify_environment_variable" "node_env" {
  application_uuid = coolify_application_github_app.this.uuid
  key              = "NODE_ENV"
  value            = var.environment_name == "production" ? "production" : "staging"
  is_build         = false
  is_runtime       = true
  is_literal       = true
}

resource "coolify_environment_variable" "port" {
  application_uuid = coolify_application_github_app.this.uuid
  key              = "PORT"
  value            = "3000"
  is_build         = false
  is_runtime       = true
  is_literal       = true
}

resource "coolify_environment_variable" "db_synchronize" {
  application_uuid = coolify_application_github_app.this.uuid
  key              = "DB_SYNCHRONIZE"
  value            = "false"
  is_build         = false
  is_runtime       = true
  is_literal       = true
}

resource "coolify_deployment" "this" {
  count = var.deploy_on_apply ? 1 : 0

  application_uuid    = coolify_application_github_app.this.uuid
  wait_for_completion = true
  triggers = {
    commit_sha = var.deployment_commit_sha
  }
}
