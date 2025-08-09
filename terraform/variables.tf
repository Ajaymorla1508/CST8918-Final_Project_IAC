variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "weather-rg"
}

variable "location" {
  description = "Azure location for all resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "weatherstorageacct"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "weather-asp"
}

variable "function_app_name" {
  description = "Name of the Function App"
  type        = string
  default     = "weather-func-app"
}
