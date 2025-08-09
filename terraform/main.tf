# ACR
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Redis (test)
resource "azurerm_redis_cache" "test" {
  name                = var.redis_test_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}

# Redis (prod)
resource "azurerm_redis_cache" "prod" {
  name                = var.redis_prod_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}

# AKS (test)
resource "azurerm_kubernetes_cluster" "aks_test" {
  name                = var.aks_name_test
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "akstest"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity { type = "SystemAssigned" }
}

# AKS (prod autoscale 1..3)
resource "azurerm_kubernetes_cluster" "aks_prod" {
  name                = var.aks_name_prod
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aksprod"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity { type = "SystemAssigned" }
}
