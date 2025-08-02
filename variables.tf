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
  default     = []
}