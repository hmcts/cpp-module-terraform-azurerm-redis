module "redis" {
    for_each                      = var.redis_server_settings
    source   = "../"
    
    name                          = format("%s", each.key)
    resource_group_name           = var.resource_group_name
    location                      = var.location
    capacity                      = each.value["capacity"]
    family                        = lookup(var.redis_family, each.value.sku_name)
    sku_name                      = each.value["sku_name"]
    enable_non_ssl_port           = each.value["enable_non_ssl_port"]
    minimum_tls_version           = each.value["minimum_tls_version"]
    private_static_ip_address     = each.value["private_static_ip_address"]
    public_network_access_enabled = each.value["public_network_access_enabled"]
    subnet_id                     = each.value["sku_name"] == "Premium" ? var.subnet_id : null

    redis_configuration {
        #  aof_backup_enabled              = var.enable_aof_backup
        #  aof_storage_connection_string_0 = var.enable_aof_backup == true ? azurerm_storage_account.storeacc.0.primary_blob_connection_string : null
        #  aof_storage_connection_string_1 = var.enable_aof_backup == true ? azurerm_storage_account.storeacc.0.secondary_blob_connection_string : null
        enable_authentication           = lookup(var.redis_configuration, "enable_authentication", false)
        maxmemory_policy                = lookup(var.redis_configuration, "maxmemory_policy") 
        #check if rdb storage is needed and backup needed?????
        #check if private endpoint is needed
        rdb_backup_enabled              = each.value["sku_name"] == "Premium" && var.enable_data_persistence == true ? true : false
        rdb_backup_frequency            = each.value["sku_name"] == "Premium" && var.enable_data_persistence == true ? var.data_persistence_backup_frequency : null
        rdb_backup_max_snapshot_count   = each.value["sku_name"] == "Premium" && var.enable_data_persistence == true ? var.data_persistence_backup_max_snapshot_count : null
        
        rdb_storage_connection_string   = each.value["sku_name"] == "Premium" && var.enable_data_persistence == true ? azurerm_storage_account.storeacc.0.primary_blob_connection_string : null
  }

}
