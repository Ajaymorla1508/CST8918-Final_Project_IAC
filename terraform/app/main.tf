resource "azurerm_container_registry" "acr" {
  name                = "remixweatheracr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_redis_cache" "test" {
  name                = "redis-test-cache"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}

resource "azurerm_redis_cache" "prod" {
  name                = "redis-prod-cache"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}
