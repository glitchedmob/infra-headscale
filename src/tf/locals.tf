locals {
  proxmox_route = "10.0.0.0/24"
  proxmox_tag   = "tag:proxmox-x86"
  proxmox_user  = "proxmox"
  admins        = [headscale_user.levizitting.name]
}
