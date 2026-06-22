import json
import os

import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def handler(event, context):
    try:
        response = table.scan()

        return {
            "statusCode": 200,
            "body": json.dumps(response.get("Items", [])),
        }

    except Exception:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Could not fetch notes"}),
        }
