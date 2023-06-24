module "docker" {
  source = "./modules/proxmox-vm"

  proxmox_api_url = var.proxmox_api_url
  proxmox_api_token_id = var.proxmox_api_token_id
  proxmox_user = var.proxmox_user
  proxmox_user_password = var.proxmox_user_password
  proxmox_api_token_secret = var.proxmox_api_token_secret

  vm_name = "docker"
  vm_description = "Docker VM"
  vm_count = 1

  num_cores = 2
  memory = 2048

  disk_size = "64G"
  
}

# resource "proxmox_vm_qemu" "docker" {

#     # pve node
#     target_node = "nimbus-pve"

#     # define machine name
#     name = "docker"
#     desc = "Docker VM"
    
#     # enable the qemu-guest-agent
#     agent = 1

#     # vm template to clone from
#     clone = var.vm_template
#     # full clone instead of linked clone
#     full_clone  = "true"

#     # vm settings
#     os_type = "cloud-init"
#     cores = 2
#     sockets = 1
#     cpu = "host"
#     memory = 2048
#     scsihw = "virtio-scsi-pci"
#     bootdisk = "scsi0"
#     boot = "cdn"
#     onboot = "true"

#     ipconfig0 = "ip=dhcp,ip6=dhcp"

#     # define network hw
#     network {
#       bridge = "vmbr0"
#       model = "virtio"
#     }

#     # define storage
#     disk {
#         storage = "local-lvm"
#         type = "scsi"
#         size = "64G"
#         # enable ssd emulation
#         ssd = 1
#     }


#     lifecycle {
#     ignore_changes  = [
#       network,
#     ]
#   }

#   provisioner "local-exec" {
#     command = "echo ${self.default_ipv4_address}"
#   }

# }

