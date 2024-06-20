provider "aws" {
  region = var.awsRegion
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
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}