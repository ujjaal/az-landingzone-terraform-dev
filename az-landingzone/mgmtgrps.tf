data "azurerm_management_group" "root" {
  name = "Org Root Mgmt Grp"
}


resource "azurerm_management_group" "root_landing_zones" {
  name        = "Org Root Landingzone"
  display_name = "Org Root Landingzone"
  parent_management_group_id = data.azurerm_management_group.root.id
}

resource "azurerm_management_group" "network" {
  name        = "connectivity"
  display_name = "Platform Connectivity"
  parent_management_group_id = azurerm_management_group.root_landing_zones.id
}

resource "azurerm_management_group" "management" {
  name        = "management"
  display_name = "Platform Management"
  parent_management_group_id = azurerm_management_group.root_landing_zones.id
}

resource "azurerm_management_group" "identity" {
  name        = "identity"
  display_name = "Platform Identity"
  parent_management_group_id = azurerm_management_group.root_landing_zones.id
}
