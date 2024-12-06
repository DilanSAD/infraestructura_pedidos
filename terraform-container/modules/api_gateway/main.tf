resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_name
  description = "API para procesar pedidos"
}

resource "aws_api_gateway_resource" "orders" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "orders"
}

resource "aws_api_gateway_method" "post_order" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "POST"
  authorization = "AWS_IAM" # Cambiar según la autenticación deseada
  request_models = {
    "application/json" = aws_api_gateway_model.order_model.name
  }
}

resource "aws_api_gateway_model" "order_model" {
  rest_api_id  = aws_api_gateway_rest_api.api.id
  name         = "OrderModel"
  content_type = "application/json"
  schema = jsonencode({
    type = "object"
    properties = {
      order_id = { type = "string" }
      item     = { type = "string" }
      quantity = { type = "integer" }
    }
  })
}

resource "aws_api_gateway_integration" "sqs_integration" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.orders.id
  http_method = aws_api_gateway_method.post_order.http_method

  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.region}:sqs:action/SendMessage"
}