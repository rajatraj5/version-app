variable "sa_rg" {
  description = "Name of Storage Account Resource Group"
  type        = string
  default     = "sa_rg"
}

variable "sa_region" {
  description = "Location of the SA resource group"
  type        = string
  default     = "eastus"
}

variable "sa_name" {
  description = "Name of Storage Account"
  type        = string
  default     = "kiranstoragebharathi"
}