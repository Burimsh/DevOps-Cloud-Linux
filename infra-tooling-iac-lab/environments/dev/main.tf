module "veth_network" {
  source = "../../modules/veth-network"

  env    = var.env
  subnet = var.subnet
}
