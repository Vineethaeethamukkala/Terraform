terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "remote-state-practice18"
    key    = "remote-state-practice"
    region = "us-east-1"
    dynamodb_table = "remote-state-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}