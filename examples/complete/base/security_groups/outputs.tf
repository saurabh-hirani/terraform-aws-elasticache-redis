output "elasticache_security_group_id" {
  value = aws_security_group.elasticache.id
}

output "elasticache_security_group_name" {
  value = aws_security_group.elasticache.name
}

output "admin_security_group_id" {
  value = aws_security_group.admin.id
}

output "admin_security_group_name" {
  value = aws_security_group.admin.name
}

output "bastion_security_group_id" {
  value = aws_security_group.bastion.id
}

output "bastion_security_group_name" {
  value = aws_security_group.bastion.name
}
