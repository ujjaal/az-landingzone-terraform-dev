resource "azurerm_management_group" "root" {
  name         = "Org Root Mgmt Grp"
  display_name = data.azurerm_management_group.root.display_name
}

resource "azurerm_management_group" "root_landing_zones" {
  name                       = "Org-Root-Landingzone"
  display_name               = "Org-Root-Landingzone"
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "network" {
  name                       = "Platform-Connectivity"
  display_name               = "Platform-Connectivity"
  parent_management_group_id = azurerm_management_group.root_landing_zones.id
}

resource "azurerm_management_group" "management" {
  name                       = "Platform-Management"
  display_name               = "Platform-Management"
  parent_management_group_id = azurerm_management_group.root_landing_zones.id
}

resource "azurerm_management_group" "identity" {
  name                       = "Platform-Identity"
  display_name               = "Platform-Identity"
  parent_management_group_id = azurerm_management_group.root_landing_zones.id
}
