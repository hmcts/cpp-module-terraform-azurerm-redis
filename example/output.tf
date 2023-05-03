output "redis_cache_instance_id" {
  description = "The Route ID of Redis Cache Instance"
  value       = element(concat([for n in module.redis : n.id], [""]), 0)
}

output "redis_cache_ssl_port" {
  description = "The SSL Port of the Redis Instance"
  value       = module.redis.redis_cache_ssl_port
}

output "redis_cache_hostname" {
  description = "The Hostname of the Redis Instance"
  value       = element(concat([for h in module.redis : h.hostname], [""]), 0)
}

output "configurations" {
  description = "Returns the max number of connected clients at the same time."
  value       = element(concat([for m in module.redis : m.redis_configuration.0.maxclients], [""]), 0)
}

output "redis_cache_primary_access_key" {
  description = "The Primary Access Key for the Redis Instance"
  value       = element(concat([for a in azurerm_redis_cache.main : a.primary_access_key], [""]), 0)
  sensitive   = true
}

output "redis_cache_secondary_access_key" {
  description = "The Secondary Access Key for the Redis Instance"
  value       = element(concat([for a in azurerm_redis_cache.main : a.secondary_access_key], [""]), 0)
  sensitive   = true
}

output "redis_cache_primary_connection_string" {
  description = "The primary connection string of the Redis Instance."
  value       = element(concat([for c in azurerm_redis_cache.main : c.primary_connection_string], [""]), 0)
  sensitive   = true
}

output "redis_cache_secondary_connection_string" {
  description = "The secondary connection string of the Redis Instance."
  value       = element(concat([for a in azurerm_redis_cache.main : a.secondary_connection_string], [""]), 0)
  sensitive   = true
}


