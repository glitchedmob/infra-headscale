locals {
  management_route        = "10.0.0.0/24"
  workload_route_supernet = "10.20.0.0/16"
  sgfdevs_workload_cidr   = "10.20.4.0/22"
  proxmox_tag             = "tag:proxmox-x86"
  gha_sgfdevs_tag         = "tag:gha-sgfdevs"
  proxmox_user            = "proxmox"
  gha_sgfdevs_user        = "gha-sgfdevs"
  admins                  = [headscale_user.levizitting.name]
  headscale_proxmox_nodes = ["x86-node-01", "x86-node-02"]
}
