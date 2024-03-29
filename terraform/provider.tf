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