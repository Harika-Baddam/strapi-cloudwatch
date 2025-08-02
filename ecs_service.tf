resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

resource "aws_ecs_service" "strapi_service" {
  name            = "strapi-service"
  cluster         = aws_ecs_cluster.strapi_cluster.id
  task_definition = aws_ecs_task_definition.strapi_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [var.subnet_id]         # Replace with your actual subnet variable or ID
    assign_public_ip = true
    security_groups  = [var.security_group_id] # Replace with your actual SG variable or ID
  }

  depends_on = [
    aws_ecs_task_definition.strapi_task
  ]
}
