# terraform-container/modules/lambda_publicar_sns/main.tf

resource "aws_lambda_function" "sns_publisher" {
  function_name    = var.function_name
  handler          = "lambda_publicar_sns.lambda_handler" # Nombre del archivo y función
  runtime          = var.runtime
  role             = var.role_arn
  source_code_hash = filebase64sha256(var.source_code_path)

  # Especificar el archivo ZIP que contiene el código de la función
  filename = var.source_code_path # Ruta al archivo ZIP

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_topic_arn # ARN del tema SNS
    }
  }
}