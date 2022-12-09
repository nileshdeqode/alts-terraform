## DESC: Create a resource group for the azure virtual network
## Toggle: Type object vnets
module "vnet_rg" {
  source      = "./modules/rg"
  for_each    = var.vnets
  create      = each.value.create_resource_group == true ? true : false
  environment = var.environment
  location    = each.value.location
  rg_name     = each.value.resource_group_name
  tags        = merge(local.tags, var.tags)
}

## DESC: Create a azure virtual network
## Toggle: Type object vnets
module "azure-virtual-network" {
  source        = "./modules/vnet"
  for_each      = var.vnets
  create        = each.value.create_vnet
  environment   = var.environment
  vnet_location         = each.value.location
  resource_group_name   = each.value.create_resource_group == true ? module.vnet_rg[each.key].resource_group_name : each.value.resource_group_name
  vnet_name             = each.value.vnet_name
  address_space         = each.value.address_space
  subnets               = each.value.subnets
  tags                  = merge(local.tags, var.tags)
  depends_on            = [module.vnet_rg]
}


