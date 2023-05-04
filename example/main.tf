module "redis" {
  source                = "../"
  resource_group_name   = var.resource_group_name
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
