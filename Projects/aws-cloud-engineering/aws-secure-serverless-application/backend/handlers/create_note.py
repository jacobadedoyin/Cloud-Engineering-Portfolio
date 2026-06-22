import json
import os
import uuid
from datetime import datetime, timezone

import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def handler(event, context):
    try:
        body = json.loads(event.get("body") or "{}")

        if not body.get("title") or not body.get("content"):
            return {
                "statusCode": 400,
                "body": json.dumps({"message": "Title and content are required"}),
            }

        note = {
            "id": str(uuid.uuid4()),
            "title": body["title"],
            "content": body["content"],
            "createdAt": datetime.now(timezone.utc).isoformat(),
        }

        table.put_item(Item=note)

        return {
            "statusCode": 201,
            "body": json.dumps(note),
        }

    except Exception:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Could not create note"}),
        }
