# Create ECR REPOSITORY

resource "aws_ecr_repository" "repo-1" {
    count                = length(var.ecr_repo)
    name                 = element(var.ecr_repo, count.index)
    image_tag_mutability = "MUTABLE"

    encryption_configuration {
        encryption_type = "AES256"
    }

    image_scanning_configuration {
        scan_on_push = true
    }
}
