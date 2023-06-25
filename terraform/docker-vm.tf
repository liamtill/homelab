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
