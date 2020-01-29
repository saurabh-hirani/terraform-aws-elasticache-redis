data "terraform_remote_state" "elasticache_security_groups" {
  backend = "s3"

  config = {
    bucket = "aws-elasticache-state-bucket"
    key    = "redis/base/security_groups.tfstate"
  }
}

data "terraform_remote_state" "elasticache_subnet_groups" {
  backend = "s3"

  config = {
    bucket = "aws-elasticache-state-bucket"
    key    = "redis/base/subnet_groups.tfstate"
  }
}
