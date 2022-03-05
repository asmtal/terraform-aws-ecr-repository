module "this" {
  source     = "r0ck40k/label/generic"
  version    = "0.1.0"
  context    = var.context
  attributes = ["ecr", "repository", var.name]
}
resource "aws_ecr_repository" "this" {
  name                 = module.this.id
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    kms_key         = var.kms_key
    encryption_type = "KMS"
  }
}
resource "aws_ecr_repository_policy" "this" {
  count      = var.organization_id != "" ? 1 : 0
  policy     = data.aws_iam_policy_document.this.json
  repository = aws_ecr_repository.this.name
}
