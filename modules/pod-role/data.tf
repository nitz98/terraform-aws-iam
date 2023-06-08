locals {
  module_tags = {
    tf_module = "iam-role"
  }
  full_tags = merge(local.module_tags, var.tags)
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "workload_data" {
  source     = "git@github.com:CPC-SCP/terraform-aws-org-data-fetch.git//workload-data"
  descriptor = var.descriptor
}
