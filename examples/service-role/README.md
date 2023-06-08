# IAM Roles

This module presents an interface for constructing IAM Roles.  The assumeRole policy is abstracted from the user to simplify role construction by use-case.

Two use cases are supported for v0 - AWS Service Roles and IRSA Roles.

## AWS Service Roles

When a service role is needed for an AWS service, use the service-role module:

```
module "aws_service_role" {
  source = "git@github.com:CPC-SCP/terraform-aws-iam//service-role"

  descriptor           = "example-glue"
  role_policy_document = data.aws_iam_policy_document.main.json
  aws_service_names    = ["glue"]

  tags = {
    user = "example"
  }
}
```

Multiple service names can be listed.  The resulting role will allow only the `<aws-service-name>.amazonaws.com` to assume the role.

Regional and sub-service-names are supported as a result:
e.g.:
```
<codedeploy.ca-central-1>.amazonaws.com
<streams.metrics.cloudwatch>.amazonaws.com
```

## Passing in Role Policies

See the example for construction of an iam policy that has been passed in.  The role_policy_document is expecting a json string:

```
data "aws_iam_policy_document" "main" {
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

module "service-role" {
    ...
    role_policy_document = data.aws_iam_policy_document.main.json
    ...
}
```
