resource "azurerm_public_ip" "public_ip" {
 for_each = var.firewall
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

data "azurerm_subnet" "example" {
  for_each = var.firewall
  name                 = each.value.data_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

output "subnet_id" {
  value = data.azurerm_subnet.example.id
}

data "azurerm_public_ip" "example" {
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

output "domain_name_label" {
  value = data.azurerm_public_ip.example.domain_name_label
}

output "public_ip_address_id" {
  value = data.azurerm_public_ip.example.ip_address_id
}

resource "azurerm_firewall" "example" {
  for_each = var.firewall
  name                = each.value.firewall_name
    location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name                 = each.value.sku
  sku_tier                 = each.value.sku_tier

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = azurerm_subnet.firewall_subnet[each.value.subnet_id].id
    public_ip_address_id = azurerm_public_ip.public_ip[each.value.public_ip_address_id].id
  }
}