provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::521531168981:role/OrganizationAccountAccessRole"
  }

  default_tags {
    tags = {
      "application"   = "iaas"
      "provisionedby" = "terraform"
      "owner"         = "devops"
      "product"       = "infrastructure"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "homer-terraform-state"
    key    = "roots/infrastructure/backstage-simple-ec2"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  required_version = "<=1.8.1"
}