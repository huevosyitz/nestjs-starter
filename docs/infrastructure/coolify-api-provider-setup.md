# Coolify API and OpenTofu/Terraform Provider Setup

## 1) Verify prerequisites

- Coolify instance is reachable at `https://coolify.lumiovera.com`.
- Coolify API is enabled in Coolify settings.
- OpenTofu/Terraform version is `>= 1.6`.
- Provider is pinned in [infrastructure/versions.tf](../../infrastructure/versions.tf).

## 2) Create API token

In Coolify UI:

1. Enable API in **Settings**.
2. Create token in **Security > API Tokens**.
3. Store token in a secure secrets manager or GitHub Actions secret.

Never commit token values in code or tfvars.

## 3) Collect required IDs

- `server_uuid` from Coolify server list.
- `github_app_uuid` from Coolify GitHub App integration list.
- Optional `destination_uuid` if server has multiple destinations.

## 4) Configure local execution

Set environment variables for local runs:

```bash
export COOLIFY_ENDPOINT="https://coolify.lumiovera.com"
export COOLIFY_TOKEN="***"
```

Or provide values via environment tfvars files (not committed).

## 5) Verify provider connectivity

From an environment directory:

```bash
tofu init -backend-config=backend.hcl
tofu validate
tofu plan
```

If API auth fails:

- Confirm API is enabled.
- Confirm token permissions.
- Confirm endpoint URL.

## 6) Known capability caveats

- Some Coolify settings are not writable through API/provider versions and must stay manual.
- Keep a list of any manual-only settings in PR descriptions and runbooks.
- Re-check provider docs when upgrading provider versions.
