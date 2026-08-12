resource "azurerm_resource_group" "resource_groups" {
  for_each   = var.resource_groups
  name       = each.value.name
  location   = each.value.location
}

resource "azurerm_management_lock" "resource_group_lock" {
  for_each = var.resource_groups

  name       = "${each.value.name}-lock"
  scope      = azurerm_resource_group.resource_groups[each.key].id
  lock_level = "CanNotDelete"
}