variable "location" {
  type    = string
  default = "uksouth"
}

variable "subnet_config" {
  description = "VNET, Subnet and resourcegroup details"
  type = object({
    subnet_name                               = string
    virtual_network_name                      = string
    resource_group_name                       = string
    address_prefixes                          = list(string)
    service_endpoints                         = list(string)
    private_endpoint_network_policies_enabled = bool
  })
  default = {
    subnet_name                               = null
    virtual_network_name                      = null
    resource_group_name                       = null
    address_prefixes                          = null
    service_endpoints                         = ["Microsoft.Storage"]
    private_endpoint_network_policies_enabled = false
  }
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "resource_group_subnet_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "private_endpoint_network_policies_enabled" {
  description = "Enable or Disable network policies for the private endpoint on the subnet"
  default     = ""
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = ""
}

variable "service_endpoints" {
  type        = list(string)
  description = "The name of the virtual network"
  default     = ["Microsoft.Storage"]
}

variable "private_subnet_address_prefix" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet"
  default     = [""]
}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = null
}

variable "redis_instance_name" {
  description = "The name of the Redis instance"
  default     = ""
}

variable "redis_server_settings" {
  type = map(object({
    capacity                      = number
    sku_name                      = string
    enable_non_ssl_port           = optional(bool)
    minimum_tls_version           = optional(string)
    private_static_ip_address     = optional(string)
    public_network_access_enabled = optional(string)
    replicas_per_master           = optional(number)
    shard_count                   = optional(number)
    zones                         = optional(list(string))
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

variable "patch_schedule" {
  type = object({
    day_of_week    = string
    start_hour_utc = number
  })
  description = "The window for redis maintenance. The Patch Window lasts for 5 hours from the `start_hour_utc` "
  default     = null
}

variable "subnet_id" {
  description = "The ID of the Subnet within which the Redis Cache should be deployed. Only available when using the Premium SKU"
  default     = null
}

variable "redis_configuration" {
  type = object({
    enable_authentication           = optional(bool)
    maxmemory_reserved              = optional(number)
    maxmemory_delta                 = optional(number)
    maxmemory_policy                = optional(string)
    maxfragmentationmemory_reserved = optional(number)
    notify_keyspace_events          = optional(string)
  })
  description = "Configuration for the Redis instance"
  default     = {}
}

variable "storage_account_name" {
  description = "The name of the storage account name"
  default     = null
}

variable "enable_data_persistence" {
  description = "Enable or disbale Redis Database Backup. Only supported on Premium SKU's"
  default     = false
}

variable "data_persistence_backup_frequency" {
  description = "The Backup Frequency in Minutes. Only supported on Premium SKU's. Possible values are: `15`, `30`, `60`, `360`, `720` and `1440`"
  default     = 60
}

variable "data_persistence_backup_max_snapshot_count" {
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKU's"
  default     = 1
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be an organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "costcode" {
  type        = string
  description = "Name of theDWP PRJ number (obtained from the project portfolio in TechNow)"
  default     = ""
}

variable "owner" {
  type        = string
  description = "Name of the project or sqaud within the PDU which manages the resource. May be a persons name or email also"
  default     = ""
}


variable "application" {
  type        = string
  description = "Application to which the s3 bucket relates"
  default     = ""
}

variable "attribute" {
  type        = string
  description = "An attribute of the s3 bucket that makes it unique"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Environment into which resource is deployed"
  default     = ""
}

variable "type" {
  type        = string
  description = "Name of service type"
  default     = ""
}
