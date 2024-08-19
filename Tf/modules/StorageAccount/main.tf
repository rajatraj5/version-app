provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "sa_rg" {
  name     = var.sa_rg
  location = var.sa_region
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.sa_rg.name
  location                 = azurerm_resource_group.sa_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}