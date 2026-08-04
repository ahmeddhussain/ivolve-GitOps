output "eks_cluster_name" {
  value = module.eks.cluster_name
}
output "ecr_frontend_url" {
  value = module.ecr.frontend_repo_url
}
output "ecr_auth_url" {
  value = module.ecr.auth_repo_url
}
output "ecr_roadmap_url" {
  value = module.ecr.roadmap_repo_url
}
output "rds_endpoint" {
  value = module.rds.db_endpoint
}
output "rds_address" {
  value = module.rds.db_address
}
output "secrets_arn" {
  value = module.secrets.secret_arn
}
output "github_actions_role_arn" {
  value = module.eks.github_actions_role_arn
}