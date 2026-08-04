module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source              = "./modules/eks"
  cluster_name        = var.cluster_name
  vpc_id              = module.network.vpc_id
  private_subnets     = module.network.private_subnets
  node_group_name     = var.node_group_name
  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  github_repo         = var.github_repo

}

module "ecr" {
  source            = "./modules/ecr"
  ecr_frontend_repo = var.ecr_frontend_repo
  ecr_auth_repo     = var.ecr_auth_repo
  ecr_roadmap_repo  = var.ecr_roadmap_repo
}

module "rds" {
  source                     = "./modules/rds"
  vpc_id                     = module.network.vpc_id
  private_subnets            = module.network.private_subnets
  eks_node_security_group_id = module.eks.node_security_group_id
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
}

module "secrets" {
  source      = "./modules/secrets"
  db_password = var.db_password
  jwt_secret  = var.jwt_secret
}

# Automates External Secrets Operator 
resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = "external-secrets"
  create_namespace = true

  depends_on = [module.eks]
}