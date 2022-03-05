output "arn" {
  value       = aws_ecr_repository.this.arn
  description = "ARN of the created ecr repository"

}
output "name" {
  value       = aws_ecr_repository.this.name
  description = "Name of the created ecr repository"

}
output "url" {
  value       = aws_ecr_repository.this.repository_url
  description = "URL of the created ecr repository"

}
