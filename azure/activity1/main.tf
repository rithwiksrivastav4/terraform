resource "azurerm_resource_group" "base" {
  name     = "terraform"
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "base" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  address_space       = [var.vnet_cidr]
  depends_on = [
    azurerm_resource_group.base
  ]

}

resource "azurerm_subnet" "web" {
  name                 = var.subnet_names[0]
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = [var.subnets_cidr[0]]
  depends_on = [
    azurerm_virtual_network.base
  ]

}

resource "azurerm_subnet" "app-1" {
  name                 = var.subnet_names[1]
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     =[ var.subnets_cidr[1]]
  depends_on = [
    azurerm_virtual_network.base
  ]


}

resource "azurerm_subnet" "app-2" {
  name                 = var.subnet_names[2]
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = [var.subnets_cidr[2]]
  depends_on = [
    azurerm_virtual_network.base
  ]


}

resource "azurerm_subnet" "db" {
  name                 = var.subnet_names[3]
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = [var.subnets_cidr[3]]
  depends_on = [
    azurerm_virtual_network.base
  ]


}
