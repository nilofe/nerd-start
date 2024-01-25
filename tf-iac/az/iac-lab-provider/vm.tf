resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "dev"
    source      = "Terraform"
    owner       = "slvit"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.name}-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1s"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true
  depends_on = [ azurerm_virtual_network.main, azurerm_network_interface.main ]
  
  os_profile {
    computer_name  = "hostname"
    admin_username = var.name
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
  disable_password_authentication = true
  ssh_keys {
    path     = "/home/${var.name}/.ssh/authorized_keys"
    key_data = file(var.ssh_key)
  }
  }
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  tags = {
    environment = "staging"
  }
}

data "azurerm_public_ip" "example" {
  name                = azurerm_public_ip.example.name
  resource_group_name = var.resource_group_name
}