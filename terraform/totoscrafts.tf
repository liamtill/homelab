resource "proxmox_vm_qemu" "totoscrafts" {

    # pve node
    target_node = "nimbus-pve"
    count = 1

    # define machine name
    name = "totoscrafts"
    desc = "Totos Crafts Blog"
    
    # enable the qemu-guest-agent
    agent = 1

    # vm template to clone from
    clone = "ubuntu-cloud-20.04"
    # full clone instead of linked clone
    full_clone  = "true"

    # vm settings
    os_type = "cloud-init"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    boot = "cdn"
    onboot = "true"

    ipconfig0 = "ip=dhcp,ip6=dhcp"

    # define network hw
    network {
      bridge = "vmbr0"
      model = "virtio"
    }

    # define storage
    disk {
        storage = "local-lvm"
        type = "scsi"
        size = "32G"
        # enable ssd emulation
        ssd = 1
    }

    lifecycle {
    ignore_changes  = [
      network,
    ]
  }
}


# generate random 35 character secret for tunnel
resource "random_id" "tunnel_secret" {
  byte_length = 35
}

# create tunnel
resource "cloudflare_tunnel" "blog_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "Totos Crafts Blog"
  secret     = random_id.tunnel_secret.b64_std
}

resource "cloudflare_tunnel_config" "blog_tunnel_config" {
  account_id = var.cloudflare_account_id
  tunnel_id = cloudflare_tunnel.blog_tunnel.id

  config {
    origin_request {
      no_tls_verify = true
    }
    ingress_rule {
      hostname = "*.totoscrafts.com"
      service = "https://127.0.0.1"
    }
    ingress_rule {
      service = "http_status:404"
    }

  }
}

# Creates the CNAME record that routes *.${var.cloudflare_zone} to the tunnel.
resource "cloudflare_record" "blog" {
  zone_id = var.cloudflare_zone_id
  name    = "*"
  value   = "${cloudflare_tunnel.blog_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}