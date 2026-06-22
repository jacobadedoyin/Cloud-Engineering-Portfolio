from aws_cdk import (
    Stack,
    CfnOutput,
    RemovalPolicy,
    aws_dynamodb as dynamodb,
    aws_lambda as _lambda,
    aws_apigateway as apigateway,
)
from constructs import Construct
from pathlib import Path


class CdkStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        project_root = Path(__file__).resolve().parents[3]
        handlers_path = project_root / "backend" / "handlers"

        notes_table = dynamodb.Table(
            self,
            "NotesTable",
            partition_key=dynamodb.Attribute(
                name="id",
                type=dynamodb.AttributeType.STRING,
            ),
            billing_mode=dynamodb.BillingMode.PAY_PER_REQUEST,
            removal_policy=RemovalPolicy.DESTROY,
        )

        create_note_function = _lambda.Function(
            self,
            "CreateNoteFunction",
            runtime=_lambda.Runtime.PYTHON_3_12,
            handler="create_note.handler",
            code=_lambda.Code.from_asset(str(handlers_path)),
            environment={
                "TABLE_NAME": notes_table.table_name,
            },
        )

        get_notes_function = _lambda.Function(
            self,
            "GetNotesFunction",
            runtime=_lambda.Runtime.PYTHON_3_12,
            handler="get_notes.handler",
            code=_lambda.Code.from_asset(str(handlers_path)),
            environment={
                "TABLE_NAME": notes_table.table_name,
            },
        )

        delete_note_function = _lambda.Function(
            self,
            "DeleteNoteFunction",
            runtime=_lambda.Runtime.PYTHON_3_12,
            handler="delete_note.handler",
            code=_lambda.Code.from_asset(str(handlers_path)),
            environment={
                "TABLE_NAME": notes_table.table_name,
            },
        )

        notes_table.grant_write_data(create_note_function)
        notes_table.grant_read_data(get_notes_function)
        notes_table.grant_write_data(delete_note_function)

        api = apigateway.RestApi(
            self,
            "NotesApi",
            rest_api_name="Secure Serverless Notes API",
            description="A serverless notes API built with API Gateway, Lambda, and DynamoDB",
        )

        notes = api.root.add_resource("notes")
        notes.add_method("POST", apigateway.LambdaIntegration(create_note_function))
        notes.add_method("GET", apigateway.LambdaIntegration(get_notes_function))

        note_by_id = notes.add_resource("{id}")
        note_by_id.add_method("DELETE", apigateway.LambdaIntegration(delete_note_function))

        CfnOutput(
            self,
            "ApiUrl",
            value=api.url,
        )
