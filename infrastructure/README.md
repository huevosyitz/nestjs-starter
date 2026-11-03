# OpenTofu Infrastructure (Coolify)

This directory manages staging and production infrastructure for this repository using the `coolify-terraform/coolify` provider.

## What is managed

- Coolify project and environment per deployment target.
- One GitHub App-backed Coolify application per target:
  - `api-staging` from branch `staging`
  - `api-production` from branch `main`
- One PostgreSQL resource per target:
  - `postgres-staging`
  - `postgres-production`
- App environment variables, including `DATABASE_URL`.
- Scheduled Coolify database backups.
- Optional deployment trigger resource (`coolify_deployment`) controlled by `deploy_on_apply`.

## Requirements

- OpenTofu >= 1.6 (or Terraform >= 1.6)
- Coolify provider pinned in [versions.tf](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/versions.tf)
- Coolify API enabled and token created
- Existing Coolify server UUID and GitHub App UUID
- Shared S3-compatible backend (encrypted, locked)

## Layout

- Root module:
  - [main.tf](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/main.tf)
  - [variables.tf](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/variables.tf)
- Modules:
  - [modules/api/](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/modules/api)
  - [modules/postgres/](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/modules/postgres)
- Environment roots:
  - [environments/staging/](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/environments/staging)
  - [environments/production/](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/environments/production)
- Inventory helper:
  - [inventory/](/Users/yitz/Developer/Projects/nestjs-starter/infrastructure/inventory)

## Staging quickstart

```bash
cd infrastructure/environments/staging
cp terraform.tfvars.example terraform.tfvars
cp backend.hcl.example backend.hcl

tofu init -backend-config=backend.hcl
tofu fmt -check -recursive ../..
tofu validate
tofu plan
tofu apply
```

## Production quickstart

```bash
cd infrastructure/environments/production
cp terraform.tfvars.example terraform.tfvars
cp backend.hcl.example backend.hcl

tofu init -backend-config=backend.hcl
tofu fmt -check -recursive ../..
tofu validate
tofu plan
tofu apply
```

## Safety notes

- Never commit `terraform.tfvars`, `backend.hcl`, state files, plan outputs, or credentials.
- Do not run destructive plans without explicit review.
- Keep production `deploy_on_apply = false` unless intentionally triggering deploy from OpenTofu/Terraform.
- Use GitHub Environments to enforce reviewer gates before production apply/deploy workflows.
