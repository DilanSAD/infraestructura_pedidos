output "topic_arn" {
  description = "ARN del tema SNS creado"
  value       = aws_sns_topic.order_topic.arn
}