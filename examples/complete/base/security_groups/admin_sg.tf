locals {
  admin_sg_tags = {
    "Name" : "test-admin"
  }
}

resource "aws_security_group" "admin" {
  name        = local.admin_sg_tags["Name"]
  description = "admin security group"
  vpc_id      = var.vpc_id
  tags        = merge(local.admin_sg_tags, var.tags)
}

resource "aws_security_group_rule" "admin_redis_sg_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.admin.id
}

resource "aws_security_group_rule" "admin_sg_ingress_redis_web_sg" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
  security_group_id        = aws_security_group.admin.id
}
