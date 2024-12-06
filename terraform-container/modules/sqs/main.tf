resource "aws_sqs_queue" "order_queue" {
  name = var.queue_name
}