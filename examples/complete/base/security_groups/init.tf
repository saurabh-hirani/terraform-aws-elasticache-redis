terraform {
  backend "s3" {
    bucket = "aws-elasticache-state-bucket"
  }
}

provider "aws" {
}
