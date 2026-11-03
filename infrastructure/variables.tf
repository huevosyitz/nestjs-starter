variable "coolify_endpoint" {
  description = "Coolify API endpoint, e.g. https://coolify.lumiovera.com."
  type        = string
}

variable "coolify_token" {
  description = "Coolify API token with permissions to manage target resources."
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Logical environment name, e.g. staging or production."
  type        = string
}

variable "project_name" {
  description = "Coolify project name for this environment."
  type        = string
}

variable "project_description" {
  description = "Coolify project description."
  type        = string
  default     = "Managed by Terraform"
}

variable "environment_name" {
  description = "Coolify environment name within the project."
  type        = string
}

variable "server_uuid" {
  description = "Target Coolify server UUID."
  type        = string
}

variable "github_app_uuid" {
  description = "Coolify GitHub App integration UUID."
  type        = string
}

variable "destination_uuid" {
  description = "Optional Coolify destination UUID for multi-destination servers."
  type        = string
  default     = null
}

variable "application_name" {
  description = "Coolify application name."
  type        = string
}

variable "git_repository" {
  description = "Git repository URL or owner/repo path."
  type        = string
}

variable "git_branch" {
  description = "Git branch used by this environment."
  type        = string
}

variable "domain" {
  description = "Public HTTPS domain for the API."
  type        = string
}

variable "build_pack" {
  description = "Coolify build pack for the app."
  type        = string
  default     = "nixpacks"
}

variable "ports_exposes" {
  description = "Comma-separated application ports exposed by Coolify."
  type        = string
  default     = "3000"
}

variable "postgres_name" {
  description = "Coolify PostgreSQL resource name."
  type        = string
}

variable "postgres_image" {
  description = "PostgreSQL image tag."
  type        = string
  default     = "postgres:16"
}

variable "postgres_user" {
  description = "PostgreSQL application user."
  type        = string
}

variable "postgres_password" {
  description = "PostgreSQL application password."
  type        = string
  sensitive   = true
}

variable "postgres_db" {
  description = "PostgreSQL database name."
  type        = string
}

variable "postgres_backup_frequency" {
  description = "Cron schedule for Coolify DB backups."
  type        = string
  default     = "0 2 * * *"
}

variable "postgres_backup_enabled" {
  description = "Whether scheduled DB backups are enabled in Coolify."
  type        = bool
  default     = true
}

variable "postgres_retain_days_locally" {
  description = "Retention days for local Coolify backup copies."
  type        = number
  default     = 7
}

variable "deploy_on_apply" {
  description = "If true, trigger a deployment after Terraform apply."
  type        = bool
  default     = false
}

variable "deployment_commit_sha" {
  description = "Optional commit SHA metadata used as deployment trigger."
  type        = string
  default     = ""
}

