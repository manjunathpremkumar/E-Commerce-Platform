resource "aws_lb_target_group" "service" {
  name     = "${var.service_name}-${var.environment}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/actuator/health"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
  }
}

resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = var.ecs_cluster_arn
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = var.replica_count

  load_balancer {
    target_group_arn = aws_lb_target_group.service.arn
    container_name   = var.service_name
    container_port   = 8080
  }
}

resource "aws_ecs_task_definition" "service" {
  family                   = var.service_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu_request
  memory                   = var.memory_request
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name  = var.service_name
      image = "${var.ecr_repository}:${var.image_tag}"
      portMappings = [{ containerPort = 8080, protocol = "tcp" }]
      environment = [
        { name = "JAVA_OPTS", value = var.java_opts }
      ]
    }
  ])
}

output "target_group_arn" {
  value = aws_lb_target_group.service.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.service.name
}
