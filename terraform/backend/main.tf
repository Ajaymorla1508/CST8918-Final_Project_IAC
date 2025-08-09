provider "azurerm" {
  features {}
  subscription_id = "a9fc334c-4082-43d8-95c1-4bb0f83c8a71"
}

resource "azurerm_resource_group" "rg" {
  name     = "tfstate-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "sa" {
  name                     = "stroageweatherapp"  # change if name is taken
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "container1"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
