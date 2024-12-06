output "role_arn" {
  description = "ARN del rol de IAM creado para Lambda"
  value       = aws_iam_role.lambda_exec.arn
}