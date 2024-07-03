terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.1.0"
    }
  }
  backend "s3" {
    bucket = "srini-terraform-statefile"
    key    = "dev/dev.tfstate"
    region = "ap-south-1"
  }
}  
# Provider Block
  provider "aws" {
  region = "ap-south-1"
}
