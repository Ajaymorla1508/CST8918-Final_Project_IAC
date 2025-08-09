provider "azurerm" {
  features {}
  subscription_id = "a9fc334c-4082-43d8-95c1-4bb0f83c8a71"
}

resource "azurerm_resource_group" "rg" {
  name     = "cst8918-final-project-group-03"
  location = "Canada Central"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "main-vnet"
  address_space       = ["10.0.0.0/14"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "prod" {
  name                 = "prod-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "test" {
  name                 = "test-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "dev" {
  name                 = "dev-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "admin" {
  name                 = "admin-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.3.0.0/16"]
}
