# Automated vs Manual Actions Summary

## Automated by OpenTofu/Terraform

- Coolify projects/environments (per environment stack).
- Coolify app resource (GitHub App source, branch, domain, health check config).
- Coolify PostgreSQL resource (image, credentials, private access).
- Application environment variables including `DATABASE_URL`.
- Scheduled DB backups in Coolify.

## Automated by GitHub Actions

- PR checks: lint, tests, build.
- OpenTofu fmt/validate checks when infrastructure changes.
- Staging deployment workflow (plan/apply + health verification).
- Production workflow with manual dispatch and environment gate.
- Manual-dispatch Coolify inventory workflow exporting a JSON artifact of live resources.

## Manual prerequisites and controls

- Enable Coolify API and create API token.
- Provide backend bucket/lock table and access controls.
- Provide Coolify server/GitHub App UUIDs and secrets.
- Configure Cloudflare DNS A records if not yet present.
- Configure branch protection/ruleset and required checks in GitHub.
- Approve production deployments through GitHub Environment reviewers.

## Manual-only (or version-dependent) areas

- Any Coolify settings not exposed by current provider/API endpoints.
- Off-VPS backup destination setup unless S3 storage resource is explicitly configured.
- Destructive operations and legacy resource cleanup approvals.
