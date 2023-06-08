locals {
  module_tags = {
    tf_module = "iam-role"
  }
  full_tags = merge(local.module_tags, var.tags)
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "org_data" {
  source     = "git@github.com:CPC-SCP/terraform-aws-org-data-fetch.git"
  descriptor = var.descriptor
}
