variable "replication_group_id" {
  type        = string
  description = "Parent replication group id."
}

variable "availability_zone" {
  type        = string
  description = "Cluster availability_zones."
}

variable "cluster_id" {
  type        = string
  description = "Cluster id. If not provided name is generated using cluster_id_suffix"
  default     = ""
}

variable "apply_immediately" {
  type        = bool
  description = "Apply change immediately."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}
