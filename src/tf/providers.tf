provider "aws" {
  region = var.aws_region
}

provider "headscale" {
  api_key  = var.headscale_api_key
  endpoint = "https://${var.headscale_host}"
}
