terraform {
  required_version = "~> 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.18.0"
      configuration_aliases = [ azurerm.connectivity, azurerm.management ]
    }
  }
  backend "azurerm" {
    resource_group_name  = var.stgacntrg
    storage_account_name = var.stgacnt
    container_name       = var.stgcontainer
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azurerm" {
  alias = "connectivity"
  features {}
  use_oidc = true
  # subscription_id = var.subscription_id_connectivity
}
provider "azurerm" {
  alias = "management"
  features {}
  use_oidc = true
  # subscription_id = var.subscription_id_management
}
