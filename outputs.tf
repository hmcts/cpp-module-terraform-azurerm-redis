output "redis_cache_instance_id" {
  description = "The Route ID of Redis Cache Instance"
  value       = element(concat([for n in azurerm_redis_cache.main : n.id], [""]), 0)
}

output "redis_cache_hostname" {
  description = "The Hostname of the Redis Instance"
  value       = element(concat([for h in azurerm_redis_cache.main : h.hostname], [""]), 0)
}

output "redis_configuration_maxclients" {
  description = "Returns the max number of connected clients at the same time."
  value       = element(concat([for m in azurerm_redis_cache.main : m.redis_configuration.0.maxclients], [""]), 0)
}


