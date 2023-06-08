output "iam_role" {
  value = {
    managed_policy_arns = aws_iam_role_policy_attachment.managed
    policy              = aws_iam_policy.main
    role                = aws_iam_role.main
  }
}
