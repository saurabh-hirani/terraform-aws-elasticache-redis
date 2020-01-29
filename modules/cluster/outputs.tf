output "cache_nodes" {
  value       = aws_elasticache_cluster.default.cache_nodes
  description = "List of node objects."
}
