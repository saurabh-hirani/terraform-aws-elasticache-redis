data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  bastion_sg_tags = {
    "Name" : "test-bastion"
  }
}

resource "aws_security_group" "bastion" {
  name        = local.bastion_sg_tags["Name"]
  description = "bastion security group"
  vpc_id      = var.vpc_id
  tags        = merge(local.bastion_sg_tags, var.tags)
}

resource "aws_security_group_rule" "bastion_redis_sg_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion.id
}

resource "aws_security_group_rule" "bastion_sg_ingress_redis_web_sg" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id = aws_security_group.bastion.id
}
