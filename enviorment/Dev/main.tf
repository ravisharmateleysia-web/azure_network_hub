module "rg" {
  source = "../../modules/resource_group"
  resource_group = var.resource_group
}

module "rg" {
  source = "../../modules/azure_virtual_network"
  virtual_network = var.virtual_network
}
