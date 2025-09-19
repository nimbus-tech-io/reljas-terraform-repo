terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.0.0"
    }
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.0"
    }
  }
}

provider "github" {
  owner = data.aws_ssm_parameter.github_owner.value
  token = data.aws_ssm_parameter.github_pat.value
}

provider "aws"{
    region = "eu-central-1"
}

data "aws_ssm_parameter" "github_pat" {
  name            = "/reljas-terraform-repo/github_pat"
  with_decryption = true
}

data "aws_ssm_parameter" "github_owner" {
  name = "/reljas-terraform-repo/github_owner"
}
