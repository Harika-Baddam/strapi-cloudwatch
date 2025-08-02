resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

resource "aws_ecs_service" "strapi_service" {
  name            = "strapi-service"
  cluster         = aws_ecs_cluster.strapi_cluster.id
  task_definition = aws_ecs_task_definition.strapi.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.public1.id, aws_subnet.public2.id]
    assign_public_ip = true
    security_groups = [aws_security_group.strapi_sg.id]
  }

  depends_on = [aws_ecs_task_definition.strapi]
}
