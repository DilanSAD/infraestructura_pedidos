# Bloque de configuración principal de Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Proveedor oficial de AWS
      version = "~> 4.16"       # Versión específica del proveedor
    }
  }

  required_version = ">= 1.2.0" # Versión mínima requerida de Terraform
}

# Configuración del proveedor AWS
provider "aws" {
  access_key                  = var.aws_access_key
  secret_key                  = var.aws_secret_key
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  # Configuración de endpoints para servicios LocalStack
  endpoints {
    apigateway = "http://localhost:4566"
    sqs        = "http://localhost:4566"
    lambda     = "http://localhost:4566"
    dynamodb   = "http://localhost:4566"
    sns        = "http://localhost:4566"
    iam        = "http://localhost:4566"

  }
}

# Módulos


module "api_gateway" {
  source        = "./modules/api_gateway"
  api_name      = var.api_name
  sqs_queue_arn = var.sqs_queue_arn
  region        = var.region # Asegúrate de pasar la variable region
}

module "sqs" {
  source     = "./modules/sqs"
  queue_name = var.sqs_queue_name
}

module "lambda_procesar_pedidos" {
  source              = "./modules/lambda_procesar_pedidos"
  function_name       = var.lambda_function_name
  runtime             = var.lambda_runtime
  role_arn            = module.iam.role_arn
  source_code_path    = var.lambda_source_code_path
  dynamodb_table_name = var.dynamodb_table_name
  handler             = var.lambda_handler   # Asegúrate de que esta variable esté definida en variables.tf
  sqs_queue_arn       = module.sqs.queue_arn # Asegúrate de que esta variable esté definida en variables.tf
}

module "dynamodb" {
  source        = "./modules/dynamodb"
  table_name    = var.dynamodb_table_name
  hash_key      = var.dynamodb_hash_key
  hash_key_type = var.dynamodb_hash_key_type
  tags_dynamodb = var.dynamodb_tags
}

module "lambda_publicar_sns" {
  source           = "./modules/lambda_publicar_sns"
  function_name    = var.lambda_sns_function_name
  runtime          = var.lambda_sns_runtime
  role_arn         = module.iam.role_arn
  source_code_path = var.lambda_sns_source_code_path
  handler          = var.lambda_sns_handler # Asegúrate de que esta variable esté definida en variables.tf
  sns_topic_arn    = module.sns.topic_arn   # Asegúrate de que el ARN del tema SNS esté definido
}

module "sns" {
  source             = "./modules/sns"
  topic_name         = var.sns_topic_name
  subscription_email = var.sns_subscription_email
}

module "iam" {
  source    = "./modules/iam"
  role_name = var.iam_role_name # Asegúrate de que esta variable esté definida
}