# AWS Secure Serverless Notes API

A small AWS serverless project demonstrating cloud engineering, infrastructure as code, API deployment, and managed database integration.

## Overview

This project deploys a Python-based notes API using AWS CDK, API Gateway, Lambda, DynamoDB, IAM, CloudWatch, and CloudFormation.

The API supports basic note operations:

- Create notes
- View notes
- Delete notes

## Architecture

Client / curl → API Gateway → Lambda → DynamoDB

## AWS Services Used

- **AWS CDK** — Infrastructure as code
- **API Gateway** — REST API endpoints
- **AWS Lambda** — Python backend logic
- **DynamoDB** — Notes database
- **IAM** — Lambda permissions
- **CloudWatch** — Logs and operational evidence
- **CloudFormation** — Stack deployment

## Evidence Screenshots

### CDK Deployment

![CDK deployment](../../../assets/aws-cloud-engineering/aws-secure-serverless-application/cdk-deploy.png)

### API POST Success

![API POST success](../../../assets/aws-cloud-engineering/aws-secure-serverless-application/api-post-success.png)

### DynamoDB Item Stored

![DynamoDB item stored](../../../assets/aws-cloud-engineering/aws-secure-serverless-application/dynamodb-notes-table-item-stored.png)

## Evidence Demonstrated

- **Cloud Engineering** — Deployed a working AWS serverless API
- **Infrastructure as Code** — Used AWS CDK in Python
- **Serverless Compute** — Built Python Lambda functions
- **API Management** — Exposed endpoints through API Gateway
- **Data Storage** — Stored records in DynamoDB
- **IAM Security** — Granted Lambda DynamoDB access only
- **Monitoring** — Used CloudWatch logging
- **Cost Awareness** — Used serverless pay-per-use services

## Public-Safe Evidence

This repository contains public-safe evidence only. It excludes secrets, access keys, confidential data, client information, production records, and sensitive operational details.

## Future Improvements

- Add Cognito authentication
- Add user-specific note access
- Add CloudWatch alarms
- Add GitHub Actions deployment
- Add S3 and CloudFront frontend hosting
