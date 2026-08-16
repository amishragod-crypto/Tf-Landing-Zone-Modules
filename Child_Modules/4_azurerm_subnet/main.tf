data "azurerm_network_security_group" "nsg" {
  for_each = var.subnets 

  name                = each.value.network_security_group_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_subnet" "subnets" {
  for_each                  = var.subnets
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  address_prefixes          = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "nsg" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.name != "AzureBastionSubnet"
  }

  subnet_id = azurerm_subnet.subnets[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}