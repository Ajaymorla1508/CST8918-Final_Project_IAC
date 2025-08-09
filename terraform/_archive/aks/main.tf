provider "azurerm" {
  features {}
  subscription_id = "a9fc334c-4082-43d8-95c1-4bb0f83c8a71"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-weather"
  location            = "Canada Central"
  resource_group_name = "cst8918-final-project-group-03"
  dns_prefix          = "aksweather"

  kubernetes_version = "1.31.10"  # ✅ BASIC VERSION

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}
