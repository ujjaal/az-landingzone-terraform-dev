resource "azurerm_management_group" "landing_zone" {
  name                = "org-root-landingzone"
  display_name        = "Org Root Landing Zone"
  parent_group_id     = "/providers/Microsoft.Management/managementGroups/org-root"
}