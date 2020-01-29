output "id" {
  value       = join("", aws_elasticache_replication_group.redis_main.*.id)
  description = "Redis cluster ID"
}

output "port" {
  value       = var.port
  description = "Redis port"
}

output "primary_endpoint_address" {
  value = aws_elasticache_replication_group.redis_main.primary_endpoint_address
  description = "Redis primary endpoint address"
}

output "member_clusters" {
  value = aws_elasticache_replication_group.redis_main.member_clusters
  description = "The identifiers of all the nodes that are part of this replication group."
}
