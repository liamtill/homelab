moved {
  from = proxmox_vm_qemu.docker
  to   = module.docker.proxmox_vm_qemu.proxmox-vm[0]
}

moved {
  from = proxmox_vm_qemu.media
  to = module.media.proxmox_vm_qemu.proxmox-vm[0]
}