variable "aws_access_key" {
  description = "Clave de acceso de AWS"
  type        = string
}

variable "aws_secret_key" {
  description = "Clave secreta de AWS"
  type        = string
}

variable "region" {
  description = "La región de AWS donde se desplegarán los recursos"
  type        = string
}

variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "sqs_queue_name" {
  description = "Nombre de la cola SQS"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN de la cola SQS a la que se enviarán los mensajes"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda para procesar pedidos"
  type        = string
}

variable "lambda_handler" {
  description = "Manejador de la función Lambda"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime de la función Lambda"
  type        = string
}

variable "lambda_source_code_path" {
  description = "Ruta al archivo zip del código fuente de la función Lambda"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "dynamodb_hash_key" {
  description = "Clave principal de la tabla DynamoDB"
  type        = string
}

variable "dynamodb_hash_key_type" {
  description = "Tipo de dato de la clave principal (S para String, N para Number)"
  type        = string
  default     = "S"
}

variable "dynamodb_tags" {
  description = "Etiquetas adicionales para la tabla DynamoDB"
  type        = map(string)
  default     = {}
}

variable "lambda_sns_function_name" {
  description = "Nombre de la función Lambda para publicar en SNS"
  type        = string
}

variable "lambda_sns_handler" {
  description = "Manejador de la función Lambda SNS"
  type        = string
}

variable "lambda_sns_runtime" {
  description = "Runtime de la función Lambda SNS"
  type        = string
}

variable "lambda_sns_source_code_path" {
  description = "Ruta al archivo zip del código fuente de la función Lambda SNS"
  type        = string
}

variable "sns_topic_name" {
  description = "Nombre del tema SNS"
  type        = string
}

variable "sns_subscription_email" {
  description = "Email para la suscripción al tema SNS"
  type        = string
}

variable "iam_role_name" {
  description = "Nombre del rol de IAM para Lambda"
  type        = string
}
