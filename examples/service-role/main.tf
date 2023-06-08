module "service_role" {
  source = "../../modules/service-role"

  descriptor           = "example-glue"
  role_policy_document = data.aws_iam_policy_document.main.json
  aws_service_names    = ["glue"]

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
  ]

  tags = {
    user = "example"
  }
}

# provide a sample policy document - this one allows
# accessing secrets manager keys with tags referenced
# in the policy
data "aws_iam_policy_document" "main" {
  //checkov:skip=CKV_AWS_108:Ensure IAM policies does not allow data exfiltration - policy is scoped to only allow access to tagged secrets
  version = "2012-10-17"

  statement {
    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "secretsmanager:ResourceTag/MyDBTag"
      values   = ["my-stv-app-db"]
    }

    sid = "AllowUseTaggedSecrets"
  }
}
