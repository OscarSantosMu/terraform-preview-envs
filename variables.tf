variable "location" {
  description = ""
  default     = "eastus"
  type        = string
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that is combined in locals"
}

variable "environment" {
  type    = string
  default = "staging"
}
