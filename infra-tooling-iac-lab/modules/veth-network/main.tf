terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

locals {
  gateway_ip = cidrhost(var.subnet, 1)
}

resource "null_resource" "veth_setup" {
  provisioner "local-exec" {
    command = <<EOT
sudo ip link add veth-${var.env}-a type veth peer name veth-${var.env}-b || true
sudo ip addr add ${local.gateway_ip}/24 dev veth-${var.env}-a || true
sudo ip link set veth-${var.env}-a up
sudo ip link set veth-${var.env}-b up
EOT
  }
}

