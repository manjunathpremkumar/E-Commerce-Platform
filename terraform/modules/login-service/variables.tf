variable "environment" { type = string }
variable "service_name" { type = string }
variable "replica_count" { type = number }
variable "cpu_request" { type = string }
variable "memory_request" { type = string }
variable "vpc_id" { type = string }
variable "private_subnets" { type = list(string) }

variable "ecs_cluster_arn" {
  type    = string
  default = "arn:aws:ecs:us-east-1:123456789012:cluster/ecommerce-prod"
}

variable "execution_role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
}

variable "task_role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/ecsTaskRole"
}

variable "ecr_repository" {
  type    = string
  default = "123456789012.dkr.ecr.us-east-1.amazonaws.com/login-service"
}

variable "image_tag" {
  type    = string
  default = "1.4.2"
}

variable "java_opts" {
  type    = string
  default = "-Xms512m -Xmx1536m -XX:+UseG1GC"
}
