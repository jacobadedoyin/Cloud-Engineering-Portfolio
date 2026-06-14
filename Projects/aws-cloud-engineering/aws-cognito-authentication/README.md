# 🔐 AWS Cognito Authentication

[↩️ Back to AWS Cloud Engineering](../)  
[📁 Back to Projects Index](../../)

---

## Overview

This project secures the Serverless Notes API using Amazon Cognito — demonstrating how authentication and identity controls are applied to cloud APIs in a production-pattern way.

All endpoints are protected at the API Gateway layer. Unauthenticated requests are rejected before they reach Lambda or DynamoDB.

---

## What This Shows

- Ability to add authentication to an existing serverless API without changing application code
- Understanding of the difference between User Pools (authentication) and Identity Pools (authorisation and AWS credential issuance)
- Applying least privilege — guest access disabled, authenticated users only
- Token-based API security using Cognito ID tokens passed via Authorization header
- End-to-end thinking — from user directory to API protection to live testing

---

## Cognito User Pool

A user directory with email sign-in. Controls who can authenticate.

![User Pool](../../../assets/aws-cloud-engineering/aws-cognito-authentication/01-user-pool.jpeg)

![Test User](../../../assets/aws-cloud-engineering/aws-cognito-authentication/02-test-user.jpeg)

---

## Identity Pool

Issues temporary AWS credentials to authenticated users only. Guest access explicitly disabled — enforcing least privilege at the identity layer.

![Identity Pool](../../../assets/aws-cloud-engineering/aws-cognito-authentication/03-identity-pool.jpeg)

---

## Identity Provider Trust

The User Pool is configured as the trusted identity source. Only tokens issued by this pool are accepted.

![Identity Provider Trust](../../../assets/aws-cloud-engineering/aws-cognito-authentication/04-identity-provider-trust.jpeg)

---

## API Gateway Authorizer

Cognito authorizer attached to all routes — GET, POST, and DELETE. Requests without a valid token are blocked before reaching any backend resource.

![API Authorizer](../../../assets/aws-cloud-engineering/aws-cognito-authentication/05-api-authorizer.jpeg)

---

## Production Deployment

API redeployed to the prod stage with authentication enforced across all endpoints.

![API Deployment](../../../assets/aws-cloud-engineering/aws-cognito-authentication/06-api-deployment.jpeg)

---

## Security Validation

### Unauthenticated Request — Blocked

No token provided. API Gateway rejects the request at the authorizer layer — Lambda and DynamoDB are never reached.

![Unauthenticated Denied](../../../assets/aws-cloud-engineering/aws-cognito-authentication/07-unauthenticated-denied.jpeg)

### Authenticated Request — Approved

Valid Cognito ID token passed in the Authorization header. Request succeeds and data is returned.

![Authenticated Success](../../../assets/aws-cloud-engineering/aws-cognito-authentication/08-authenticated-success.png)

---

## Engineering Considerations

- Token expiry is 1 hour — a production implementation would use refresh tokens or a token management library
- The test user email is unverified — a production setup would require email verification before sign-in
- Cognito hosted UI or a frontend could be added to handle sign-in flows without CLI commands
- CloudWatch logs would capture auth failures for monitoring and alerting

---

> 🔒 Public-safe evidence only. All users and resources are lab-based. No account IDs, secrets, or production data included.
