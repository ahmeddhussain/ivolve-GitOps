resource "aws_ecr_repository" "frontend" {
  name                 = var.ecr_frontend_repo
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "auth" {
  name                 = var.ecr_auth_repo
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "roadmap" {
  name                 = var.ecr_roadmap_repo
  image_tag_mutability = "MUTABLE"
}