# Salidas
output "sqs_queue_url" {
  value = module.sqs.queue_url
}

output "api_gateway_id" {
  value = module.api_gateway.api_id
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "sns_topic_arn" {
  value = module.sns.topic_arn
}

output "iam_role_arn" {
  value = module.iam.role_arn
}