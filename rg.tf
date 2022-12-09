## DESC: Create a resource group
## Toggle: Type object resource_groups
module "rg" {
  source      = "./modules/rg"
  for_each    = var.resource_groups
  create      = each.value.create_resource_group == null ? true : each.value.create_resource_group
  environment = var.environment
  location    = each.value.location
  rg_name     = each.value.resource_group_name
  tags        = merge(local.tags, var.tags)
}