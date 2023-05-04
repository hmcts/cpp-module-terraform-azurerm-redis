resource_group_name           = "rg-lab-cpp-faterratest"
redis_server_settings = {
  test-redis = {
    sku_name                      = "Premium"
    capacity                      = 2
    resource_group_name           = "rg-lab-cpp-faterratest"
    public_network_access_enabled = false
    minimum_tls_version           = 1.2
    enable_non_ssl_port           = true
    private_static_ip_address     = ""
    replicas_per_master           = 1
    shard_count                   = 1
  }
}

redis_configuration = {
  enable_authentication           = true
  maxmemory_reserved              = 2
  maxmemory_delta                 = 2
  maxmemory_policy                = "volatile-lru"
  maxfragmentationmemory_reserved = 200
  notify_keyspace_events          = null
}

subnet_config = {
  enable_data_lookup   = true
  subnet_name          = "sn-lab-cpp-faterratest"
  virtual_network_name = "vnet-lab-cpp-faterratest"
  resource_group_name  = "rg-lab-cpp-faterratest"
}
