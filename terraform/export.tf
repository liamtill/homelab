resource "local_file" "tf_ansible_vars_file" {
  content = <<-DOC
    # Ansible vars_file containing variable values from Terraform.
    tunnel_id: ${cloudflare_tunnel.blog_tunnel.id}
    account: ${var.cloudflare_account_id}
    tunnel_name: ${cloudflare_tunnel.blog_tunnel.name}
    secret: ${random_id.tunnel_secret.b64_std}
    zone: ${var.cloudflare_zone}
    DOC

  filename = "./totoscrafts_tunnel_vars.yml"
}
