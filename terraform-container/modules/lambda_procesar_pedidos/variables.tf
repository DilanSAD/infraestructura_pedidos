variable "function_name" {
  description = "Nombre de la función Lambda para procesar pedidos"
  type        = string
}

variable "runtime" {
  description = "Runtime de la función Lambda"
  type        = string
}

variable "role_arn" {
  description = "ARN del rol de IAM para la función Lambda"
  type        = string
}

variable "source_code_path" {
  description = "Ruta al archivo zip del código fuente de la función Lambda"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "handler" {
  description = "Manejador de la función Lambda"
  type        = string
}

# Agregar esta variable
variable "sqs_queue_arn" {
  description = "ARN de la cola SQS a la que se enviarán los mensajes"
  type        = string
}