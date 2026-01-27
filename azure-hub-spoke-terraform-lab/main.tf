provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "hub" {
  source              = "./modules/hub"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "spoke" {
  source              = "./modules/spoke"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  hub_vnet_id         = module.hub.hub_vnet_id
}

module "frontend_vm" {
  source        = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location      = var.location
  subnet_id     = module.spoke.frontend_subnet_id
  vm_name       = "frontend-vm"
  public_ip     = true
}

module "backend_vm" {
  source        = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location      = var.location
  subnet_id     = module.spoke.backend_subnet_id
  vm_name       = "backend-vm"
  public_ip     = false
}
