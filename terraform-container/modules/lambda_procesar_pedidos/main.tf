resource "aws_lambda_function" "order_processor" {
  function_name    = var.function_name
  handler          = "lambda_procesar_pedidos.lambda_handler" # Nombre del archivo y función
  runtime          = var.runtime
  role             = var.role_arn
  source_code_hash = filebase64sha256(var.source_code_path)

  # Especificar el archivo ZIP que contiene el código de la función
  filename = var.source_code_path # Ruta al archivo ZIP

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name # Nombre de la tabla DynamoDB
    }
  }
}