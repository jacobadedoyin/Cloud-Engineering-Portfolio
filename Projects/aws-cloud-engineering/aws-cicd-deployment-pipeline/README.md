# 🚀 Automated CDK Deployment Pipeline

[↩️ Back to AWS Cloud Engineering](../README.md)

## Overview

A CI/CD pipeline that automates deployment of the [AWS Secure Serverless Notes API](../aws-secure-serverless-application/) using GitHub Actions and the AWS CDK. Every change triggers an automated pipeline that installs dependencies, runs unit tests, validates the infrastructure template, and deploys to AWS — authenticating with short-lived federated credentials instead of static access keys.

<table>
  <tr>
    <th align="left" width="160">Area</th>
    <th align="left">Summary</th>
  </tr>
  <tr>
    <td><strong>Problem</strong></td>
    <td>Manual infrastructure deployments are inconsistent, undocumented, and typically rely on long-lived AWS credentials stored on a developer machine.</td>
  </tr>
  <tr>
    <td><strong>Action</strong></td>
    <td>Built a GitHub Actions pipeline that tests, validates, and deploys the CDK stack automatically, authenticating to AWS via a federated OIDC identity instead of stored access keys.</td>
  </tr>
  <tr>
    <td><strong>Tools / Evidence</strong></td>
    <td>GitHub Actions, AWS CDK, IAM OIDC identity provider, CloudFormation, pytest, pipeline run logs, AWS Console deployment confirmation.</td>
  </tr>
  <tr>
    <td><strong>Control Value</strong></td>
    <td>Removes long-lived credentials from the deployment process, blocks deployment on failing tests, restricts deployment trust to a specific repository and branch, and produces an auditable deployment history.</td>
  </tr>
  <tr>
    <td><strong>Public-Safe Evidence</strong></td>
    <td>Pipeline run and console screenshots, with account identifiers removed.</td>
  </tr>
</table>

## Pipeline Stages

1. **Checkout & environment setup** — clones the repository, installs Python 3.12
2. **Dependency installation** — installs CDK and test dependencies
3. **AWS authentication** — assumes an IAM role via OpenID Connect (OIDC); no stored credentials
4. **Unit tests** — runs `pytest` against the stack definition; failing tests block deployment
5. **CDK synth** — compiles and validates the CloudFormation template before touching live infrastructure
6. **CDK deploy** — deploys the validated stack to AWS

## Key Engineering Decisions

**OIDC over static access keys.** The pipeline authenticates via an IAM identity provider trusting `token.actions.githubusercontent.com`, exchanging a short-lived GitHub token for temporary AWS credentials at runtime — eliminating the risk of a leaked or stale access key.

**Trust policy scoped to a specific repository and branch.** The IAM role's trust relationship only accepts requests from this exact repository on `main`, so a fork or unrelated branch cannot assume the role even with the role ARN.

**Test-before-deploy gating.** Unit tests run before `cdk synth`/`cdk deploy`, catching a broken stack definition before any AWS API calls are made.

**Path-filtered triggers.** The workflow only runs on changes within the Notes API project folder, so unrelated commits elsewhere in the portfolio don't trigger unnecessary AWS deployments.

## Lab Evidence

<p align="center">
  <img src="https://raw.githubusercontent.com/jacobadedoyin/Cloud-Engineering-Portfolio/main/assets/aws-cloud-engineering/aws-cicd-deployment-pipeline/github_actions_deploy_success.png" alt="GitHub Actions pipeline run succeeded" width="700">
  <br>
  <em>GitHub Actions confirming the pipeline completed successfully</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/jacobadedoyin/Cloud-Engineering-Portfolio/main/assets/aws-cloud-engineering/aws-cicd-deployment-pipeline/aws_cdkstack_update_complete.png" alt="AWS Console confirming successful stack deployment" width="700">
  <br>
  <em>AWS Console showing the CloudFormation stack reached "Update complete"</em>
</p>

## Skills Demonstrated

`AWS CDK` `GitHub Actions` `OIDC` `IAM` `CloudFormation` `CI/CD` `Infrastructure as Code`

🔒 All evidence is public-safe, sanitised, and lab-based. No account IDs, secrets, or production data are included.
