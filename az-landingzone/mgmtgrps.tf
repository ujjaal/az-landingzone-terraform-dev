resource "azurerm_management_group" "landing_zone" {
  name                       = "org-root-landingzone"
  display_name               = "Org Root Landing Zone"
  parent_management_group_id = var.parent_group_id
}
