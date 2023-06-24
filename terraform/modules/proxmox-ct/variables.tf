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

# CT
variable "ct_name" {
    type = string
}

variable "ct_description" {
    type = string
}

variable "ctid" {
    type = number
    description = "CT ID number"
    default = 0 # selects next usable available
}

variable "ct_template" {
    type        = string
    description = "Container template/tar to clone"
    default     = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
}

variable "target_node" {
    type = string
    description = "Target Proxmox node"
    default = "nimbus-pve"
}

variable "ct_count" {
    type = number
    description = "Number of CTs to provision"  
    default = 1
}

variable "unprivileged" {
    type = string
    description = "Run CT as unpriviliged"
    default = "true"
}

variable "container_password" {
    type = string
    description = "Set container user password"
    sensitive = true
}

variable "ssh_public_key" {
    type = string
    description = "SSH Public Key to set on container"
    sensitive = true
}

variable "start_on_create" {
    type = string
    description = "Start container on creation"
    default = true
}

variable "start_on_boot" {
    type = string
    description = "Start container on boot"
    default = true
}

variable "num_cores" {
    type = number
    description = "Number of CPU cores to allocate"
    default = 1
}

variable "memory" {
    type = number
    description = "Amount of memory in MB to allocate"
    default = 1024
}

variable "disk_storage" {
    type = string
    description = "CT disk storage location"
    default = "local-lvm"
}

variable "disk_size" {
    type = string
    description = "CT disk size in GB"
    default = "8G"
}