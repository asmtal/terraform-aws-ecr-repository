data "aws_iam_policy_document" "this" {
  dynamic "statement" {
    for_each = var.organization_id != "" ? [1] : []
    content {
      effect = "Allow"
      principals {
        type        = "AWS"
        identifiers = ["*"]
      }
      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability"
      ]
      condition {
        test     = "StringEquals"
        variable = "aws:PrincipalOrgID"
        values = [
          var.organization_id
        ]
      }
    }
  }
}
