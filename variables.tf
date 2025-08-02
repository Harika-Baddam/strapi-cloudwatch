variable "strapi_image" {
  description = "Strapi Docker image with tag from ECR"
  type        = string
}


variable "subnet_id" {
  description = "The public subnet ID for the ECS service"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to attach to the ECS service"
  type        = string
}