# IAM Roles - Service Role

This module presents an interface for constructing a service IAM Role. The assumeRole policy is abstracted from the user to simplify role construction by use-case.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_org_data"></a> [org\_data](#module\_org\_data) | git@github.com:CPC-SCP/terraform-aws-org-data-fetch.git | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_names"></a> [aws\_service\_names](#input\_aws\_service\_names) | e.g. ["lambda"] - The AWS service name(s) that will assume this role | `list(string)` | n/a | yes |
| <a name="input_descriptor"></a> [descriptor](#input\_descriptor) | Descriptor of the IAM role to append to base name | `string` | n/a | yes |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | A list of managed policies to attach to the role | `list(string)` | `[]` | no |
| <a name="input_permissions_boundary_policy_name"></a> [permissions\_boundary\_policy\_name](#input\_permissions\_boundary\_policy\_name) | The name of the permissions boundary policy to apply to the role | `string` | `"iep-permissions-boundary-policy"` | no |
| <a name="input_role_policy_document"></a> [role\_policy\_document](#input\_role\_policy\_document) | JSON role policy document that will be attached to this role | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resulting resource(s) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | n/a |
<!-- END_TF_DOCS -->
