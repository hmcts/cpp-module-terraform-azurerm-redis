output "redis_cache_instance_id" {
  description = "The Route ID of Redis Cache Instance"
  value       = element(concat([for n in module.redis : n.id], [""]), 0)
}

output "redis_cache_hostname" {
  description = "The Hostname of the Redis Instance"
  value       = element(concat([for h in module.redis : h.hostname], [""]), 0)
}

output "configurations" {
  description = "Returns the max number of connected clients at the same time."
  value       = element(concat([for m in module.redis : m.redis_configuration.0.maxclients], [""]), 0)
}


