# Configuración del API Gateway
api_name = "my_api_gateway"

# Configuración de la región
region = "us-east-1" # Cambia esto a la región que necesites

# Configuración de la cola SQS
sqs_queue_name = "my_sqs_queue"
sqs_queue_arn  = "arn:aws:sqs:us-east-1:123456789012:my_sqs_queue" # Proporciona el ARN correcto

# Configuración de la función Lambda para procesar pedidos
lambda_function_name    = "order_processor"
lambda_handler          = "lambda_procesar_pedidos.lambda_handler" # Cambia según tu manejador
lambda_runtime          = "python3.8"                              # Cambia según el runtime que necesites
lambda_source_code_path = "modules/lambda_procesar_pedidos.zip"    # Ruta al archivo ZIP

# Configuración de la tabla DynamoDB
dynamodb_table_name    = "orders_table"
dynamodb_hash_key      = "order_id" # Cambia según tu clave principal
dynamodb_hash_key_type = "S"        # Cambia según el tipo de dato (S para String, N para Number)
dynamodb_tags = {
  Environment = "dev"
  Project     = "my_project"
}

# Configuración de la función Lambda para publicar en SNS
lambda_sns_function_name    = "sns_publisher"
lambda_sns_handler          = "lambda_publicar_sns.lambda_handler" # Cambia según tu manejador
lambda_sns_runtime          = "python3.8"                          # Cambia según el runtime que necesites
lambda_sns_source_code_path = "modules/lambda_publicar_sns.zip"    # Ruta al archivo ZIP

# Configuración del tema SNS
sns_topic_name         = "my_sns_topic"
sns_subscription_email = "your_email@example.com" # Cambia según tu email

# Configuración del rol de IAM
iam_role_name = "lambda_execution_role"
