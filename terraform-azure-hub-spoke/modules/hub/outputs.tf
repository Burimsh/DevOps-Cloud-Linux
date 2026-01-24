output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}
output "hub_subnet_id" {
  value = azurerm_subnet.hub_subnet.id
}
