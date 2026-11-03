# Coolify Live Inventory

Use this module to inventory existing Coolify resources before deletion/recreation tasks.

## Required environment variables

```bash
export COOLIFY_ENDPOINT="https://coolify.lumiovera.com"
export COOLIFY_TOKEN="your-coolify-api-token"
```

## Run inventory

```bash
cd infrastructure/inventory
tofu init
tofu apply -auto-approve \
  -var="coolify_endpoint=${COOLIFY_ENDPOINT}" \
  -var="coolify_token=${COOLIFY_TOKEN}"
```

## Export inventory JSON

```bash
tofu output -json > coolify-inventory.json
```

Use this output to identify exact resources that may be safely removed and to confirm protected resources remain out of scope.

