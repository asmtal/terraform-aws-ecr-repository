variable "name" {
  type        = string
  description = "Name of the repository to create"
}
variable "organization_id" {
  type        = string
  description = "If specified allows readonly access for the whole organisation."
  default     = ""
}
variable "kms_key" {
  type        = string
  description = "KMS key to use"
}
variable "context" {
  type = object({
    organization = string
    environment  = string
    account      = string
    product      = string
    tags         = map(string)
  })
  description = "Default environmental context"
}
