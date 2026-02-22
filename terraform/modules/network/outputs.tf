output "node_subnet_id" {
  value = azurerm_subnet.node.id
}

output "pod_subnet_id" {
  value = azurerm_subnet.pod.id
}