variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN de la cola SQS a la que se enviarán los mensajes"
  type        = string
}

variable "region" {
  description = "Región de AWS en la que se desplegarán los recursos."
  type        = string
}
