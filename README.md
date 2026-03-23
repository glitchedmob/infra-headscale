# infra-headscale

Terraform configuration for Headscale control-plane resources in glitchedmob.

## Scope

- **OpenTofu (`src/tf/`)**: manages Headscale users and ACL policy resources.

## Prerequisites

- [OpenTofu](https://opentofu.org/) >= 1.11 (version in `src/tf/.tofu-version`)
- AWS credentials (for S3 backend and DynamoDB lock table)
- Headscale API key
- Reachable Headscale endpoint (default: `https://headscale.levizitting.com`)

## Usage

```bash
make tf-init
make tf-plan
make tf-show ARGS=tfplan
make tf-output
make tf-apply
make tf-validate
make tf-format
make tf-lint-fix
```

## Operational Notes

- Apply this after `infra-public-edge` has deployed Headscale and it is reachable.
- Backend key intentionally remains `headscale-global/terraform.tfstate` to preserve existing state location.
