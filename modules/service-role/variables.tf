variable "aws_service_names" {
  type        = list(string)
  description = "e.g. [\"lambda\"] - The AWS service name(s) that will assume this role"
}

variable "descriptor" {
  description = "Descriptor of the IAM role"
  type        = string
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "A list of managed policies to attach to the role"
  default     = []
}

variable "permissions_boundary_policy_name" {
  type        = string
  description = "The name of the permissions boundary policy to apply to the role"
  default     = "iep-permissions-boundary-policy"
}

variable "role_policy_document" {
  type        = string
  description = "JSON role policy document that will be attached to this role"
  default     = null
}

variable "role_name_override" {
  type        = bool
  description = "Allow the value for 'descriptor' to be used as the role name without the base name prefix"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resulting resource(s)"
  default     = {}
}
