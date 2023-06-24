resource "proxmox_lxc" "mysql-server" {

    # pve node
    target_node = "nimbus-pve"

    # define machine name
    hostname = "mysql"
    description = "MySQL Server"
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
    cores = 2
    memory = 2048

    # define network
    network {
      bridge = "vmbr0"
      name = "eth0"
      ip = "dhcp"
    }

    # define root fs
    rootfs {
      storage = "local-lvm"
      size    = "32G"
    }

}

