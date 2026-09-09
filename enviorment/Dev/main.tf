module "rg" {
  source = "../../modules/resource_group"
  resource_group = var.resource_group
}

module "virtual_network" {
  source = "../../modules/azure_virtual_network"
  virtual_network = var.virtual_network
}

module "bastion" {
  source = "../../modules/AzureBastionSubnet"
  bastion_subnet = var.bastion_subnet
}

module "firewall" {
  source = "../../modules/AzureFirewallSubnet"
  firewall_subnet = var.firewall_subnet
}