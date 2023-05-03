resource_group_name = "RG-DEV-CCM-01"
redis_server_settings = {
    <redis-name> = {
      sku_name = "Premium"
      capacity = 0
      public_network_access_enabled = false
      minimum_tls_version= 1.2
    }
  }

redis_configuration = {
    enable_authentication = false
    maxmemory_reserved = 2
    maxmemory_delta    = 2
    maxmemory_policy   = "volatile-lru"
  }

subnet_config = {
  enable_data_lookup   = true
  subnet_name          = "SN-NFT-AZDAT-CCM-02"
  virtual_network_name = "VN-NFT-INT-01"
  resource_group_name  = "RG-NFT-CORE-01"
}