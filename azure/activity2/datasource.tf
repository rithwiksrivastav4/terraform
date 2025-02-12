data "azurerm_public_ip" "ip" {
  name                = azurerm_public_ip.base.name
  resource_group_name = azurerm_resource_group.base.name
}