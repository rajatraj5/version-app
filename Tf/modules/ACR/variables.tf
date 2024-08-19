variable "acr_rg" {
  description = "Name of the ACR resource group"
  type        = string
  default     = "acr_rg"
}

variable "acr_region" {
  description = "Location of ACR resource group"
  type        = string
  default     = "eastus"
}

variable "acr_name" {
  description = "Name of the ACR"
  type        = string
  default     = "kiranACRbharathi"
}

variable "acr_sku" {
  description = "SKU tier of ACR"
  type        = string
  default     = "Basic"
}