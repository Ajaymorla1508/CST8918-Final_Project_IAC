terraform {
  required_version = ">= 1.9.0"

  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "stroageweatherapp"
    container_name       = "container1"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
