variable "resource_groups" {
    type = map(object({
        name     = string
        location = string
    }))
}

variable "storage_accounts" {
    type = map(object({
        name                     = string
        resource_group_name      = string
        location                 = string
        account_tier             = string
        account_replication_type = string
    }))
}

variable "virtual_networks" {
    type = map(object({
        name                = string
        resource_group_name = string
        location            = string
        address_space       = list(string)
    }))
}

variable "subnets" {
    type = map(object({
        name                 = string
        resource_group_name  = string
        virtual_network_name = string
        address_prefixes     = list(string)
    }))
}

variable "public_ips" {
    type = map(object({
        name                 = string
        resource_group_name  = string
        location             = string
        allocation_method    = string
    }))
}

variable "linux_virtual_machines" {
    type = map(object({
        name                 = string
        resource_group_name  = string
        location             = string
        size                 = string
        admin_username       = string
        admin_password       = string
    }))
}
