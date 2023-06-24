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

# VM
variable "vm_name" {
    type = string
}

variable "vm_description" {
    type = string
}

variable "vmid" {
    type = number
    description = "VM ID number"
    default = 0 # selects next usable available
}

variable "vm_template" {
    type        = string
    description = "VM template to clone"
    default     = "ubuntu-cloud-20.04"
}

variable "target_node" {
    type = string
    description = "Target Proxmox node"
    default = "nimbus-pve"
}

variable "vm_count" {
    type = number
    description = "Number of VMs to provision"  
    default = 1
}

variable "os_type" {
    type = string
    description = "OS type"
    default = "cloud-init"
}

variable "clone_type" {
    type = string
    description = "True to do a full clone and not linked"
    default = "true"
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
    description = "VM disk storage location"
    default = "local-lvm"
}

variable "disk_size" {
    type = string
    description = "VM disk size in GB"
    default = "8G"
}