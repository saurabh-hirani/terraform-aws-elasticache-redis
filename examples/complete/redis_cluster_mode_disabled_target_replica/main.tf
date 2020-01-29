module "replication_group" {
  source                        = "../../../modules/cluster_mode_disabled_replication_group"
  replication_group_id          = "redis-dtr" //dtr = cluster mode disabled + target replica - short form due to name length constraints
  automatic_failover            = false
  cluster_size                  = 1
  elasticache_subnet_group_name = data.terraform_remote_state.elasticache_subnet_groups.outputs.name
  availability_zones            = var.availability_zones
  security_group_ids            = [data.terraform_remote_state.elasticache_security_groups.outputs.elasticache_security_group_id]
  tags                          = var.tags
}

module "replica_1" {
  source               = "../../../modules/cluster"
  cluster_id           = "redis-dtr-2"
  replication_group_id = module.replication_group.id
  availability_zone    = var.availability_zones[1]
  apply_immediately    = true
  tags                 = var.tags
}

module "replica_2" {
  source               = "../../../modules/cluster"
  cluster_id           = "redis-dtr-3"
  replication_group_id = module.replication_group.id
  availability_zone    = var.availability_zones[2]
  apply_immediately    = true
  tags                 = var.tags
}
