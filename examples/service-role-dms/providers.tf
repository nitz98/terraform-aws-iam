terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.52.0"
    }
  }
  required_version = ">= 1.3.7"
}

provider "aws" {
  default_tags {
    tags = {
      organization    = "enterprise-aws"
      app-name        = "example"
      runtime-env     = "dit"
      lifecycle-stage = "active"
      cost-key        = "5150"
      github-repo     = "terraform-aws-iam"
    }
  }
}
