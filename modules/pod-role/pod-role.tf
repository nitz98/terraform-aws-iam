data "aws_iam_policy_document" "main" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam:::oidc-provider/${data.aws_caller_identity.current.account_id}/oidc-provider/${module.workload_data.rosa.oidc_url}"]
    }
    condition {
      test     = "StringEquals"
      variable = "${module.workload_data.rosa.oidc_url}:sub"
      values   = formatlist("system:serviceaccount:%s", var.namespaced_service_account_names)
    }
  }
}

resource "aws_iam_role" "main" {
  name                 = "${module.workload_data.org_data.naming.base_resource_name}-role"
  tags                 = var.tags
  assume_role_policy   = data.aws_iam_policy_document.main.json
  permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_policy_name}"
}

resource "aws_iam_policy" "main" {
  count = var.role_policy_document != null ? 1 : 0

  name        = "${module.workload_data.org_data.naming.base_resource_name}-policy"
  description = "Policy for ${module.workload_data.org_data.naming.base_resource_name} role"
  policy      = var.role_policy_document
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  count = var.role_policy_document != null ? 1 : 0

  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main[0].arn
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.main.name
  policy_arn = each.key
}
