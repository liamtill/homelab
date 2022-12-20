resource "proxmox_lxc" "ubuntu-ct" {

    # pve node
    target_node = "nimbus-pve"

    # define machine name
    hostname = "ubuntu-ct"
    description = "Ubuntu 20.04 Container"

    # ct id to clone
    clone = "6000"
    # full clone
    full = "true"
    # start at boot
    start = "true"

    # ct settings
    clone_storage = "local-lvm"
    cores = 1
    memory = 1024

    # define network
    network {
      bridge = "vmbr0"
      name = "eth0"
      ip = "dhcp"
    }

  # ct ip
  provisioner "remote-exec" {
    inline = [
      "ip a"
    ]
  }

}

