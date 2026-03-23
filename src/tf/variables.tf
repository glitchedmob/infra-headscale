variable "aws_region" {
  description = "AWS region for SSM parameters"
  type        = string
  default     = "us-east-2"
}

variable "headscale_host" {
  description = "Headscale hostname"
  type        = string
  default     = "headscale.levizitting.com"
}

variable "headscale_api_key" {
  description = "Headscale API key"
  type        = string
  sensitive   = true
}
