terraform {
  backend "s3" {
    bucket         = "relja-terraform-state"
    key            = "global/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}