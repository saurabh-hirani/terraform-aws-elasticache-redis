locals {
  elasticache_sg_tags = {
    "Name" : "test-elasticache-redis"
  }
}

resource "aws_security_group" "elasticache" {
  name        = local.elasticache_sg_tags["Name"]
  description = "Elasticache redis security group"
  vpc_id      = var.vpc_id
  tags        = merge(local.elasticache_sg_tags, var.tags)
}

resource "aws_security_group_rule" "elasticache_redis_sg_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elasticache.id
}

resource "aws_security_group_rule" "elasticache_sg_ingress_redis_web_sg" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.admin.id
  security_group_id        = aws_security_group.elasticache.id
}
