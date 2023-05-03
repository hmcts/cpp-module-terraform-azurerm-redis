module "redis" {
    for_each                      = var.redis_server_settings
    source   = "../"
    resource_group_name           = var.resource_group_name
    location                      = var.location
    #name                          = format("%s", each.key)
    #capacity                      = each.value["capacity"]
    #family                        = lookup(var.redis_family, each.value.sku_name)
    #sku_name                      = each.value["sku_name"]
    #public_network_access_enabled = each.value["public_network_access_enabled"]
    #minimum_tls_version           = optional(string)
    subnet_id                     = var.subnet_config.enable_data_lookup ? data.azurerm_subnet.delegated_subnet_id.0.id : null 
    
    redis_configuration = {
      enable_authentication           = lookup(var.redis_configuration, "enable_authentication", true)
      maxmemory_reserved              = each.value["sku_name"] == "Premium" || each.value["sku_name"] == "Standard" ? lookup(var.redis_configuration, "maxmemory_reserved") : null
      maxmemory_delta                 = each.value["sku_name"] == "Premium" || each.value["sku_name"] == "Standard" ? lookup(var.redis_configuration, "maxmemory_delta") : null
      maxmemory_policy                = lookup(var.redis_configuration, "maxmemory_policy")
  }

}
