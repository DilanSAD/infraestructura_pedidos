import json
import boto3
import os

def lambda_handler(event, context):
    # Obtener el ARN del tema SNS desde las variables de entorno
    sns_topic_arn = os.environ['SNS_TOPIC_ARN']
    sns_client = boto3.client('sns')

    # Publicar un mensaje en el tema SNS
    for record in event['Records']:
        message = json.loads(record['body'])
        order_id = message['order_id']
        
        # Publicar el mensaje
        sns_client.publish(
            TopicArn=sns_topic_arn,
            Message=json.dumps({'order_id': order_id}),
            Subject='Nuevo Pedido Procesado'
        )

    return {
        'statusCode': 200,
        'body': json.dumps('Mensaje publicado en SNS con éxito')
    }