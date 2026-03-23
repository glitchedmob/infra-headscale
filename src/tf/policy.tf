resource "headscale_policy" "this" {
  policy = jsonencode({
    "groups" : {
      "group:admins" : formatlist("%s@", local.admins)
      "group:infra" : concat(
        formatlist("%s@", local.admins),
        [format("%s@", local.proxmox_user)]
      )
    }
    "tagOwners" : {
      (local.proxmox_tag) : ["group:infra"]
    }
    "autoApprovers" : {
      "routes" : {
        (local.proxmox_route) : [local.proxmox_tag]
      }
    }
    "acls" : [
      {
        "action" : "accept"
        "src" : ["group:admins"]
        "dst" : [
          format("%s:*", local.proxmox_tag),
          format("%s:*", local.proxmox_route),
        ]
      },
      {
        "action" : "accept"
        "src" : [local.proxmox_tag]
        "dst" : [format("%s:*", local.proxmox_tag)]
      },
    ]
  })
}
