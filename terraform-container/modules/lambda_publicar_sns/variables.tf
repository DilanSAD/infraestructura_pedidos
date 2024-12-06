variable "function_name" {
  description = "Nombre de la función Lambda para publicar en SNS"
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

variable "handler" {
  description = "Manejador de la función Lambda SNS"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN del tema SNS al que se publicará"
  type        = string
}