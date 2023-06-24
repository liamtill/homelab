resource "proxmox_lxc" "dev-ct" {

    # pve node
    target_node = "nimbus-pve"
    count=0

    # define machine name
    hostname = "dev-ct"
    description = "dev container"
    # template is unprivileged so no need to set option
    ostemplate = var.ct_template
    unprivileged = "true"
    password = var.container_password
    ssh_public_keys = var.ssh_public_key

       # start after creation
    start = "true"
    # start on boot
    onboot = "true"

    # ct settings
    cores = 1
    memory = 1024

    # define network
    network {
      bridge = "vmbr0"
      name = "eth0"
      ip = "dhcp"
    }

    # define root fs
    rootfs {
      storage = "local-lvm"
      size    = "8G"
    }

}

