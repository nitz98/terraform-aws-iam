module "service_role" {
  source = "../../modules/service-role"

  descriptor         = "dms-vpc-role"
  aws_service_names  = ["dms"]
  role_name_override = true

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole",
  ]

  tags = {
    user = "example"
  }
}
