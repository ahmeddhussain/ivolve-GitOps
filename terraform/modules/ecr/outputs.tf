output "frontend_repo_url" {
  value = aws_ecr_repository.frontend.repository_url
}
output "auth_repo_url" {
  value = aws_ecr_repository.auth.repository_url
}
output "roadmap_repo_url" {
  value = aws_ecr_repository.roadmap.repository_url
}