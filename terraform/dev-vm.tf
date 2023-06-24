module "dev-vm" {
  source = "./modules/proxmox-vm"

  vm_name = "dev-vm"
  vm_description = "Dev VM"
  vmid = 101
  vm_count = 0

  proxmox_api_url = var.proxmox_api_url
  proxmox_api_token_id = var.proxmox_api_token_id
  proxmox_user = var.proxmox_user
  proxmox_user_password = var.proxmox_user_password
  proxmox_api_token_secret = var.proxmox_api_token_secret

}