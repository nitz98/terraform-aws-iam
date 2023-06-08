variable "descriptor" {
  description = "Descriptor of the IAM role to append to base name"
  type        = string
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "A list of managed policies to attach to the role"
  default     = []
}

variable "namespaced_service_account_names" {
  type        = list(string)
  description = "e.g.: [\"stv:stv_app_name\"] - The namespaced service account that will assume this role"

  validation {
    condition = alltrue([
      for v in var.namespaced_service_account_names : can(regex("[[:alnum:]-_]+:[[:alnum:]-_]+", v))
    ])
    error_message = "Format of namespaced_service_account_name is <namespace>:<service_account_name>"
  }
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

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resulting resource(s)"
  default     = {}
}
