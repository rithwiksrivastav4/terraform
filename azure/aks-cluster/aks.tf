resource "azurerm_resource_group" "base" {
  name     = var.resource_group_name
  location = var.region
  tags = {
    Env = terraform.workspace
  }

}

resource "azurerm_kubernetes_cluster" "base" {
  name                = var.aks_info.name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  dns_prefix          = "myworkshop"
  default_node_pool {
    name       = "default"
    node_count = var.aks_info.node_count
    vm_size    = var.aks_info.node_size
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_policy = "calico"
    network_plugin = "azure" # or "kubenet" for Calico
  }

  depends_on = [azurerm_resource_group.base]


}

resource "null_resource" "config" {
  triggers = {
    build_id = var.build_id
  }
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_resource_group.base.name} --name ${azurerm_kubernetes_cluster.base.name} --overwrite-existing"
  }
  depends_on = [azurerm_kubernetes_cluster.base]

}

#resource "null_resource" "config" {
#  triggers = {
#  build_id = var.build_id
#}
# provisioner "local-exec" {
#  command = "az aks get-credentials --resource-group myresourcegroup --name myAKSCluster --overwrite-existing"
#}
#depends_on = [azurerm_kubernetes_cluster.base]
#}
