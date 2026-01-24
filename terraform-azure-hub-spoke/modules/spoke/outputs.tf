output "spoke_vm_ip" {
  value = azurerm_linux_virtual_machine.spoke_vm.private_ip_address
}
output "spoke_subnet_id" {
  value = azurerm_subnet.spoke_subnet.id
}
