locals {
  default_tags = {
    "Name" = var.cluster_id
  }
}

resource "aws_elasticache_cluster" "default" {
  cluster_id           = local.default_tags["Name"]
  replication_group_id = var.replication_group_id
  availability_zone    = var.availability_zone
  apply_immediately    = var.apply_immediately
  tags                 = merge(local.default_tags, var.tags)
}
