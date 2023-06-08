data "aws_iam_policy_document" "main" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = formatlist("%s.amazonaws.com", var.aws_service_names)
    }
  }
}

resource "aws_iam_role" "main" {
  name                 = var.role_name_override ? var.descriptor : "${module.org_data.naming.base_resource_name}-role"
  tags                 = var.tags
  assume_role_policy   = data.aws_iam_policy_document.main.json
  permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_policy_name}"

  lifecycle {
    precondition {
      condition = (
        var.role_name_override
        && contains(
          [
            "dms-cloudwatch-logs-role",
            "dms-vpc-role",
          ],
        var.descriptor)
      ) || !var.role_name_override
      error_message = "'role_name_override' was specified but the value provided for 'descriptor' is not in the acceptable list."
    }
  }
}

resource "aws_iam_policy" "main" {
  count = var.role_policy_document != null ? 1 : 0

  name        = "${module.org_data.naming.base_resource_name}-policy"
  description = "Policy for ${module.org_data.naming.base_resource_name} role"
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
