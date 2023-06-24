# Proxmox variables
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

variable "proxmox_user" {
    type = string
    sensitive = true
}

variable "proxmox_user_password" {
    type = string
    sensitive = true
}

variable "ssh_public_key" {
    type = string
    sensitive = true
}

variable "container_password" {
    type = string
    sensitive = true
}

# Cloudflare variables
variable "cloudflare_zone" {
  description = "Domain used to expose the GCP VM instance to the Internet"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Zone ID for your domain"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Account ID for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "Email address for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_token" {
  description = "Cloudflare API token created at https://dash.cloudflare.com/profile/api-tokens"
  type        = string
}

# Resource variables
variable "vm_template" {
    type        = string
    description = "VM template to clone"
    default     = "ubuntu-cloud-20.04"
}

variable "ct_template" {
    type        = string
    description = "Container template/tar to clone"
    default     = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
}