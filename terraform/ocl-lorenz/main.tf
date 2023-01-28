variable "tenancy_ocid" {
    type = string
    sensitive = true
}

variable "user_ocid" {
    type = string
    sensitive = true
}

variable "fingerprint" {
    type = string
    sensitive = true
}

variable "compartment_id" {
    type = string
    sensitive = true
}

variable "subnet_id" {
    type = string
    sensitive = true
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user_ocid
  private_key_path = "~/.oci/oci_key.pem"
  fingerprint = var.fingerprint
  region = "uk-london-1"
}

resource "oci_core_instance" "lorenz" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }
  
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = "AdBM:UK-LONDON-1-AD-1"
  compartment_id      = var.compartment_id
  
  create_vnic_details {
    assign_private_dns_record = "true"
    assign_public_ip          = "true"
    subnet_id                 = var.subnet_id
  }
  
  display_name = "lorenz"
  
  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }
  is_pv_encryption_in_transit_enabled = "true"
  
  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOVVobVcNEljoxiK4pDARl/nl87ZexpBlzeK5RhPZ+W5Q6Fs3lRvO1LaCJW/SKsmr7gGPDwb/2gwdjiEsQm9rnzjTnDdS8PiGzdCiwfjrsBIn4g3tYUeAtppE9WLY+xJxMqmgDfXmMIPQ/WSLSy3zur98klxd5nu9InGm8nxPSS0bJs5gr2xMDEmhp3kcQPQFVWPzJdyy0XkaiQJ8FhD9xmaaKUsOlOVRTUSaxaMOrMSddJfyn0joG4An7qrTOcbgBFv1pE/nUrO7le5bhmdddsXjMWqHeqyspkb6MTHnGwXaAOZMGPzYAQ6V0s+/izwJvYCLGKv+r+p1RMUZLq/23T7DdoWFVh4ELNc0EjX10sJwfxoZqNUmcQe8a2lXLf1sFvfNOaMvOtoFtuphEYpr6fMzdR1xPPnoZVqsqNTAtq+6Waa40OFEVvEwLevDhgZuMr0vRJSxHfhT6GbjL4XWcJdk848RSjdIo6d2EQi8jhlWq9iC0DGPOAU++Zi5ebnl31UdNKyIW0pOJq28uddLB+EYcjHJj4h+w9BTKJXWvhGZ7gKNUbTZ2ZvV4NoxQ/g6hFHGcj5llfDqj+tqxwwAwPedMvSmzdHbcV6yevkU+TUxKCRv8rHKVyX3mYf0pXR/tsX52lsdkaJUx2P0wGkWuCtRzaycM6QYbzvzHrIF6QQ== liam@liams-laptop"
  }
  
  shape = "VM.Standard.A1.Flex"
  
  shape_config {
    memory_in_gbs = "24"
    ocpus         = "4"
  }
  
  source_details {
    source_id   = "ocid1.image.oc1.uk-london-1.aaaaaaaacd6wvghqqeocouaahlveplsl4bkutztyz6rstu5bag6limxr5rxa"
    source_type = "image"
  }
}
