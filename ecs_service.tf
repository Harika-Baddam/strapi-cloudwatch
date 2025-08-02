resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

resource "aws_ecs_service" "strapi_service" {
  name            = var.ecs_service
  cluster         = var.ecs_cluster
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    awsvpc_configuration {
      subnets         = var.private_subnets
      security_groups = [var.ecs_security_group]
      assign_public_ip = true
    }
  }

  depends_on = [aws_ecs_task_definition.strapi]
}
