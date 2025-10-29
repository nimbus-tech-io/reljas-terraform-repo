resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.description
  visibility  = var.visibility
  has_issues  = true
  has_wiki    = false
  auto_init   = true
}

resource "github_repository_file" "readme"{
    repository = github_repository.repo.name
    file = "README.md"
    branch = github_repository.repo.default_branch
    content = <<EOF
# ${var.repository_name}

Hello World
EOF
    commit_message = "chore: add README via Terraform"
    overwrite_on_create= true
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
  role     = "maintainer"
}

resource "github_team_membership" "igor_in_team"{
    team_id = github_team.dev_team.id
    username = "igor-amidzic-nimbus-tech"
    role = "member"
}