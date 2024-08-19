provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "acr_rg" {
  name     = var.acr_rg
  location = var.acr_region
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = azurerm_resource_group.acr_rg.location
  resource_group_name = azurerm_resource_group.acr_rg.name
  sku                 = var.acr_sku
}