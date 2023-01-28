resource "proxmox_vm_qemu" "docker" {

    # pve node
    target_node = "nimbus-pve"

    # define machine name
    name = "docker"
    desc = "Docker VM"
    
    # enable the qemu-guest-agent
    agent = 1

    # vm template to clone from
    clone = "ubuntu-cloud-20.04"
    # full clone instead of linked clone
    full_clone  = "true"

    # vm settings
    os_type = "cloud-init"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    boot = "cdn"
    onboot = "true"

    # define network hw
    network {
      bridge = "vmbr0"
      model = "virtio"
    }

    # define storage
    disk {
        storage = "local-lvm"
        type = "scsi"
        size = "64G"
        # enable ssd emulation
        ssd = 1
    }

    # ipconfig0 = "gw=192.168.1.1"
    # nameserver = "192.168.1.1"

    lifecycle {
    ignore_changes  = [
      network,
    ]
  }


  # machine ip
  # provisioner "remote-exec" {
  #   inline = [
  #     "ip a"
  #   ]
  # }

  # local commands, will use to run ansible plaaybooks for config
  #provisioner "local-exec" {
    #command = ""
  #}

}

