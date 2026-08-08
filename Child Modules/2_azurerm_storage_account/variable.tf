variable "storage_accounts" {}

variable "ensure_unique" {
  type    = bool
  default = true
  description = "When true, append a short random suffix to storage account names to avoid name collisions."
}

variable "suffix_length" {
  type    = number
  default = 6
  description = "Length of the random suffix appended to storage account names when ensure_unique is true."
}