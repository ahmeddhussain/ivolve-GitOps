output "cluster_name" {
  value = aws_eks_cluster.main.name
}
output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}
output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}
output "cluster_ca_certificate" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}
output "node_security_group_id" {
  value = aws_eks_node_group.workers.resources[0].autoscaling_groups[0].name # Or worker security group ID
}
output "github_actions_role_arn" {
  value = aws_iam_role.github_actions_role.arn
}
