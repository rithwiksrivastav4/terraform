terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = " ##enter your subcription id"
}

resource "azurerm_resource_group" "base" {
  name     = "for-assigment"
  location = "eastus"
}

# Create the first Virtual Network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = azurerm_resource_group.base.name
  location            = "eastus"
  address_space       = ["10.0.0.0/16"]
  depends_on          = [azurerm_resource_group.base]
}

# Create the second Virtual Network
resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet2"
  resource_group_name = azurerm_resource_group.base.name
  location            = "eastus"
  address_space       = ["10.1.0.0/16"]
  depends_on          = [azurerm_resource_group.base]
}

# Establish VNet peering between vnet1 and vnet2
resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = azurerm_resource_group.base.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

# Establish VNet peering between vnet2 and vnet1
resource "azurerm_virtual_network_peering" "vnet2_to_vnet1" {
  name                         = "vnet2-to-vnet1"
  resource_group_name          = azurerm_resource_group.base.name
  virtual_network_name         = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}