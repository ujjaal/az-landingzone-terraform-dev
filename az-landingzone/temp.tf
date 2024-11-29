terraform {
  required_version = "~> 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.18.0"
      configuration_aliases = [ azurerm.connectivity, azurerm.management ]
    }
  }
}