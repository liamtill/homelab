resource "proxmox_lxc" "dev-ct" {

    # pve node
    target_node = "nimbus-pve"

    # define machine name
    hostname = "dev-ct"
    description = "dev container"
    # template is unprivileged so no need to set option
    ostemplate = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
    unprivileged = "true"
    password = var.container_password
    ssh_public_keys = var.ssh_public_key

    # ct id to clone
    # clone = "6000"
    # full clone
    # full = "true"
    # start after creation
    start = "true"
    # start on boot
    onboot = "true"

    # ct settings
    # clone_storage = "local-lvm"
    cores = 1
    memory = 1024
    #swap = 2048

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

