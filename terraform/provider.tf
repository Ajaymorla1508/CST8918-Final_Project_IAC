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
  subscription_id = "a9fc334c-4082-43d8-95c1-4bb0f83c8a71"
}