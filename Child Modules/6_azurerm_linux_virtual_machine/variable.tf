variable "linux_virtual_machines" {}

variable "default_vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Default VM size used when a per-VM size is not provided. Choose a small size to avoid regional core quota issues."
}
