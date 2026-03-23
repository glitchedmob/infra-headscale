locals {
  proxmox_route                  = "10.0.0.0/24"
  proxmox_tag                    = "tag:proxmox-x86"
  proxmox_user                   = "proxmox"
  admins                         = [headscale_user.levizitting.name]
  headscale_key_rotation_version = 4
  headscale_proxmox_nodes        = ["x86-node-01", "x86-node-02"]
  headscale_ssm_path_prefix      = "/homelab/headscale/proxmox"
}
