module "media" {
  source = "./modules/proxmox-vm"

  proxmox_api_url = var.proxmox_api_url
  proxmox_api_token_id = var.proxmox_api_token_id
  proxmox_user = var.proxmox_user
  proxmox_user_password = var.proxmox_user_password
  proxmox_api_token_secret = var.proxmox_api_token_secret

  vm_name = "media"
  vm_description = "Media Server"

  num_cores = 4
  memory = 4096

  disk_size = "32G"

}