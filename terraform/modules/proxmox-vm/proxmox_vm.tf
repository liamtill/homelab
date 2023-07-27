resource "proxmox_vm_qemu" "proxmox-vm" {

    # pve node
    target_node = var.target_node
    count = var.vm_count

    # define machine name
    name = var.vm_name
    desc = var.vm_description
    
    # enable the qemu-guest-agent
    agent = 1

    # vm template to clone from
    clone = var.vm_template
    # full clone instead of linked clone
    full_clone  = var.clone_type

    # start after creation
    oncreate = var.start_on_create
    # start on boot
    onboot = var.start_on_boot

    # vm settings
    os_type = var.os_type
    cores = var.num_cores
    sockets = 1
    cpu = "host"
    memory = var.memory
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    boot = "cdn"

    ipconfig0 = "ip=dhcp,ip6=dhcp"

    # define network hw
    network {
      bridge = "vmbr0"
      model = "virtio"
    }

    # define storage
    disk {
        storage = var.disk_storage
        type = "scsi"
        size = var.disk_size
        # enable ssd emulation
        ssd = 1
    }

    lifecycle {
    ignore_changes  = [
      network,
    ]
  }

  # local commands, will use to run ansible playbooks for config
provisioner "local-exec" {
    command = "echo ${self.default_ipv4_address}"
  }

}

