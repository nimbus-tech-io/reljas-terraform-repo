variable "repository_name" {
  description = "Name of the GitHub repository to create"
  type        = string
  default     = "reljas-terraform-repo"
}

variable "description" {
  type    = string
  default = "Repo created by Terraform"
}

variable "visibility" {
  description = "public or private"
  type        = string
  default     = "public"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

# variable "github_owner" {
#  description = "GitHub username or organization that will own the repo"
#  type        = string
#}

# variable "github_pat" {
#   description = "GitHub Personal Access Token"
#   type        = string
#   sensitive   = true
# }