terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "2.9.11"
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

variable "container_password" {
    type = string
    sensitive = true
}

variable "ssh_public_key" {
    type = string
    sensitive = true
}
