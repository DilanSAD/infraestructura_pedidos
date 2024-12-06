output "function_arn" {
  description = "ARN de la función Lambda que publica en SNS"
  value       = aws_lambda_function.sns_publisher.arn
}