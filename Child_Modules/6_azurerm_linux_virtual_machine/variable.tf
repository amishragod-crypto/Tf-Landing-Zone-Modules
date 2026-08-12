variable "linux_virtual_machines" {
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    size                   = string
    admin_username         = string
    admin_password         = string
    subnet_name            = string
    virtual_network_name   = string
    public_ip_name         = string
    nic_name               = string
    ip_configuration_name  = string
    storage_account_type   = string
    source_image_publisher = string
    source_image_offer     = string
    source_image_sku       = string
    source_image_version   = string
  }))
}
