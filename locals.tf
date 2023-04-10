locals {
  resources_prefix    = var.resource_group_name_prefix
  location            = var.location
  environment         = var.environment
  resource_group_name = "${local.resources_prefix}-terraformproject-${local.environment}"
}