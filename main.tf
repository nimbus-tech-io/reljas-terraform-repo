terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.0"
    }
  }
}

provider "github" {
  owner = var.github_owner
}

provider "aws"{
    region = "eu-central-1"
}