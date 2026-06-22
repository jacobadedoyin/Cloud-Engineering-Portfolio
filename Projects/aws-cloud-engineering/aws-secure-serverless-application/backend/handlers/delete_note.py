import json
import os

import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def handler(event, context):
    try:
        note_id = event.get("pathParameters", {}).get("id")

        if not note_id:
            return {
                "statusCode": 400,
                "body": json.dumps({"message": "Note ID is required"}),
            }

        table.delete_item(Key={"id": note_id})

        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Note deleted"}),
        }

    except Exception:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Could not delete note"}),
        }
