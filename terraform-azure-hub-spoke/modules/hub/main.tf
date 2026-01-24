resource "azurerm_virtual_network" "hub_vnet" {
  name                = "hub-vnet"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_space
}

resource "azurerm_subnet" "hub_subnet" {
  name                 = "hub-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = var.subnet_prefixes
}

resource "azurerm_network_security_group" "hub_nsg" {
  name                = "hub-nsg"
  location            = var.location
  resource_group_name = var.resource_group
}
