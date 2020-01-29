variable "tags" {
  type    = map(string)
  default = {}
}

variable "availability_zones" {
  type = list(string)
}
