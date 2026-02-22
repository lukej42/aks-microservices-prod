variable "keyvaultname" {
    type = string
}
variable "location" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "tenant_id" {
    type = string
}
variable "spobject_id" {
    type = string
}
variable "subscription_id" {
    type = string
}
variable "acr_name" {
    type = string
}
variable "acr_sku" {
    type = string
}
variable "node_count" {
  type    = number
  default = 1
}

variable "node_vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}