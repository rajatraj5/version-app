provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "aks" {
  name     = var.rgname
  location = var.region
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  dns_prefix          = "aks1-k8s"

  default_node_pool {
    name       = "default"
    node_count = var.default_node_count
    vm_size    = var.default_node_pool_size
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = var.env_name
  }
}
/*
resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = var.internal_node_count
  vm_size               = var.internal_node_size
  tags = {
    Environment = var.env_name
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}
*/
