resource "github_repository" "repo" {
  name        = var.repository_name       
  description = var.description
  visibility  = var.visibility            
  has_issues  = true
  has_wiki    = false

  auto_init = true
}

resource "github_team" "dev_team" {
  name        = "dev-team"
  description = "Development team for this repo"
  privacy     = "closed"
}

resource "github_team_repository" "dev_team_access" {
  team_id    = github_team.dev_team.id
  repository = github_repository.repo.name
  permission = "admin" # ili "maintain", "push", "triage", "pull"
}

resource "github_team_membership" "me_in_team" {
  team_id  = github_team.dev_team.id
  username = "relja-brdar-nimbus-tech"
  role     = "maintainer" # ili "member"
}

resource "github_team_membership" "igor_in_team"{
    team_id = github_team.dev_team.id
    username = "igor-amidzic-nimbus-tech"
    role = "member"
}

resource "aws_s3_bucket" "terraform_state"{
    bucket = "my-terraform-state-bucket"

    lifecycle{
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# resource "aws_ssm_parameter" "github_pat" {
#   name  = "/reljas-terraform-repo/github_pat"
#   type  = "SecureString"
#   value = var.github_pat
# }
#
# resource "aws_ssm_parameter" "github_owner" {
#   name  = "/reljas-terraform-repo/github_owner"
#   type  = "String"
#   value = var.github_owner
# }
