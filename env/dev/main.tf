provider "aws" {
  region = "us-east-2" # Change to your AWS region
}

resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "strapi_task" {
  family                   = "strapi-task"
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = "256"
  memory                  = "512"
  execution_role_arn      = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name      = "strapi"
    image     = "baddamharika/strapi-app:latest"  # Docker Hub or ECR image
    portMappings = [{
      containerPort = 1337
      protocol      = "tcp"
    }]
    essential = true
    environment = [
      {
        name  = "NODE_ENV"
        value = "production"
      }
    ]
  }])
}

resource "aws_ecs_service" "strapi_service" {
  name            = "strapi-service"
  cluster         = aws_ecs_cluster.strapi_cluster.id
  task_definition = aws_ecs_task_definition.strapi_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = ["subnet-xxxxxx"]  # Replace with your public subnet ID
    assign_public_ip = true
    security_groups  = ["sg-xxxxxx"]     # Replace with your ECS security group
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_policy]
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/main
