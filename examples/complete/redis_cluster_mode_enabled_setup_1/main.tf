module "replication_group" {
  source                        = "../../../modules/cluster_mode_enabled_replication_group"
  replication_group_id          = "redis-e1" //e1 = cluster mode enabled - short form due to name length constraints
  num_node_groups               = 2
  cluster_size                  = 3
  elasticache_subnet_group_name = data.terraform_remote_state.elasticache_subnet_groups.outputs.name
  security_group_ids            = [data.terraform_remote_state.elasticache_security_groups.outputs.elasticache_security_group_id]
  tags                          = var.tags
}
