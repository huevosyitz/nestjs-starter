# Staging and Production Deployment Guide

## Branch flow

1. Feature branch -> PR -> merge into `staging`
2. `staging` deployment and validation
3. PR from `staging` -> `main`
4. Manual approved production deployment

## Staging deployment

- Trigger: push to `staging` or manual workflow dispatch.
- Workflow:
  1. Run CI checks.
  2. OpenTofu init/validate/plan/apply for staging.
  3. Optional deployment trigger resource when enabled.
  4. Health check on `https://api-staging.lumiovera.com/health`.

## Production deployment

- Trigger: manual workflow dispatch only.
- Control: GitHub `production` environment with required reviewers.
- Workflow:
  1. Confirm latest validated `staging` commit.
  2. OpenTofu init/validate/plan/apply for production.
  3. Health check on `https://api.lumiovera.com/health`.
  4. Record deployed commit SHA in workflow summary/release notes.

## Safety controls

- No auto-deploy to production on PR open.
- No `-auto-approve` for production applies.
- Require human review for destructive plan changes.
- Keep staging and production credentials fully separate.
