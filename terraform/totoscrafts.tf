module "totoscrafts" {
  source = "./modules/proxmox-vm"
  vm_count = 0

  proxmox_api_url = var.proxmox_api_url
  proxmox_api_token_id = var.proxmox_api_token_id
  proxmox_user = var.proxmox_user
  proxmox_user_password = var.proxmox_user_password
  proxmox_api_token_secret = var.proxmox_api_token_secret

  vm_name = "totoscrafts"
  vm_description = "Totos Crafts Blog"

  num_cores = 2
  memory = 2048

  disk_size = "32G"
  
}

# generate random 35 character secret for tunnel
resource "random_id" "tunnel_secret" {
  byte_length = 35
}

# create tunnel
# resource "cloudflare_tunnel" "blog_tunnel" {
#   account_id = var.cloudflare_account_id
#   name       = "Totos Crafts Blog"
#   secret     = random_id.tunnel_secret.b64_std
# }

# resource "cloudflare_tunnel_config" "blog_tunnel_config" {
#   account_id = var.cloudflare_account_id
#   tunnel_id = cloudflare_tunnel.blog_tunnel.id

#   config {
#     origin_request {
#       no_tls_verify = true
#     }
#     ingress_rule {
#       hostname = "*.totoscrafts.com"
#       service = "https://127.0.0.1"
#     }
#     ingress_rule {
#       service = "http_status:404"
#     }

#   }
# }

# # Creates the CNAME record that routes *.${var.cloudflare_zone} to the tunnel.
# resource "cloudflare_record" "blog" {
#   zone_id = var.cloudflare_zone_id
#   name    = "*"
#   value   = "${cloudflare_tunnel.blog_tunnel.id}.cfargotunnel.com"
#   type    = "CNAME"
#   proxied = true
# }