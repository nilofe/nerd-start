output "name" {
  value = azurerm_resource_group.rg.name
}
output "location" {
  value = azurerm_resource_group.rg.location
}
  
output "id" {
  value = azurerm_network_interface.main.id
}