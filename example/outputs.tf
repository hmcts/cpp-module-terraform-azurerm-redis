output "redis_cache_instance_id" {
  description = "The Route ID of Redis Cache Instance"
  value       = element(concat([for n in module.redis : n.redis_cache_instance_id], [""]), 0)
}

output "redis_cache_hostname" {
  description = "The Hostname of the Redis Instance"
  value       = element(concat([for h in module.redis : h.redis_cache_hostname], [""]), 0)
}

output "redis_cache_ssl_port" {
  description = "The SSL Port of the Redis Instance"
  value       = element(concat([for p in module.redis : p.redis_cache_ssl_port], [""]), 0)
}