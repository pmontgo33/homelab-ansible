terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

variable "proxmox_terraform_token_id" {}
variable "proxmox_terraform_token_secret" {}
variable "proxmox_default_root_passwd" {}
variable "tailscale_auth_key" {}

provider "proxmox" {
  # url is the hostname (FQDN if you have one) for the proxmox host you'd like to connect to to issue the commands. my proxmox host is 'prox-1u'. Add /api2/json at the end for the API
  pm_api_url = "https://loki:8006/api2/json"
  # api token id is in the form of: <username>@pam!<tokenId>
  pm_api_token_id = var.proxmox_terraform_token_id
  # this is the full secret wrapped in quotes. don't worry, I've already deleted this from my proxmox cluster by the time you read this post
  pm_api_token_secret = var.proxmox_terraform_token_secret
  # leave tls_insecure set to true unless you have your proxmox SSL certificate situation fully sorted out (if you do, you will know)
  pm_tls_insecure = true
}

resource "proxmox_lxc" "local-caddy" {
  target_node  = "loki"
  hostname     = "local-caddy"
  ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
 # ostype = "cloud-init"
  password     = var.proxmox_default_root_passwd
  unprivileged = true
  onboot = true
  cores = 2
  memory = 2048
  swap = 0
  vmid = 118
  start = true


  // Terraform will crash without rootfs defined
  rootfs {
    storage = "vm-storage"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw = "192.168.86.1"
    ip = "192.168.86.118/24"
  }

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+WBmDc0ACtIS4DZl2fHyFCxxAMIa6c5PuMgvuSBD5R patrick@nix-fury
  EOT

  #cicustom = templatefile("proxmox_cloud_init.tftpl", { tailscale_auth_key = var.tailscale_auth_key })
}