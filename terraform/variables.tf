variable "resource_group_name" {
  description = "Target resource group"
  type        = string
  default     = "cst8918-final-project-group-03"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

variable "acr_name" {
  description = "ACR name"
  type        = string
  default     = "remixweatheracr"
}

variable "redis_test_name" {
  description = "Redis cache name (test)"
  type        = string
  default     = "redis-test-cache"
}

variable "redis_prod_name" {
  description = "Redis cache name (prod)"
  type        = string
  default     = "redis-prod-cache"
}

variable "aks_name_test" {
  description = "AKS cluster name (test)"
  type        = string
  default     = "aks-weather-test"
}
variable "aks_name_prod" {
  description = "AKS cluster name (prod)"
  type        = string
  default     = "aks-weather-prod"
}

variable "kubernetes_version" {
  description = "AKS version"
  type        = string
  default     = "1.31.10"
}
