output "name" {
  value = azurerm_resource_group.rg.name
}
output "location" {
  value = azurerm_resource_group.rg.location
}
  
output "id" {
  value = azurerm_network_interface.main.id
}
output "MACHINE_SSH_CONNECT" {
  value = "ssh  ubuntu@${data.azurerm_public_ip.example.ip_address}"
}
  
