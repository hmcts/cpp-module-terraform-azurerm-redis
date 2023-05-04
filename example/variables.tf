
variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "redis_server_settings" {
  type = map(object({
    capacity                      = number
    sku_name                      = string
    enable_non_ssl_port           = bool
    minimum_tls_version           = string
    private_static_ip_address     = string
    public_network_access_enabled = string
    replicas_per_master           = number
    shard_count                   = number
    #zones                         = list(string)
  }))
  description = "optional redis server setttings for both Premium and Standard/Basic SKU"
  default     = {}
}

variable "redis_family" {
  type        = map(any)
  description = "The SKU family/pricing group to use. Valid values are `C` (for `Basic/Standard` SKU family) and `P` (for `Premium`)"
  default = {
    Basic    = "C"
    Standard = "C"
    Premium  = "P"
  }
}

variable "redis_configuration" {
  type = object({
    enable_authentication           = bool
    maxmemory_reserved              = number
    maxmemory_delta                 = number
    maxmemory_policy                = string
    maxfragmentationmemory_reserved = number
    notify_keyspace_events          = string
  })
  description = "Configuration for the Redis instance"
  default = {
    enable_authentication           = false
    maxmemory_reserved              = 200
    maxmemory_delta                 = 200
    maxmemory_policy                = "volatile-lru"
    maxfragmentationmemory_reserved = 200
    notify_keyspace_events          = null
  }
}
