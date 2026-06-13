variable "environment" { type = string }
variable "service_name" { type = string }
variable "replica_count" { type = number, default = 4 } # AI: Default replicas increased to 4 per ML analysis recommendation
variable "cpu_request" { type = string, default = "500m" } # AI: CPU request adjusted for stability at higher replica count
variable "memory_request" { type = string, default = "1Gi" }
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
  default = "1.2.0"
}

variable "java_opts" {
  type    = string
  default = "-Xms3072m -Xmx3072m" # AI: Adjusted heap size for optimal performance at higher replica count
}