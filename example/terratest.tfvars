
tags = {
  domain      = "cpp.nonlive"
  platform    = "nlv"
  environment = "test"
  tier        = "data"
  project     = "paas"
}
resource_group_name = "rg-lab-cpp-redisterratest"
redis_server_settings = {
  test-redis = {
    sku_name                      = "Premium"
    capacity                      = 1
    public_network_access_enabled = false
    minimum_tls_version           = 1.2
  }
}

redis_configuration = {
  enable_authentication = true
}

subnet_config = {
  enable_data_lookup   = true
  subnet_name          = "sn-lab-cpp-faterratest"
  virtual_network_name = "vnet-lab-cpp-faterratest"
  resource_group_name  = "rg-lab-cpp-faterratest"
}
