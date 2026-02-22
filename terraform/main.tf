terraform {
    backend "azurerm" {
    resource_group_name = "terraform-deploy"  # Replace with your resource group name
    storage_account_name = "terraformsflg"  # Replace with your storage account name
    container_name = "aks-microservices-prod"  # Replace with your desired container name
    key = "terraform.tfstate"  # Optional: Specify the filename within the container (defaults to 'terraform.tfstate')
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
  } 

#module "azurerm_key_vault" {
#  source = "./modules/keyvault"
#  keyvaultname                = var.keyvaultname
#  location                    = var.location
#  resource_group_name         = var.resource_group_name
#  tenant_id                   = var.tenant_id
#  spobject_id                 = var.spobject_id
#}

module "aks" {
  source = "./modules/aks"

  aks_name            = "demo-aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = "demoaks"

  node_count = var.node_count      
  node_vm_size = var.node_vm_size
}

module "acr" {
  source = "./modules/acr"

  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_sku             = "Standard"

  aks_principal_id = module.aks.kubelet_identity_object_id
}
