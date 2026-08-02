resource_groups = {
  rg1 = {
    name     = "rg-dev-portfolio"
    location = "Japan East"
  }
}

storage_accounts = {
  sa1 = {
    name                     = "sadev44987654"
    resource_group_name      = "rg-dev-portfolio"
    location                 = "Japan East"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-1"
    resource_group_name = "rg-dev-portfolio"
    location            = "Japan East"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "Frontend-subnet"
    resource_group_name  = "rg-dev-portfolio"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-dev-portfolio"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

public_ips = {
  pip1 = {
    name                = "LB-pip"
    resource_group_name = "rg-dev-portfolio"
    location            = "Japan East"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "Bastion-pip"
    resource_group_name = "rg-dev-portfolio"
    location            = "Japan East"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "NAT-pip"
    resource_group_name = "rg-dev-portfolio"
    location            = "Japan East"
    allocation_method   = "Static"
  }
}

linux_virtual_machines = {
  vm1 = {
    name                    = "vm-dev-portfolio"
    nic_name                = "vm-dev-portfolio-nic"
    ip_configuration_name   = "internal"
    location                = "Japan East"
    resource_group_name     = "rg-dev-portfolio"
    size                    = "Standard_D4_v5"
    admin_username          = "azureuser"
    admin_password          = "Password1234!"
    subnet_name             = "Frontend-subnet"
    public_ip_name          = "LB-pip"
    virtual_network_name    = "vnet-1"
    storage_account_type    = "Standard_LRS"
    source_image_publisher  = "Canonical"
    source_image_offer      = "0001-com-ubuntu-server-jammy"
    source_image_sku        = "22_04-lts"
    source_image_version    = "latest"
    }
}
 