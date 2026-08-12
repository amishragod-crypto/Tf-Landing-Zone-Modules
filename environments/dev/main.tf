module "resource_group" {
  source          = "../../Child_Modules/1_azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "storage_account" {
  depends_on       = [module.resource_group]
  source           = "../../Child_Modules/2_azurerm_storage_account"
  storage_accounts = var.storage_accounts
}

module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../Child_Modules/3_azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}

module "network_security_group" {
  depends_on              = [module.resource_group]
  source                  = "../../Child_Modules/7_azurerm_network_security_group"
  network_security_groups = var.network_security_groups
}


module "subnet" {
  depends_on = [module.virtual_network, module.network_security_group]
  source     = "../../Child_Modules/4_azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
    depends_on = [module.resource_group]
  source = "../../Child_Modules/5_azurerm_public_ip"
  public_ips = var.public_ips
}

module "linux_virtual_machine" {
  depends_on       = [module.resource_group, module.subnet, module.public_ip]
  source           = "../../Child_Modules/6_azurerm_linux_virtual_machine"
  linux_virtual_machines = var.linux_virtual_machines
}
