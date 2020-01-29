variable "replication_group_id" {
  type        = string
  description = "Replication group id. If not provided, name is generated using replication_group_id_suffix"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "Security Group IDs"
}

variable "replication_group_description" {
  type        = string
  description = "Replication group description."
  default     = "Managed by Terraform."
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name for the ElastiCache instance"
  default     = ""
}

variable "maintenance_window" {
  type        = string
  default     = "wed:03:00-wed:04:00"
  description = "Maintenance window"
}

variable "cluster_size" {
  type        = number
  default     = 1
  description = "Count of nodes in cluster"
}

variable "port" {
  type        = number
  default     = 6379
  description = "Redis port"
}

variable "instance_type" {
  type        = string
  default     = "cache.t2.micro"
  description = "Elastic cache instance type"
}

variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
}

variable "engine_version" {
  type        = string
  default     = "5.0.4"
  description = "Redis engine version"
}

variable "parameter_group_name" {
  type        = string
  default     = "default.redis5.0"
  description = "Redis parameter group name"
}

variable "at_rest_encryption_enabled" {
  type        = bool
  default     = false
  description = "Enable encryption at rest"
}

variable "transit_encryption_enabled" {
  type        = bool
  default     = false
  description = "Enable TLS"
}

variable "notification_topic_arn" {
  type        = string
  default     = ""
  description = "Notification topic arn"
}

variable "automatic_failover" {
  type        = bool
  default     = false
  description = "Automatic failover (Not available for T1/T2 instances)"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
  default     = []
}
