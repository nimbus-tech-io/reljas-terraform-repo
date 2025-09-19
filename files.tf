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
