module "ecs" {
  source            = "../../modules/ecs"
  cluster_name      = "strapi-dev-cluster"
  task_family       = "strapi-dev-task"
  cpu               = "512"
  memory            = "1024"
  execution_role_arn = module.iam.execution_role_arn
  image             = "607700977843.dkr.ecr.us-east-2.amazonaws.com/hrk-strap-app:${var.image_tag}"
  log_group         = "/ecs/strapi-dev"
  region            = var.region
}