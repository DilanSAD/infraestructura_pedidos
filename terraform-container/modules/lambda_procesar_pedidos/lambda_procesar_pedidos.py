import json
import boto3
import os

def lambda_handler(event, context):
    # Obtener el nombre de la tabla DynamoDB desde las variables de entorno
    dynamodb_table = os.environ['DYNAMODB_TABLE']
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(dynamodb_table)

    # Procesar el evento (ejemplo: guardar un pedido)
    for record in event['Records']:
        # Aquí puedes procesar el mensaje de SQS
        message = json.loads(record['body'])
        order_id = message['order_id']
        item = message['item']
        quantity = message['quantity']

        # Guardar el pedido en DynamoDB
        table.put_item(
            Item={
                'order_id': order_id,
                'item': item,
                'quantity': quantity
            }
        )

    return {
        'statusCode': 200,
        'body': json.dumps('Pedido procesado con éxito')
    }