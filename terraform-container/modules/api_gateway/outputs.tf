output "api_id" {
  description = "ID del API Gateway creado"
  value       = aws_api_gateway_rest_api.api.id
}

output "api_endpoint" {
  description = "Endpoint del API Gateway"
  value       = "${aws_api_gateway_rest_api.api.execution_arn}/*"
}

output "resource_id" {
  description = "ID del recurso creado en el API"
  value       = aws_api_gateway_resource.orders.id
}

output "sqs_queue_arn" {
  description = "ARN de la cola SQS utilizada por el API Gateway"
  value       = var.sqs_queue_arn
}