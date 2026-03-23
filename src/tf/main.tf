resource "headscale_user" "levizitting" {
  name         = "levizitting"
  display_name = "Levi Zitting"
  email        = "me@levizitting.com"
  force_delete = true
}

resource "headscale_user" "proxmox" {
  name         = "proxmox"
  force_delete = true
}
