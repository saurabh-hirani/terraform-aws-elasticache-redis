locals {
  default_tags = {
    "Name" = var.replication_group_id
  }
}

resource "aws_elasticache_replication_group" "redis_main" {
  replication_group_id          = local.default_tags["Name"]
  replication_group_description = var.replication_group_description
  node_type                     = var.instance_type
  number_cache_clusters         = var.cluster_size
  port                          = var.port
  parameter_group_name          = var.parameter_group_name
  availability_zones            = slice(var.availability_zones, 0, var.cluster_size)
  automatic_failover_enabled    = var.automatic_failover
  subnet_group_name             = var.elasticache_subnet_group_name
  security_group_ids            = var.security_group_ids
  maintenance_window            = var.maintenance_window
  notification_topic_arn        = var.notification_topic_arn
  engine_version                = var.engine_version
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled

  lifecycle {
    ignore_changes = ["number_cache_clusters"]
  }

  tags = merge(local.default_tags, var.tags)
}
