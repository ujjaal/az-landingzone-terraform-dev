# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.107"
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
  use_oidc = true
  features {}
}

# You can use the azurerm_client_config data resource to dynamically
# extract connection settings from the provider configuration.

data "azurerm_client_config" "core" {}

# Call the caf-enterprise-scale module directly from the Terraform Registry
# pinning to the latest version

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "latest" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  default_location = "northeurope"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = "org-root"
  root_name      = "Org Root Mgmt Grp"
}