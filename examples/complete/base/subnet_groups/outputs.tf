output "name" {
  value = aws_elasticache_subnet_group.default.name
}

output "subnet_ids" {
  value = var.subnet_ids
}
