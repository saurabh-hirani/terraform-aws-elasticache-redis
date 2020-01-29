output "replication_group_id" {
  value       = module.replication_group.id
  description = "Replication group id"
}

// primary_endpoint_address is not available for cluster_mode_enabled.
// AutoBAD doll to uses primary_endpoint_address to connect irrespective of the
// type of the cluster - hence setting, primary_endpoint_address as configuration_endpoint_address
// for compatibility
output "primary_endpoint_address" {
  value       = module.replication_group.configuration_endpoint_address
  description = "Primary endpoint address"
}

output "configuration_endpoint_address" {
  value       = module.replication_group.configuration_endpoint_address
  description = "Configuration endpoint address"
}

output "member_clusters" {
  value       = module.replication_group.member_clusters
  description = "The identifiers of all the nodes that are part of this replication group."
}
