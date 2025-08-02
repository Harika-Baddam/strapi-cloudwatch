# General AWS & Deployment Variables

variable "region" {
  type        = string
  description = "AWS region for resource deployment"
  default     = "us-east-2"
}

variable "strapi_image" {
  description = "Strapi Docker image URI with tag"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR repository URL"
  type        = string
}

variable "image_tag" {
  description = "Tag for the Docker image"
  type        = string
}

variable "ecs_cluster" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_service" {
  description = "Name of the ECS service"
  type        = string
}

variable "task_family" {
  description = "ECS task definition family"
  type        = string
  default     = "strapi-task"
}

variable "execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type        = string
}

variable "ecs_security_group" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

# Optional RDS-related variables
variable "database_client" {
  type        = string
  default     = "postgres"
  description = "Database client type"
}

variable "database_name" {
  type        = string
  description = "Database name"
}

variable "database_username" {
  type        = string
  description = "Database user"
}

variable "database_password" {
  type        = string
  description = "Database password"
}

variable "database_port" {
  type        = number
  default     = 5432
  description = "Database port"
}
