# You can use the azurerm_client_config data resource to dynamically
# extract connection settings from the provider configuration.

data "azurerm_management_group" "root" {
  name = "Org Root Mgmt Grp"
}

# Call the caf-enterprise-scale module directly from the Terraform Registry
# pinning to the latest version

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "6.2.0" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  default_location = "northeurope"

  providers = {
    azurerm              = azurerm
    # azurerm.connectivity = azurerm.connectivity
    # azurerm.management   = azurerm.management
  }
  
 
  root_parent_id = data.azurerm_management_group.root.id
  # root_id        = "org-root-landingzoe"
  # root_name      = "Org Root Landingzone"
  
}
