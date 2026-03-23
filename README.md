# infra-headscale

Terraform configuration for Headscale control-plane resources in glitchedmob.

## Components

- **src/tf/** - OpenTofu project managing Headscale users and ACL policy

## Prerequisites

- [OpenTofu](https://opentofu.org/) >= 1.11 (version in `src/tf/.tofu-version`)
- AWS credentials (for S3 backend and DynamoDB lock table)
- Headscale API key
- Reachable Headscale endpoint (default: `https://headscale.levizitting.com`)

## Usage

```bash
make tf-init     # Initialize
make tf-plan     # Preview changes
make tf-apply    # Apply changes
make tf-validate # Validate syntax
make tf-format   # Check formatting
```

## Notes

- Apply this after `infra-public-edge` has deployed Headscale and it is reachable.
- Backend key intentionally remains `headscale-global/terraform.tfstate` to preserve existing state location.
