module "monitoring-vm" {
  source = "./modules/proxmox-vm"

  vm_name = "monitoring"
  vm_description = "Monitoring Stack"
  vm_count = 1

  num_cores = 4
  memory = 2096

  disk_size = "64G"

  proxmox_api_url = var.proxmox_api_url
  proxmox_api_token_id = var.proxmox_api_token_id
  proxmox_user = var.proxmox_user
  proxmox_user_password = var.proxmox_user_password
  proxmox_api_token_secret = var.proxmox_api_token_secret

}