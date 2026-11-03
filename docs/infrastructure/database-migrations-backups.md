# Database Migrations and Backups

## Migration strategy

- Canonical DB connection variable: `DATABASE_URL`.
- Production-safe migration mode: TypeORM migrations, not schema auto-sync.
- `DB_SYNCHRONIZE` should stay `false` for staging/production.

## Migration commands

From repository root:

```bash
npm run migration:show
npm run migration:run
npm run migration:revert
```

These scripts compile the app and use [src/database/data-source.ts](../../src/database/data-source.ts).

## Deployment order

1. Deploy infra/app changes to staging.
2. Run migrations against staging database.
3. Validate integration tests.
4. Promote to production after review.
5. Run production migrations as part of controlled release operation.

## Backups

- Scheduled Coolify DB backup resource is managed by OpenTofu/Terraform.
- Keep local retention configured.
- Add off-VPS backup destination when S3-compatible storage is approved and configured.

## Restore testing

- Periodically restore a recent backup into a non-production environment.
- Verify application connectivity and critical data shape after restore.
- Record restore test outcomes in release ops notes.
