provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "ec2-iac-state"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ec2-iac-statelock"
    encrypt        = true
  }
}