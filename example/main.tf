module "tag_set" {
  source         = "git::https://github.com/hmcts/cpp-module-terraform-azurerm-tag-generator.git?ref=main"
  namespace      = var.namespace
  application    = var.application
  costcode       = var.costcode
  owner          = var.owner
  version_number = var.version_number
  attribute      = var.attribute
  environment    = var.environment
  type           = var.type
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = module.tag_set.tags
}

module "redis" {
  source                = "../"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  redis_server_settings = var.redis_server_settings

  redis_configuration = {
    enable_authentication           = lookup(var.redis_configuration, "enable_authentication", true)
    maxmemory_reserved              = lookup(var.redis_configuration, "maxmemory_reserved")
    maxmemory_delta                 = lookup(var.redis_configuration, "maxmemory_delta")
    maxmemory_policy                = lookup(var.redis_configuration, "maxmemory_policy")
    maxfragmentationmemory_reserved = 200
    notify_keyspace_events          = null
  }

}
