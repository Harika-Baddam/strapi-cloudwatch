<<<<<<< HEAD
ecr_repo_url    = "607700977843.dkr.ecr.us-east-2.amazonaws.com/strapi-ecr"
image_tag       = "8e478e3f5a6d54b221b3a209bea84b6de6d80d83"
aws_region      = "us-east-2"
ecs_cluster     = "strapi-cluster"
ecs_service     = "strapi-service"
=======
ecr_repo_url    = "607700977843.dkr.ecr.us-east-2.amazonaws.com/hrk-strapi-app"
image_tag       = "8e478e3f5a6d54b221b3a209bea84b6de6d80d83"
aws_region      = "us-east-2"
ecs_cluster     = "strapi-cluster-hrk"
ecs_service     = "strapi-service"
subnet_id         = "subnet-xxxxxxxx"
security_group_id = "sg-xxxxxxxx"
>>>>>>> origin/main
log_group_name  = "/ecs/strapi-app"
cpu             = "512"
memory          = "1024"
container_port  = 1337
node_env        = "production"
