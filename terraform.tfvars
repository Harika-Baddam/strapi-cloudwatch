
ecr_repo_url    = "607700977843.dkr.ecr.us-east-2.amazonaws.com/projects-bhr"
image_tag       = "02a308c038e86bebab19a84fb38b47e4ac896b9f"
aws_region      = "us-east-2"
ecs_cluster     = "strapi-cluster-bhr"
ecs_service     = "strapi-service"
subnet_id       = "subnet-0c0bb5df2571165a9"
security_group_id = "sg-038861db81239cf2a"
log_group_name    = "/ecs/strapi-app"
cpu             = "512"
memory          = "1024"
container_port  = 1337
node_env        = "production"
