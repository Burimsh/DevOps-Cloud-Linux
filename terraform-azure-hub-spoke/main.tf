module "hub" {
  source         = "./modules/hub"
  location       = var.location
  resource_group = var.resource_group
  address_space  = ["10.0.0.0/16"]
  subnet_prefixes = ["10.0.0.0/24"]
}

module "spoke" {
  source         = "./modules/spoke"
  location       = var.location
  resource_group = var.resource_group
  spoke_name     = "spoke1"
  spoke_subnet_name = "spoke-subnet"
  address_space  = ["10.1.0.0/16"]
  subnet_prefixes = ["10.1.0.0/24"]
  admin_user     = "azureuser"
  admin_password = "Password123!"
}
