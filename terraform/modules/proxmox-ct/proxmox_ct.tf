resource "proxmox_lxc" "proxmox-ct" {

    # pve node
    target_node = var.target_node
    count = var.ct_count

    # define machine name
    hostname = var.ct_name
    description = var.ct_description
    # template is unprivileged so no need to set option
    ostemplate = var.ct_template
    unprivileged = var.unprivileged
    password = var.container_password
    ssh_public_keys = var.ssh_public_key

    # start after creation
    start = var.start_on_create
    # start on boot
    onboot = var.start_on_boot

    # ct settings
    cores = var.num_cores
    memory = var.memory

    # define network
    network {
      bridge = "vmbr0"
      name = "eth0"
      ip = "dhcp"
    }

    # define root fs
    rootfs {
      storage = var.disk_storage
      size    = var.disk_size
    }
}

