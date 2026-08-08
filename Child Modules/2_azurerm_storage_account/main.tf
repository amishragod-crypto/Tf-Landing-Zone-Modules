resource "random_string" "suffix" {
  for_each = var.ensure_unique ? var.storage_accounts : {}
  length   = var.suffix_length
  upper    = false
  special  = false
  number   = false
  lower    = true
}

resource "azurerm_storage_account" "Saccounts" {
  for_each = var.storage_accounts

  # Ensure name remains within 24 character limit and append a short random suffix when enabled.
  name                     = substr("${each.value.name}${try(random_string.suffix[each.key].result, "")}", 0, 24)
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}