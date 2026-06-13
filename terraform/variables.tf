variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "login_replica_count" {
  type    = number
  default = 2
}

variable "login_cpu_request" {
  type    = string
  default = "500m"
}

variable "login_memory_request" {
  type    = string
  default = "1Gi"
}
