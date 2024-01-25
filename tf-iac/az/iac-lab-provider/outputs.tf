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
  value = "ssh  ${var.name}@${data.azurerm_public_ip.example.ip_address}"
}
  
output "public_ip_address" {
  value = data.azurerm_public_ip.example.ip_address
}