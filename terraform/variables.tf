variable "location" {
  type    = string
  default = "canadacentral"
}

variable "resource_group_name" {
  type    = string
  default = "weather-api-rg"
}

variable "storage_account_name" {
  type    = string
  default = "weatherapistorage"
}

variable "app_service_plan_name" {
  type    = string
  default = "weather-api-plan"
}

variable "function_app_name" {
  type    = string
  default = "weather-api-func"
}
