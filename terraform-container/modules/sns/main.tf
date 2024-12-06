resource "aws_sns_topic" "order_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.order_topic.arn
  protocol  = "email"                # Cambiar según el protocolo deseado
  endpoint  = var.subscription_email # Cambiar por el email de suscripción
}