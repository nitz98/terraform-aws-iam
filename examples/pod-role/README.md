# IAM Roles

This module presents an interface for constructing IAM Roles.  The assumeRole policy is abstracted from the user to simplify role construction by use-case.

Two use cases are supported for v0 - AWS Service Roles and IRSA Roles.

## IRSA (Pod) Role

When a POD or ROSA service account needs to utilize resources in the account use the pod-role module:

```
module "rosa_pod_role" {
  source = "git@github.com:CPC-SCP/iam-role-modules.git//pod-role"

  descriptor                       = "example-pod"
  role_policy_document             = data.aws_iam_policy_document.main.json
  namespaced_service_account_names = ["stv:stv_app_pod"]

  tags = {
    user = "example"
  }
}
```

Multiple namespaced, service-account-names can be listed.  The resulting role will allow only the specific service-account to be assume the role.

Note the format for the namespaced_service_account_names variable is <namespace>:<service_account_name>

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
