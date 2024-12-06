output "queue_url" {
  description = "URL de la cola SQS creada"
  value       = aws_sqs_queue.order_queue.id
}

output "queue_arn" {
  description = "ARN de la cola SQS creada"
  value       = aws_sqs_queue.order_queue.arn
}