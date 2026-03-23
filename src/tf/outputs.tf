output "headscale_proxmox_auth_key_ssm_paths" {
  value = {
    for node_name, parameter in aws_ssm_parameter.headscale_proxmox_auth_key :
    node_name => parameter.name
  }
  description = "SSM parameter paths for per-node Headscale pre-auth keys"
}

output "headscale_gha_sgfdevs_auth_key_ssm_path" {
  value       = aws_ssm_parameter.headscale_gha_sgfdevs_auth_key.name
  description = "SSM parameter path for sgfdevs GitHub Actions Headscale pre-auth key"
}
