output "iam_role" {
  sensitive = true
  value     = module.pod_role.iam_role
}
