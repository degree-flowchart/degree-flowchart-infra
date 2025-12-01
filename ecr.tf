resource "aws_ecr_repository" "services" {
  for_each = toset([
    "degree-edge-service",
    "course-service",
    "student-service",
    "degree-service",
    "schedule-service",
    "config-service",
    "angular-spa"
  ])

  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.environment
    Project     = "degree-flowchart"
  }
}
