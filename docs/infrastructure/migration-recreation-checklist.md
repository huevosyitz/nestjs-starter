# Safe Migration/Recreation Checklist

## Phase 1: Inventory and safety

- [ ] Record Coolify version.
- [ ] List existing app/database resources and IDs.
- [ ] Confirm what data must be retained.
- [ ] Snapshot backup status.
- [ ] Confirm DNS records and TLS settings.

## Phase 2: IaC setup

- [ ] Configure backend and locks.
- [ ] Configure provider auth via secrets.
- [ ] Run `tofu fmt -check`, `tofu validate`, `tofu plan`.
- [ ] Verify plan affects only intended resources.

## Phase 3: Staging provisioning

- [ ] Apply staging Terraform.
- [ ] Verify `api-staging` deploys and serves `/health`.
- [ ] Verify staging database connectivity.
- [ ] Run migrations in staging.

## Phase 4: Production provisioning

- [ ] Apply production Terraform through approval-gated workflow.
- [ ] Verify `api` production `/health`.
- [ ] Confirm production database isolation.

## Phase 5: Decommission obsolete resources

- [ ] Confirm both new environments are stable.
- [ ] Back up any remaining legacy data.
- [ ] Destroy only explicitly approved obsolete app/database resources.
- [ ] Do not touch VPS/Coolify core components/unrelated resources.

## Phase 6: Handover

- [ ] Verify another developer can run plan/apply with docs only.
- [ ] Confirm drift-free `tofu plan` in both environments.
- [ ] Confirm runbooks are complete and up to date.
