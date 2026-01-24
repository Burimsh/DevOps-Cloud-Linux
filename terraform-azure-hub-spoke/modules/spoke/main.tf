resource "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_space
}

resource "azurerm_subnet" "spoke_subnet" {
  name                 = var.spoke_subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.subnet_prefixes
}

resource "azurerm_network_interface" "spoke_vm_nic" {
  name                = "${var.spoke_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "spoke_vm" {
  name                  = "${var.spoke_name}-vm"
  resource_group_name   = var.resource_group
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = var.admin_user
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.spoke_vm_nic.id]
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
