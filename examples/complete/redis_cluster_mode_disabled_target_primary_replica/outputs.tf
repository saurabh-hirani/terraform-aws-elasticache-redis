output "replication_group_id" {
  value       = module.replication_group.id
  description = "Replication group id"
}

output "primary_endpoint_address" {
  value       = module.replication_group.primary_endpoint_address
  description = "Primary endpoint address"
}

output "member_clusters" {
  value       = module.replication_group.member_clusters
  description = "The identifiers of all the nodes that are part of this replication group."
}

output "replica_1_cache_nodes" {
  value       = module.replica_1.cache_nodes
  description = "Replica 1 cache nodes"
}

output "replica_2_cache_nodes" {
  value       = module.replica_2.cache_nodes
  description = "Replica 2 cache nodes"
}

output "replica_3_cache_nodes" {
  value       = module.replica_3.cache_nodes
  description = "Replica 3 cache nodes"
}
