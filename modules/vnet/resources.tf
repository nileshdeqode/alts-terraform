
resource "azurerm_virtual_network" "vnet" {
  count               = var.create ? 1 : 0
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.vnet_location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each                                       = { for snet in var.subnets : snet.subnet_name => snet }
  name                                           = each.value.subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = join(",", azurerm_virtual_network.vnet.*.name)
  address_prefixes                               = each.value.address_prefixes
  service_endpoints                              = each.value.subnet_service_endpoints
  depends_on                                     = [azurerm_virtual_network.vnet]
  enforce_private_link_endpoint_network_policies = try(each.value.enforce_private_link_endpoint_network_policies, false)

  dynamic "delegation" {
    for_each = try(each.value.service_delegation_serverFarms, false) ? [1] : []

    content {
      name = "Microsoft.Web.serverFarms"
      service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }
}
