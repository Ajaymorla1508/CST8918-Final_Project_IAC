provider "azurerm" {
  features {}
  use_oidc = true
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "yourbackendstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
