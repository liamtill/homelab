terraform {

    cloud {
        organization = "liamtill"

        workspaces {
            name = "homelab"
        }
    }

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "2.9.11"
            }  

        cloudflare = {
            source = "cloudflare/cloudflare"
        }
        
        random = {
            source = "hashicorp/random"
        }
    }
}

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

provider "proxmox" {
    pm_api_url = var.proxmox_api_url
    # pm_api_token_id = var.proxmox_api_token_id
    # pm_api_token_secret = var.proxmox_api_token_secret

    pm_user = var.proxmox_user
    pm_password = var.proxmox_user_password 

    # (Optional) Skip TLS Verification
    pm_tls_insecure = true

    # pm_debug = true
}

provider "cloudflare" {
  api_token    = var.cloudflare_token
}

provider "random" {
}