moved {
  from = proxmox_vm_qemu.docker
  to   = module.docker.proxmox_vm_qemu.proxmox-vm[0]
}

moved {
  from = proxmox_vm_qemu.media
  to = module.media.proxmox_vm_qemu.proxmox-vm[0]
}

moved {
  from = proxmox_lxc.mysql-server
  to = module.mysql-server.proxmox_lxc.proxmox-ct[0]
}

moved {
  from = proxmox_lxc.postgres-server
  to = module.postgres.proxmox_lxc.proxmox-ct[0]
}