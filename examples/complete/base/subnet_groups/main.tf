resource "aws_elasticache_subnet_group" "default" {
  name       = "test-elasticache-redis"
  subnet_ids = split(",", var.subnet_ids)
}
