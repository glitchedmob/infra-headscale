locals {
  headscale_proxmox_nodes_set = toset(local.headscale_proxmox_nodes)
}

resource "terraform_data" "headscale_key_rotation" {
  input = local.headscale_key_rotation_version
}

resource "headscale_pre_auth_key" "proxmox" {
  for_each = local.headscale_proxmox_nodes_set

  user           = headscale_user.proxmox.id
  time_to_expire = "1h"
  reusable       = false
  ephemeral      = false
  acl_tags       = [local.proxmox_tag]

  lifecycle {
    replace_triggered_by = [terraform_data.headscale_key_rotation]
  }
}

resource "aws_ssm_parameter" "headscale_proxmox_auth_key" {
  for_each = local.headscale_proxmox_nodes_set

  name             = "${local.headscale_ssm_path_prefix}/${each.value}-auth-key"
  type             = "SecureString"
  description      = "Headscale pre-auth key for ${each.value}"
  value_wo         = headscale_pre_auth_key.proxmox[each.value].key
  value_wo_version = local.headscale_key_rotation_version
  overwrite        = true
}
