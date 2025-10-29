data "aws_ssm_parameter" "repo_secrets" {
  for_each        = var.repo_secrets_ssm
  name            = each.value
  with_decryption = true
}

resource "github_actions_secret" "repo" {
  for_each        = data.aws_ssm_parameter.repo_secrets
  repository      = github_repository.repo.name
  secret_name     = each.key
  plaintext_value = each.value.value
}