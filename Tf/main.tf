terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "aks_dev" {
  source = "./modules/AKS"
  region = "australiacentral"
}

module "sa" {
  source = "./modules/StorageAccount"
}

module "acr" {
  source = "./modules/ACR"
}