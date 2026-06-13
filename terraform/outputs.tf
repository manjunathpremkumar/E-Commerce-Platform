output "login_service_target_group_arn" {
  value = module.login_service.target_group_arn
}

output "login_service_ecs_service_name" {
  value = module.login_service.ecs_service_name
}
