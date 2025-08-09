provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "weather" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "weather" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.weather.name
  location                 = azurerm_resource_group.weather.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "weather" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.weather.location
  resource_group_name = azurerm_resource_group.weather.name
  kind                = "FunctionApp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "weather_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.weather.location
  resource_group_name        = azurerm_resource_group.weather.name
  app_service_plan_id        = azurerm_app_service_plan.weather.id
  storage_account_name       = azurerm_storage_account.weather.name
  storage_account_access_key = azurerm_storage_account.weather.primary_access_key
  version                    = "~4"

  site_config {
    application_stack {
      node_version = "18"
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }
}
