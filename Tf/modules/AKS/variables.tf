variable "rgname" {
  description = "Resource Group name"
  type        = string
  default     = "my_aks_cluster"
}

variable "region" {
  description = "Location of The Resource Group"
  type        = string
  default     = "eastus"
}

variable "aks_name" {
  description = "Name of the AKS Clustor"
  type        = string
  default     = "MyAKSCluster"
}

variable "default_node_count" {
  description = "Default No. of Nodes in Default Node Pool"
  type        = number
  default     = 1
}

variable "default_node_pool_size" {
  description = "Default VM size of default Node Pool"
  type        = string
  default     = "Standard_DS2_V2"
}

variable "env_name" {
  description = "Environment Name"
  type        = string
  default     = "Dev"
}

variable "node_pool_name" {
  description = "Name of the Internal Node Pool"
  type        = string
  default     = "internal"
}

variable "internal_node_count" {
  description = "No. of Internal Node Count"
  type        = number
  default     = 1
}

variable "internal_node_size" {
  description = "VM size of Internal Node Pool"
  type        = string
  default     = "Standard_E2pds_v5"
}