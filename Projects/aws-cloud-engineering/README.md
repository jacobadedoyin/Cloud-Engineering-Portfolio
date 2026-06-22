# 🟧 AWS Cloud Engineering

[↩️ Back to Projects Index](../)

---

## Section Overview

This section contains AWS cloud engineering evidence focused on serverless architecture, infrastructure as code, API security, managed databases, IAM permissions, and operational logging.

> 🎓 AWS Cloud Practitioner certification currently underway.

---
## Projects
<table>
  <tr>
    <th align="left" width="320">Project</th>
    <th align="left">Engineering Capability Demonstrated</th>
    <th align="left">Skills</th>
  </tr>
  <tr>
    <td align="left" width="320">
      🟧 <strong><a href="aws-secure-serverless-application">AWS Secure Serverless Notes API</a></strong>
    </td>
    <td align="left">
      Serverless REST API built with AWS CDK deploying API Gateway, Lambda, and DynamoDB with IAM least-privilege execution roles, CloudWatch logging, and cost-aware architecture decisions enforced at the infrastructure layer.
    </td>
    <td align="left">
      <code>AWS CDK</code> <code>Lambda</code> <code>API Gateway</code> <code>DynamoDB</code> <code>IAM</code> <code>CloudWatch</code>
    </td>
  </tr>
  <tr>
    <td align="left" width="320">
      🔐 <strong><a href="aws-cognito-authentication">AWS Cognito Authentication</a></strong>
    </td>
    <td align="left">
      Token-based authentication layer using Cognito User Pool and Identity Pool with federated identity trust, API Gateway Lambda authorizer, and IAM role assignment scoped to authenticated users.
    </td>
    <td align="left">
      <code>Cognito</code> <code>API Gateway</code> <code>IAM</code> <code>OAuth 2.0</code> <code>JWT</code> <code>Lambda</code>
    </td>
  </tr>
  <tr>
  <td align="left" width="320">
    🚀 <strong><a href="aws-cicd-deployment-pipeline">Automated CDK Deployment Pipeline</a></strong>
  </td>
  <td align="left">
    CI/CD pipeline using GitHub Actions to test, validate, and deploy the CDK stack on every change, authenticating to AWS through a federated IAM identity instead of stored access keys.
  </td>
  <td align="left">
    <code>AWS CDK</code> <code>GitHub Actions</code> <code>OIDC</code> <code>IAM</code> <code>CloudFormation</code> <code>CI/CD</code>
  </td>
</tr>
</table>

---

> 🔒 All evidence is public-safe, sanitised, and lab-based. No account IDs, secrets, or production data are included.
