module "postgres" {
  source = "./modules/proxmox-ct"

  ct_name = "postgres"
  ct_description = "PostgreSQL Server"
  ct_count = 1

  num_cores = 2
  memory = 2048

  disk_size = "64G"

  proxmox_api_url = var.proxmox_api_url
  proxmox_api_token_id = var.proxmox_api_token_id
  proxmox_user = var.proxmox_user
  proxmox_user_password = var.proxmox_user_password
  proxmox_api_token_secret = var.proxmox_api_token_secret

  ssh_public_key = var.ssh_public_key
  container_password = var.container_password
  
}